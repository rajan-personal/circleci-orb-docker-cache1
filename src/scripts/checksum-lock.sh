if [ -f "poetry.lock" ]; then
    checksum=$(md5sum poetry.lock | awk '{print $1}')
else
    checksum="none"
fi
export CHECKSUM_POETRY=$checksum

if [ -f "Gemfile.lock" ]; then
    checksum=$(md5sum Gemfile.lock | awk '{print $1}')
else
    checksum="none"
fi
export CHECKSUM_GEMFILE=$checksum