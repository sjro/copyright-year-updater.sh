# Copyright Year Updater

[![Build Status](https://travis-ci.org/fwolf/copyright-year-updater.sh.svg?branch=master)](https://travis-ci.org/fwolf/copyright-year-updater.sh)

Automatic update year in copyright notice, follow
[GNU Suggestion](https://www.gnu.org/licenses/gpl-howto.html).


## Usage


    copyright-year-updater.sh [Options] [File]


### Options

    -y, --year              Copyright end year, default is current year

All options must set before `[File]`.


### Multiple files

Currently can only update single file, but we can use `find` and `xargs`  to
treat multiple files:

    find *.sh | xargs -L1 copyright-year-updater.sh


## Git pre-commit hook

Copy `pre-commit.sample.sh` as `.git/hooks/pre-commit`, chmod +x.

This hook will not touch un-staged file, even this file have staged part.


## License

MIT
