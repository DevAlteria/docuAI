import sys
from pydub import AudioSegment
import speech_recognition as sr

def oga2wav(ofn):
    wfn = ofn.replace('.oga','.wav')
    x = AudioSegment.from_file(ofn)
    x.export(wfn, format='wav')

r = sr.Recognizer()

if (len(sys.argv) != 2):
    exit (1)

file = sys.argv[1].replace('.oga', '.wav')

oga2wav(sys.argv[1])

file_audio = sr.AudioFile(file)

with file_audio as source:
   audio_text = r.record(source)

print(r.recognize_google(audio_text,language='es-ES'))

