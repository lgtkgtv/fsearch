# Contribution Plan for FSearch Upstream

## Summary
Add Docker build support to enable isolated, reproducible builds without installing system dependencies.

## Changes to Contribute

### 1. New Files
- `Dockerfile` - Docker image definition for building FSearch
- `docker-build.sh` - Automated build script
- `docs/DOCKER_BUILD.md` - Comprehensive Docker build documentation

### 2. Benefits for Upstream
- **Security**: Users can build untrusted code in isolation
- **Convenience**: No need to install build dependencies on host system
- **Reproducibility**: Consistent build environment across different systems
- **Testing**: Easier to test builds on different distributions
- **CI/CD**: Can be used in automated workflows

## Git Workflow

### Step 1: Create a Feature Branch
```bash
cd /home/s/fsearch
git checkout -b add-docker-build-support
```

### Step 2: Stage the Changes
```bash
# Add the Docker build files
git add Dockerfile
git add docker-build.sh
git add docs/DOCKER_BUILD.md

# Check what will be committed
git status
```

### Step 3: Commit with Descriptive Message
```bash
git commit -m "Add Docker build support for isolated builds

- Add Dockerfile with Ubuntu 24.04 base
- Add automated docker-build.sh script
- Add comprehensive Docker build documentation
- Build runs as non-root user for security
- Includes all build dependencies and test execution

This enables users to build FSearch without installing
system dependencies, useful for testing and security-conscious
builds."
```

### Step 4: Push to Your Fork
```bash
# First, fork the repository on GitHub: https://github.com/cboxdoerfer/fsearch

# Add your fork as a remote
git remote add fork https://github.com/YOUR_USERNAME/fsearch.git

# Push the branch
git push fork add-docker-build-support
```

### Step 5: Create Pull Request

Go to: https://github.com/cboxdoerfer/fsearch/pulls

**PR Title:**
```
Add Docker build support for isolated builds
```

**PR Description:**
```markdown
## Summary
This PR adds Docker build support to FSearch, enabling users to build the application in an isolated container without installing build dependencies on their host system.

## Changes
- **Dockerfile**: Defines a build environment with all required dependencies
  - Uses Ubuntu 24.04 as base
  - Builds as non-root user for security
  - Includes test execution
- **docker-build.sh**: Automated build script that handles the full workflow
- **docs/DOCKER_BUILD.md**: Comprehensive documentation for Docker builds

## Benefits
- ✅ **Isolation**: Build without affecting host system
- ✅ **Security**: Useful for building from untrusted sources
- ✅ **Reproducibility**: Consistent environment across systems
- ✅ **Convenience**: No manual dependency installation
- ✅ **CI/CD Ready**: Can be integrated into automated workflows

## Testing
Tested on:
- Ubuntu 24.04 (host)
- Docker version 27.5.1
- Successfully builds and runs FSearch 0.3.alpha0

## Usage
```bash
./docker-build.sh
```

Or manually:
```bash
docker build -t fsearch-builder .
docker run --name fsearch-build fsearch-builder
docker cp fsearch-build:/build/builddir/src/fsearch ./fsearch
docker rm fsearch-build
```

## Security Note
A static security audit was performed on the codebase before implementing Docker builds:
- ✅ No network activity detected
- ✅ No telemetry or tracking
- ✅ Proper input sanitization (g_shell_quote usage)
- ✅ No suspicious build scripts
- ✅ Clean dependency tree (GTK3, GLib, PCRE2, ICU)

## Additional Notes
- The Dockerfile can be easily adapted for other base images
- Build script includes proper error handling
- Documentation covers installation, troubleshooting, and customization
```

## Alternative: GitHub Discussion First

Before submitting a PR, you might want to:
1. Open a GitHub Discussion: https://github.com/cboxdoerfer/fsearch/discussions
2. Title: "Proposal: Add Docker build support"
3. Gauge interest from maintainers
4. Get feedback on the approach
5. Then submit PR if there's interest

## Notes

### What NOT to Include in PR
- ❌ `fsearch_static_analysis_howto.md` - This is our personal audit, too specific
- ❌ `BUILD_INSTRUCTIONS.md` - We didn't create this
- ❌ `DOCKER_BUILD_GUIDE.md` - Replaced by docs/DOCKER_BUILD.md (cleaner)

### What to Include
- ✅ `Dockerfile` - Essential
- ✅ `docker-build.sh` - Convenient automation
- ✅ `docs/DOCKER_BUILD.md` - User documentation

## Communication Points

If maintainer asks "Why Docker?":
- Many users want to build from source without installing dependencies
- Useful for security-conscious users
- Enables reproducible builds
- Used by other popular projects (many GNOME apps, etc.)
- Doesn't replace existing build methods, just adds an option

If maintainer asks "Why not Flatpak/Snap?":
- This is complementary, not a replacement
- Docker build produces a local binary, not a sandboxed runtime
- Useful for developers and testers
- Flatpak already exists for end-users

## Timeline Expectations

- Maintainer may take days/weeks to respond
- Be patient and respectful
- Be open to feedback and changes
- If rejected, that's okay - you learned a lot!

---

**Ready to contribute?** Follow the steps above when you're ready!
