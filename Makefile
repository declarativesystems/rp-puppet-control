onceover:
	find . -name '*.yaml' -not -path './.onceover/*' -exec ruby -ryaml -e "YAML.load_file '"{}"' " \;
	r10k puppetfile check
	cat Puppetfile > Puppetfile.onceover
	cat Puppetfile.mock >> Puppetfile.onceover
	bundle exec onceover run spec --puppetfile Puppetfile.onceover
