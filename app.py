from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

db = SQLAlchemy()

def create_app():

    app = Flask(__name__)

    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:3110@localhost/nutrifood'
    app.config['SECRET_KEY'] = '123'

    login_manager = LoginManager()
    login_manager.init_app(app)

    db.init_app(app)

    from models import User
    
    @login_manager.user_loader
    def load_user(user_id):
        return User.query.get(int(user_id))
    
    from main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    return app