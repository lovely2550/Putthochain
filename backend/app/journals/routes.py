from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def get_journals():
    return {"journals": []}