echo "Get Test Data"
mkdir -p data
wget -nc https://www.openslr.org/resources/12/test-clean.tar.gz -P ./data/
cd data
tar -xf test-clean.tar.gz

echo "Stop and Building containers"
docker-compose down -v
docker-compose build

echo "Start Testing"
docker-compose up -d 
docker exec -it benchmark /bin/python3 benchmark.py --dataset LIBRI_SPEECH_TEST_CLEAN --dataset-folder /data/LibriSpeech/test-clean --engine WHISPER --whisper-language en