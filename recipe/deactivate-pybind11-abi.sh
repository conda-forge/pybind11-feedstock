
function backup_and_append() {
    local way=$1
    local envvar=$2

    if [ "${way}" = "activate" ]; then
        eval oldval="\$${envvar}"

        eval "export PYBIND11_ABI_BACKUP_${envvar}=\"${oldval}\""
        if [ -z "${oldval}" ]; then
            eval "export ${envvar}=\"-DPYBIND11_COMPILER_TYPE= -DPYBIND11_BUILD_ABI=\""
        else
            eval "export ${envvar}=\"${oldval} -DPYBIND11_COMPILER_TYPE= -DPYBIND11_BUILD_ABI=\""
        fi
    else
        eval backval="\$PYBIND11_ABI_BACKUP_${envvar}"

        if [ -z "${backval}" ]; then
            eval "unset ${envvar}"
        else
            eval "export ${envvar}=\"${backval}\""
        fi
        eval "unset PYBIND11_ABI_BACKUP_${envvar}"
    fi
}

backup_and_append deactivate "CXXFLAGS"
backup_and_append deactivate "DEBUG_CXXFLAGS"
