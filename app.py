from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

class StaticFileHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory="static", **kwargs)
    
    def end_headers(self):
        self.send_header('Cache-Control', 'no-cache')
        super().end_headers()

if __name__ == "__main__":
    # Créer le dossier static s'il n'existe pas
    os.makedirs("static", exist_ok=True)
    
    server = HTTPServer(('0.0.0.0', 8080), StaticFileHandler)
    print("Server started on port 8080...")
    print("Serving files from ./static directory")
    server.serve_forever()
