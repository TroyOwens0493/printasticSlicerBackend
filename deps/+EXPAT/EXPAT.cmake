add_cmake_project(EXPAT
  URL https://github.com/libexpat/libexpat/releases/download/R_2_9_0/expat-2.9.0.tar.xz
  URL_HASH SHA256=1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051
  # Upstream PR #1450 fixes CVE-2026-118370 after the 2.9.0 release.
  # Keep both upstream commits until a release containing them is available.
  PATCH_COMMAND ${PATCH_CMD} -p2
    ${CMAKE_CURRENT_LIST_DIR}/0001-CVE-2026-118370-nPrefixes.patch
    ${CMAKE_CURRENT_LIST_DIR}/0002-CVE-2026-118370-attIndex.patch
  CMAKE_ARGS
    -DEXPAT_BUILD_TOOLS:BOOL=OFF
    -DEXPAT_BUILD_EXAMPLES:BOOL=OFF
    -DEXPAT_BUILD_TESTS:BOOL=OFF
    -DEXPAT_BUILD_DOCS=OFF
    -DEXPAT_BUILD_PKGCONFIG=OFF
)
