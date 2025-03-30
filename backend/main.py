import os
from fastapi import FastAPI
from supabase import create_client, Client
from pydantic import BaseModel, EmailStr
import smtplib
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Change this to your Flutter app's URL in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

SUPABASE_URL = "https://alkwerscybtruiqkstus.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsa3dlcnNjeWJ0cnVpcWtzdHVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE0NDM1NTksImV4cCI6MjA1NzAxOTU1OX0.754bIGxpqHI9k3QFWWSlXAIGLi9SVDcJePEqZT5Rnu8"

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

@app.get("/")
def read_root():
    return {"Welcome to Senya"}


