from http.server import SimpleHTTPRequestHandler, HTTPServer
import os
import cgi

class FileUploadHandler(SimpleHTTPRequestHandler):
    def do_POST(self):
        # Parse the form data posted
        content_type, params = cgi.parse_header(self.headers['Content-Type'])
        if content_type == 'multipart/form-data':
            form = cgi.FieldStorage(
                fp=self.rfile,
                headers=self.headers,
                environ={'REQUEST_METHOD': 'POST'}
            )
            if "file" in form:
                # Save the uploaded file
                upload_dir = "/home/attacker/loot"  # Directory where files are saved
                os.makedirs(upload_dir, exist_ok=True)

                file_item = form["file"]
                file_path = os.path.join(upload_dir, file_item.filename)
                with open(file_path, "wb") as f:
                    f.write(file_item.file.read())

                # Send a response to the client
                self.send_response(200)
                self.end_headers()
                self.wfile.write(b"File uploaded successfully.")
            else:
                self.send_response(400)
                self.end_headers()
                self.wfile.write(b"No file uploaded.")
        else:
            self.send_response(400)
            self.end_headers()
            self.wfile.write(b"Invalid form data.")

# Set up and start the server
if __name__ == "__main__":
    server_address = ('', 5000)  # Run on port 5000
    httpd = HTTPServer(server_address, FileUploadHandler)
    print("Starting upload server on port 5000...")
    httpd.serve_forever()

