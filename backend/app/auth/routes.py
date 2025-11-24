from fastapi import APIRouter
from .schemas import UserCreate

router = APIRouter()

@router.post("/register")
def register(user: UserCreate):
    return {"status": "register success", "user": user.username}

@router.post("/login")
def login(user: UserCreate):
    return {"status": "login success", "user": user.username}