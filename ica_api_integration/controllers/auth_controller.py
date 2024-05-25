from odoo import http


class AuthController(http.Controller):
    @http.route('/api/login', type='json', auth='none', cors="*", csrf=False)
    def api_login(self, *args, **kwargs):
        username = kwargs.get('username')
        password = kwargs.get('password')
        uid = http.request.session.authenticate(http.request.session.db, username, password)
        if not uid:
            return {"message": "Login failed"}, 401
        return {"message": "Login Successful"}
