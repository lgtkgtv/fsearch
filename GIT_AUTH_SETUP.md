# GitHub Authentication Setup

## Quick Push (Do This Now)

In your terminal:
```bash
cd /home/s/fsearch
git push fork add-docker-build-support
```

Enter your GitHub credentials when prompted.

**Note**: GitHub no longer accepts passwords. Use a Personal Access Token instead.

## Get a Personal Access Token (If Needed)

1. Go to: https://github.com/settings/tokens
2. Click "Generate new token" → "Classic"
3. Name: "fsearch-contribution"
4. Expiration: 30 days
5. Scopes: Check ✅ `repo` (full control of private repositories)
6. Click "Generate token"
7. **Copy the token** (you won't see it again!)
8. Use this token as your password when pushing

## Better Solution: SSH Keys (For Future)

### Generate SSH Key:
```bash
# Generate new SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"
# Press Enter for default location
# Press Enter twice for no passphrase (or set one for security)

# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub
```

### Add to GitHub:
1. Go to: https://github.com/settings/keys
2. Click "New SSH key"
3. Title: "fsearch-dev-machine"
4. Paste the public key (from cat command above)
5. Click "Add SSH key"

### Update Remote to Use SSH:
```bash
# Change fork remote to SSH
git remote set-url fork git@github.com:lgtkgtv/fsearch.git

# Verify
git remote -v

# Now push works without password
git push fork add-docker-build-support
```

## Cache Credentials (HTTPS Alternative)

If you want to stick with HTTPS:

```bash
# Cache credentials for 1 hour
git config --global credential.helper 'cache --timeout=3600'

# Or store permanently (less secure)
git config --global credential.helper store
```

Then push once with your token, and it'll be remembered.

---

**For now**: Just run `git push fork add-docker-build-support` in your terminal!
