from pydantic import BaseModel

class JournalEntry(BaseModel):
    title: str
    content: str