I began with creating my directory and files needed.  (mkdir blah && cd "$_")
I initalized a git hub repo running the command git init

Venv and Pip
Without isolation on your machine for packages, all your packages go to a centralized location. This is not good because if you have multiple projects requring the same package but different versions, projects break. There is more to it, but the solution is:
VenV
venv creates a self-contained folder with its own Python interpreter and its own site-packages (where libraries get installed). When it's "activated," your shell temporarily points python and pip at that folder instead of the system-wide install.

To begin
Run python/python3 -m venv venv

this creates the venv folder that you need. 

source venv/bin/activate
This activates the venv session, where pip and the intereperter is pionted to one the in the isolated env (venv)

deactivate 


pip
pip installs packages from PyPI (Python's package index) into whatever environment is currently active.

If you're inside an activated venv, this installs only into that venv. If you forgot to activate, it installs globally (or fails with a permissions error on some systems) — a classic beginner mistake worth experiencing once so you recognize the symptom.
common commands
pip install package_name

pip list

pip freeze > file_name.txt (common name is requirements.txt)
This writes out exact versions of everything currently installed, e.g.:

WHY? Anyone (or any Docker build) can then recreate your exact environment with:
pip install -r requirements.txt
This is the real point of requirements.txt — it's a contract describing "this is what you need installed for this code to run," and it's why Dockerfiles almost always have a line like COPY requirements.txt . && pip install -r requirements.txt before copying the rest of the app code.

python and python3 are symlinks pointing at the same actual binary, python3.13. There's no real difference between them in this venv at all; they're just two names for the same file, for compatibility with whichever habit/script expects which name.


IMPORTANT
One practical habit worth building immediately: add venv/ to your .gitignore now if you haven't, since you're about to start committing this folder to git. The venv folder is machine-specific (full paths are baked into some of its scripts — you can see your absolute path in that which output) and shouldn't ever be committed; only requirements.txt should be checked in.


ABOUT VENV SYMLINKS
Exactly what you'd expect — both `python` and `python3` are symlinks pointing at the same actual binary, `python3.13`. There's no real difference between them in this venv at all; they're just two names for the same file, for compatibility with whichever habit/script expects which name.

If you go one step further:

```bash
ls -la venv/bin/python3.13
```

You'll likely find *that* is also a symlink — pointing back out to wherever your system's actual Python 3.13 interpreter lives (e.g. something under `/usr/local/bin/` or `/opt/homebrew/...` if you installed via Homebrew, or `/Library/Frameworks/Python.framework/...` if from python.org). The venv doesn't copy the whole interpreter — it's mostly just symlinks back to your real install, plus its own private `site-packages` folder for libraries and a few activation scripts. That's why creating a venv is instant and cheap — you're not duplicating Python itself, just creating an isolated *namespace* for packages with some redirecting symlinks.

That's actually the whole trick of venv in one sentence: **same interpreter, isolated library folder.**

Good place to move on. Let's write `server.py` — want it to just serve `data/` as a static directory (closest to today's literal task), or do you want something slightly more custom (e.g. printing a log line per request) so there's a bit more to look at when you demo it?

=================================================================================================================================================================================


BUILDING THE PROJECT
https://www.youtube.com/watch?v=DeFST8tvtuI


To run python http.server we run 
python -m http.server
When navigating to localhost:8000, I see it just list the files and folders of the cwd. It can render files when you click on them. 
You can spin up a http server, then a computer in you LAN can go to it and I believe you can download files!
wget to get the files. 

IMPORTANT: If you want to host this on your network, and want other computers to connect to it, you must specify that computer ip adress, not local host(that is your machine)

getting your IP and hosting
run ipconfig and get ipv4: ipconfig getifaddr en0
run the server: python -m http.server 9999 -bind / -b XXX.XXX.XXX.XXX

it will say Serving HTTP on 192.168.0.93 port 9999 (http://192.168.0.93:9999/) ..., just use that address on the other computer in your LAN. 
this is a private ip, so only will work locally!


A web server serves files relative to a root directory.
URLs are translated into file paths.
If no index.html exists in a directory, Python's http.server shows a directory listing.

pip is the tool that installs packages, not a dependency of your application.

