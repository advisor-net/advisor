import os

bind = ':8000'
workers = os.getenv("GUNICORN_WORKER_COUNT", 4)
worker_tmp_dir = '/var/tmp'
timeout = 60
accesslog = '-'  # stdout
access_log_format = (
    '%({X-Forwarded-For}i)s %(l)s %({user}o)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'
)
errorlog = '-'  # stdout
max_requests = 3500
max_requests_jitter = 2 * int(workers)
reload = bool(int(os.getenv("DEBUG", 0)))
