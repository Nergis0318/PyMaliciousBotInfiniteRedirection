import secrets
from fastapi import FastAPI
from fastapi.responses import RedirectResponse

app = FastAPI()

@app.get("/{full_path:path}")
async def catch_all_and_redirect(full_path: str):
    random_string = secrets.token_urlsafe(8)
    print(f"요청 수신: /{full_path} -> 리디렉션: /{random_string}")
    return RedirectResponse(url=f"/{random_string}")
