if [[ "${CONDA_BUILD:-}" = "1" ]]; then
  echo "setting openmpi environment variables for conda-build"
  if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" = "1" && "${CONDA_PREFIX}" == "${BUILD_PREFIX:-}" ]]; then
      echo "WARNING: openmpi installed in build environment for cross compilation."
      echo "  This is no longer necessary."
      echo "  Remove 'openmpi' from build dependencies, but 'perl' may need to be added."
  fi

  # runtime variables
  export OMPI_MCA_plm_ssh_agent=false
  export OMPI_MCA_pml=ob1
  export OMPI_MCA_mpi_yield_when_idle=true
  export OMPI_MCA_btl_base_warn_component_unused=false
  export PRTE_MCA_rmaps_default_mapping_policy=:oversubscribe
fi
