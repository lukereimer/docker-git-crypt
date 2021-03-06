## Docker git-crypt Alpine image

[Git-crypt](https://github.com/AGWA/git-crypt) in docker.

This repo triggers auto-build and pushes the git-crypt image to dockerhub.com/u/xueshanf/git-crypt.

The container exposes volume /repo, to which you can bind-mount a git repository.

## Create a git-crypt shell wrapper

To make it easy to use, create a shell wrapper *git-crypt* and saved it as */usr/local/bin/git-crypt*.

If use shared key:

```
#!/bin/bash -e
docker pull xueshanf/git-crypt
exec docker run -it -v /path/to/repo:/repo -v /path/to/shared-git-crypt-key:/repo/.git/.git-crypt/keys/default xueshanf/git-crypt git-crypt "$@"
```

If use gpg private key:

```
#!/bin/bash -e
docker pull xueshanf/git-crypt
exec docker run -it -v /path/to/repo:/repo -v /path/to/.gnupg:/root/.gnupg xueshanf/git-crypt git-crypt "$@"
```

## Example usages

Make sure the above git-crypt wrapper command is in your command path.

* Command help

	```
	$ git-crypt help
	```

* Check encrypted files:
	
	```
	$ git-crypt status -e
	```
* Check un-encrypted files

	```
	$ git-crypt status -u
	```

* Unlock encrypted file

	```
	$ git-crypt unlock
	```
