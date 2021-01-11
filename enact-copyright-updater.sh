TARGET_REPO="samples moonstone sandstone agate enact storybook-utils"
TARGET_REPOS=( $TARGET_REPO )


for TARGET_TYPE in "${TARGET_REPOS[@]}"; do
	echo ${TARGET_TYPE}
if [ ! -z "${TARGET_TYPE}" ] ; then
	TARGET_DIR="${TARGET_TYPE}"
	case "${TARGET_TYPE}" in
		"enact")
			REMOTE_GIT_URL="git@github.com:enactjs/enact.git"
			GIT_BRANCH="develop"
			;;
		"moonstone-ez")
			REMOTE_GIT_URL="git@github.com:enyojs/enact-theme-moonstone-ez.git"
			GIT_BRANCH="develop"
			;;
		sandstone)
			REMOTE_GIT_URL="git@github.com:enyojs/sandstone.git"
			GIT_BRANCH="develop"
			;;
		eslint-plugin-enact)
			REMOTE_GIT_URL="git@github.com:enactjs/${TARGET_TYPE}.git"
			GIT_BRANCH="master"
			;;
		*)
			REMOTE_GIT_URL="git@github.com:enactjs/${TARGET_TYPE}.git"
			GIT_BRANCH="develop"
			;;
	esac
	if [ ! -z "${REMOTE_GIT_URL}" ] ; then
			git init ${TARGET_DIR}
			pushd ${TARGET_DIR}
			git config core.sparseCheckout true	
			git remote add -f origin ${REMOTE_GIT_URL}
			echo "README.md" >> .git/info/sparse-checkout
			git checkout ${GIT_BRANCH}
			popd 
	fi

fi
done
find -name "README.md" | xargs -L1 ./copyright-year-updater.sh
