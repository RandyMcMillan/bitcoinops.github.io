PORT=$(shell curl -sS https://raw.githubusercontent.com/RandyMcMillan/random-port-generator/master/generate.sh | bash)
default:
	docker run -d --name bitcoinops-$(shell date +%s) -p $(PORT):4000 -v $(PWD):/root/bitcoinops.github.io -w /root/bitcoinops.github.io ruby:2.6.4-stretch /bin/bash -c "bundle install && make preview"
-include Makefile
