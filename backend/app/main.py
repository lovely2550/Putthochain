from fastapi import FastAPI
from app.auth.routes import router as auth_router
from app.journals.routes import router as journal_router

app = FastAPI(title="Putthochain API")

app.include_router(auth_router, prefix="/auth")
app.include_router(journal_router, prefix="/journals")

@app.get("/")
def root():
    return {"message": "Welcome to Putthochain – มีอยู่และไม่มีอยู่"}