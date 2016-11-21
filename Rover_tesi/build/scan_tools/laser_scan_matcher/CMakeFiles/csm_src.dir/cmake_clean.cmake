FILE(REMOVE_RECURSE
  "CMakeFiles/csm_src"
  "CMakeFiles/csm_src-complete"
  "csm/stamp/csm_src-install"
  "csm/stamp/csm_src-mkdir"
  "csm/stamp/csm_src-download"
  "csm/stamp/csm_src-update"
  "csm/stamp/csm_src-patch"
  "csm/stamp/csm_src-configure"
  "csm/stamp/csm_src-build"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/csm_src.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
