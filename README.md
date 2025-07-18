About pybind11-feedstock
========================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/pybind11-feedstock/blob/main/LICENSE.txt)

Home: https://github.com/pybind/pybind11

Package license: BSD-3-Clause

Summary: Seamless operability between C++11 and Python

Development: https://github.com/pybind/pybind11

Documentation: https://pybind11.readthedocs.io/

Current build status
====================


<table><tr><td>All platforms:</td>
    <td>
      <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=841&branchName=main">
        <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/pybind11-feedstock?branchName=main">
      </a>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-pybind11-green.svg)](https://anaconda.org/conda-forge/pybind11) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/pybind11.svg)](https://anaconda.org/conda-forge/pybind11) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/pybind11.svg)](https://anaconda.org/conda-forge/pybind11) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/pybind11.svg)](https://anaconda.org/conda-forge/pybind11) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-pybind11--abi-green.svg)](https://anaconda.org/conda-forge/pybind11-abi) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/pybind11-abi.svg)](https://anaconda.org/conda-forge/pybind11-abi) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/pybind11-abi.svg)](https://anaconda.org/conda-forge/pybind11-abi) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/pybind11-abi.svg)](https://anaconda.org/conda-forge/pybind11-abi) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-pybind11--global-green.svg)](https://anaconda.org/conda-forge/pybind11-global) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/pybind11-global.svg)](https://anaconda.org/conda-forge/pybind11-global) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/pybind11-global.svg)](https://anaconda.org/conda-forge/pybind11-global) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/pybind11-global.svg)](https://anaconda.org/conda-forge/pybind11-global) |

Installing pybind11
===================

Installing `pybind11` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `pybind11, pybind11-abi, pybind11-global` can be installed with `conda`:

```
conda install pybind11 pybind11-abi pybind11-global
```

or with `mamba`:

```
mamba install pybind11 pybind11-abi pybind11-global
```

It is possible to list all of the versions of `pybind11` available on your platform with `conda`:

```
conda search pybind11 --channel conda-forge
```

or with `mamba`:

```
mamba search pybind11 --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search pybind11 --channel conda-forge

# List packages depending on `pybind11`:
mamba repoquery whoneeds pybind11 --channel conda-forge

# List dependencies of `pybind11`:
mamba repoquery depends pybind11 --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating pybind11-feedstock
===========================

If you would like to improve the pybind11 recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/pybind11-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@SylvainCorlay](https://github.com/SylvainCorlay/)
* [@ax3l](https://github.com/ax3l/)
* [@henryiii](https://github.com/henryiii/)
* [@wjakob](https://github.com/wjakob/)

