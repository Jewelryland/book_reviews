from system.core.controller import *
from flask import redirect, request, flash

class Reviews(Controller):
    def __init__(self,action):
        super(Reviews, self).__init__(action)
        self.load_model('Review')

    def new(self):
        return self.load_view('/review_new.html')

    def create(self):
        book_info = request.form
        user_id = session['id']
        result = self.models['Review'].create_book(user_id,book_info)
        return redirect('/review/'+str(result))

    def show(self, id):
        #showing info of book and its reviews
        book_id = id
        book_info = self.models['Review'].book_info(book_id)
        reviews = self.models['Review'].get_reviews(book_id)
        return self.load_view('/review_show.html', book_info = book_info, reviews = reviews, id=id)

    def update(self, id):
        user_id = session['id']
        book_id = id
        info = request.form
        reviews = self.models['Review'].add_reviews(user_id, book_id, info)
        return redirect('/review/'+str(reviews))

    def destroy(self, id):
        review_id = id
        delete_review = self.models['Review'].destroy(review_id)
        return redirect('/review/'+str(delete_review))

    