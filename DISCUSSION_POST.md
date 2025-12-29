# GitHub Discussion Post Draft

## Where to Post
https://github.com/cboxdoerfer/fsearch/discussions/new

**Category**: Ideas (or General)

---

## Title
**Proposal: Add Docker build support for isolated/sandboxed builds**

---

## Body

### Summary
I'd like to propose adding Docker build support to FSearch. This would allow users to build the application in an isolated container without installing build dependencies on their host system.

### Motivation
While testing FSearch from source, I wanted to build it without installing all the build dependencies on my system. Docker provides a clean, isolated environment that's especially useful for:

- **Security-conscious users** building from untrusted sources
- **Testing** builds without affecting the host system
- **Reproducibility** across different systems and distributions
- **CI/CD** integration possibilities
- **New contributors** who want to test building without commitment

### Proposed Implementation

I've prepared the following:

1. **Dockerfile**
   - Uses Ubuntu 24.04 (or configurable base)
   - Includes all build dependencies (meson, GTK3, etc.)
   - Builds as non-root user for security
   - Runs tests as part of the build

2. **docker-build.sh**
   - Automated build script
   - Handles full workflow: build → test → extract binary
   - User-friendly with clear output and error messages

3. **Documentation (docs/DOCKER_BUILD.md)**
   - Quick start guide
   - Manual and automated build options
   - Installation instructions
   - Troubleshooting section
   - Security considerations

### Example Usage

```bash
# Automated
./docker-build.sh

# Manual
docker build -t fsearch-builder .
docker run --name fsearch-build fsearch-builder
docker cp fsearch-build:/build/builddir/src/fsearch ./fsearch
docker rm fsearch-build
```

### Benefits

- ✅ **Non-intrusive**: Doesn't change existing build methods
- ✅ **Optional**: Users can still build normally with meson/ninja
- ✅ **Isolated**: Build dependencies stay in container
- ✅ **Tested**: Successfully built FSearch 0.3.alpha0 on Ubuntu 24.04
- ✅ **Documented**: Complete guide with troubleshooting

### Testing Done

- Built successfully on Ubuntu 24.04 host
- Docker version 27.5.1
- Binary runs correctly with all dependencies
- Tests pass within container
- Successfully extracted and ran on host

### Questions for Maintainers

1. **Is this something you'd be interested in merging?**
2. **Any preferences on:**
   - File locations (Dockerfile in root vs docs/?)
   - Base image (Ubuntu 24.04, 22.04, Debian?)
   - Documentation location
3. **Should I include a GitHub Actions workflow for Docker builds?**
4. **Any other requirements or preferences?**

### Alternative Considerations

I'm aware FSearch is already available via Flatpak and in various distribution repos. This Docker support is:
- Complementary to existing distribution methods
- Aimed at developers and advanced users
- Useful for building from source, not for end-user installation
- Does not replace any existing packaging

### Implementation Available

I have a working implementation ready for review in my fork:
🔗 **https://github.com/lgtkgtv/fsearch/tree/add-docker-build-support**

**Files included:**
- [Dockerfile](https://github.com/lgtkgtv/fsearch/blob/add-docker-build-support/Dockerfile) - Build environment definition
- [docker-build.sh](https://github.com/lgtkgtv/fsearch/blob/add-docker-build-support/docker-build.sh) - Automated build script
- [docs/DOCKER_BUILD.md](https://github.com/lgtkgtv/fsearch/blob/add-docker-build-support/docs/DOCKER_BUILD.md) - Complete documentation

The implementation has been tested and is ready for review. You can try it yourself:
```bash
git clone https://github.com/lgtkgtv/fsearch.git -b add-docker-build-support
cd fsearch
./docker-build.sh
```

### Next Steps

If there's interest, I'm happy to:
- Submit a PR with the implementation
- Adjust based on your feedback
- Add GitHub Actions integration if desired
- Help maintain the Docker build going forward

Let me know your thoughts! I'm open to feedback and changes.

---

### Additional Context

I performed a security audit of the codebase before implementing Docker builds and found:
- ✅ No network activity
- ✅ No telemetry/tracking
- ✅ Proper input sanitization
- ✅ Clean dependency tree
- ✅ Standard build system (Meson)

This gave me confidence that FSearch is well-maintained and secure, which is why I'd like to contribute back.

