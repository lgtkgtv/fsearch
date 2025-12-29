#!/bin/bash
# Comprehensive Security Audit Script for FSearch
# Run this after installing: cppcheck, flawfinder, clang-tools

set -e

echo "=========================================="
echo "FSearch Security Audit - Automated Tools"
echo "=========================================="
echo ""

# Create results directory
mkdir -p security-audit-results
cd /home/s/fsearch

echo "[1/8] Running Cppcheck..."
cppcheck --enable=all \
         --inconclusive \
         --force \
         --verbose \
         --template='{file}:{line}: {severity}: {message}' \
         src/ 2>&1 | tee security-audit-results/cppcheck-full.txt

echo ""
echo "[2/8] Running Flawfinder..."
flawfinder --minlevel=0 \
           --html \
           --context \
           src/ > security-audit-results/flawfinder-full.html
flawfinder --minlevel=1 \
           src/ 2>&1 | tee security-audit-results/flawfinder-summary.txt

echo ""
echo "[3/8] Running Clang Static Analyzer..."
if command -v scan-build &> /dev/null; then
    scan-build -o security-audit-results/clang-analysis \
               --status-bugs \
               meson setup builddir-scan 2>&1 | tee security-audit-results/scan-build-setup.log || true
    scan-build -o security-audit-results/clang-analysis \
               ninja -C builddir-scan 2>&1 | tee security-audit-results/scan-build-build.log || true
else
    echo "scan-build not found, skipping Clang analysis"
fi

echo ""
echo "[4/8] Building with AddressSanitizer..."
meson setup -Db_sanitize=address \
            --wipe \
            builddir-asan 2>&1 | tee security-audit-results/asan-setup.log
ninja -C builddir-asan 2>&1 | tee security-audit-results/asan-build.log

echo ""
echo "[5/8] Building with UndefinedBehaviorSanitizer..."
meson setup -Db_sanitize=undefined \
            --wipe \
            builddir-ubsan 2>&1 | tee security-audit-results/ubsan-setup.log
ninja -C builddir-ubsan 2>&1 | tee security-audit-results/ubsan-build.log

echo ""
echo "[6/8] Testing AddressSanitizer build..."
echo "Running fsearch --help with AddressSanitizer..."
./builddir-asan/src/fsearch --help 2>&1 | tee security-audit-results/asan-test-help.log || true
echo "Running fsearch --version with AddressSanitizer..."
./builddir-asan/src/fsearch --version 2>&1 | tee security-audit-results/asan-test-version.log || true

echo ""
echo "[7/8] Testing UndefinedBehaviorSanitizer build..."
echo "Running fsearch --help with UndefinedBehaviorSanitizer..."
./builddir-ubsan/src/fsearch --help 2>&1 | tee security-audit-results/ubsan-test-help.log || true
echo "Running fsearch --version with UndefinedBehaviorSanitizer..."
./builddir-ubsan/src/fsearch --version 2>&1 | tee security-audit-results/ubsan-test-version.log || true

echo ""
echo "[8/8] Checking dependency versions..."
echo "Installed library versions:" > security-audit-results/dependencies.txt
dpkg -l | grep -E "libgtk-3|libglib2.0|libpcre2|libicu" >> security-audit-results/dependencies.txt

echo ""
echo "=========================================="
echo "Security Audit Complete!"
echo "=========================================="
echo ""
echo "Results saved in: security-audit-results/"
echo ""
echo "Summary:"
echo "  - Cppcheck results: security-audit-results/cppcheck-full.txt"
echo "  - Flawfinder HTML: security-audit-results/flawfinder-full.html"
echo "  - Flawfinder summary: security-audit-results/flawfinder-summary.txt"
echo "  - Clang analysis: security-audit-results/clang-analysis/"
echo "  - Sanitizer logs: security-audit-results/*san*.log"
echo "  - Dependencies: security-audit-results/dependencies.txt"
echo ""
echo "Review the results and check for:"
echo "  - Any CRITICAL or HIGH severity issues"
echo "  - Memory errors from sanitizers"
echo "  - Known CVEs in dependencies"
echo ""
