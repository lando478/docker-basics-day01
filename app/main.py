import random
from pathlib import Path
from http.server import BaseHTTPRequestHandler, HTTPServer

DATA_FILE = Path("/data/numbers.txt")

def get_random_number():
    return random.randint(1, 100)

            # dont do parent because when running docker the file will be in /data/numbers.txt which bad i guess, idk. 
      # with open(Path(__file__).parent / "data" / "numbers.txt", "a") as f:
      #     f.write(f"{number}\n")


def append_number_to_file(number):
    DATA_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(DATA_FILE, "a") as f:
        f.write(f"{number}\n")

def read_numbers_from_file():
    DATA_FILE.parent.mkdir(parents=True, exist_ok=True)
    if not DATA_FILE.exists():
        DATA_FILE.touch()

    with open(DATA_FILE, "r") as f:
        return f.read()
class RequestHandler(BaseHTTPRequestHandler):
      def do_GET(self):
            current_number = get_random_number()
            append_number_to_file(current_number)
            numbers = read_numbers_from_file()
            self.send_response(200)
            self.send_header("Content-type", "text/plain")
            self.end_headers()
            self.wfile.write(numbers.encode())


# now start the server
if __name__ == "__main__":
      server_address = ("", 8000)
      httpd = HTTPServer(server_address, RequestHandler)
      httpd.serve_forever()



# Browser hits page
#       ↓
# Generate random number
#       ↓
# Append to file
#       ↓
# Read file
#       ↓
# Return contents as HTTP 

# Then once it's working, ask:

# How do I move the file from /app/data/numbers.txt to /data/numbers.txt and mount a Docker volume there?

# That's the actual Docker lesson.