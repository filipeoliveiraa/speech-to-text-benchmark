import pytest
import requests

@pytest.mark.api
def test_whisper_asr_call():
    url = 'http://127.0.0.1:9000/asr'
    file = {'audio_file':open(r"C:\dvsGit\speech-to-text-benchmark\data\LibriSpeech\test-clean\61\70968\61-70968-0000.flac", 'rb'),'language': 'en'}

    # response_status, response_content = analyze(request_body)

    expected_response = """
    HE BEGAN A CONFUSED COMPLAINT AGAINST THE WIZARD WHO HAD VANISHED BEHIND THE CURTAIN ON THE LEFT
    """
    resp = requests.post(url=url, files = file) 
    print(resp.text)
    assert resp.status_code == 200
    # assert expected_response.lower() == resp.text.lower().replace('\n','')
