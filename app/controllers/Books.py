from system.core.controller import *
from flask import redirect, request, flash

class Books(Controller):
    def __init__(self,action):
        super(Books, self).__init__(action)
        self.load_model('Book')
    def index(self):
        return self.load_view('/index.html')
    def create(self):
        user_info = {
        'name': request.form['name'],
        'alias':request.form['alias'],
        'email': request.form['email'],
        'password':request.form['password'],
        'confirm_password':request.form['confirm_password']
        }
        user = self.models['Book'].create(user_info)
        return redirect('/')
    def show(self):
        recent_reviews = self.models['Book'].recent_reviews()
        other_reviews = self.models['Book'].other_reviews()
        return self.load_view('/show.html', recent_reviews=recent_reviews, other_reviews=other_reviews)
    def logout(self):
        session.pop=['id']
        session.pop=['name']
        return redirect('/')
    def login(self):
        login_info = {
        'login_email':request.form['login_email'],
        'login_password':request.form['login_password']
        }
        login = self.models['Book'].login(login_info)
        if login['status'] == True:
            session['id'] = login['login_status']['id']
            session['name'] = login['login_status']['name']
            return redirect('/show')
        else:
            return redirect('/')

    def add_book(self):
        #showing page to add book
        return self.load_view('/book.html')

    def process(self):
        book_info = request.form
        user_id = session['id']
        result = self.models['Book'].create_book(user_id,book_info)
        return redirect('/book/'+str(result))

    def show_book(self, id):
        #showing info of book and its reviews
        book_id = id
        book_info = self.models['Book'].book_info(book_id)
        reviews = self.models['Book'].get_reviews(book_id)
        return self.load_view('/showbook.html', book_info = book_info, reviews = reviews, id=id)
    def add_review(self, id):
        user_id = session['id']
        book_id = id
        info = request.form
        reviews = self.models['Book'].add_reviews(user_id, book_id, info)
        return redirect('/book/'+str(reviews))

    def destroy(self, id):
        review_id = id
        delete_review = self.models['Book'].destroy(review_id)
        return redirect('/book/'+str(delete_review))

    def users(self, id):
        user_id = id
        user_info = self.models['Book'].user_info(user_id)
        total_reviews = self.models['Book'].total_reviews(user_id)
        review_titles = self.models['Book'].review_titles(user_id)
        return self.load_view('/users.html', user_info = user_info, total_reviews = total_reviews, review_titles = review_titles)