export BUILDKITE = false
export BUILDKITE_ORGANIZATION_SLUG = rokerlabs
export BUILDKITE_PIPELINE_SLUG = semantic-release

build:
	.buildkite/bin/build
	docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock:ro -v $(shell pwd):/workdir -w /workdir chef/inspec \
		exec inspec --no-distinct-exit --no-create-lockfile --chef-license=accept-silent -t docker://$$(docker run --rm -d ${BUILDKITE_ORGANIZATION_SLUG}/${BUILDKITE_PIPELINE_SLUG}:beta sleep 60);

build-exec:
	docker run --rm -it -v $(shell pwd):/workdir -w /workdir ${BUILDKITE_ORGANIZATION_SLUG}/${BUILDKITE_PIPELINE_SLUG}:beta /bin/sh -c "${COMMAND}"

install:
	yarn install --no-progress --frozen-lockfile

purge:
	rm -rf node_modules/

	for id in $$(docker images ${BUILDKITE_ORGANIZATION_SLUG}/${BUILDKITE_PIPELINE_SLUG} | awk '{if (NR != 1) {print $$3}}'); do \
		docker image rm $$id; \
	done;

	docker image prune --force

# Default to not printing commands Add VERBOSE=on to the command line to see commands
$(VERBOSE).SILENT:
.PHONY: $(VERBOSE).SILENT