
## Rsync Obsidian Vaults to iCloud

The mobile app for <a href="https://obsidian.md/">Obsidian</a> for the iPhone
can write Vaults to iCloud, but getting vaults from your Mac into iCloud can be tricky.
These scripts to seek to address that.

<img src="./img/obsidian-logo.png" align="right" width="250" />


## Usage

### Getting your Vault into iCloud

- Make sure you've installed Obsidian on your iPhone FIRST, as it needs to set up an Obsidian directory in iCloud
- Next, run the script as follows: `./rsync-obsidian-to-icloud.sh ./VAULTNAME VAULTNAME_IN_ICLOUD`
- The script will run `rsync` against the local directory that you specify and copy those files to the directory in the Obsidian directory in iCloud
- At the completion of the script, a suggested alias will be printed so that future invocations of the script can be made no matter what directory you're in at the time.


### Syncing changes from iCloud to your Vault

- Run the companion script: `./rsync-icloud-to-obsidian.sh VAULTNAME_IN_ICLOUD VAULTNAME`
- This will sync down changes from iCloud to your local vault
- Files that you deleted on iCloud will not be deleted from your local vault, to prevent accidental deletions.


## Caveats

- Depending on how much data you have, it can take a macroscopic amount of time for files from the iCloud directory on your Mac to sync to your iPhone.  You may need to be patient.
- Very large Vaults can crash the Obsidian client.  This has been reported to the devs and is being actively looked into.


## Testing instructions

- Run `create-test-dir.sh` to create some test directories in `test-src/`
- Run a few tests
  - `./rsync-obsidian-to-icloud.sh ./test-src/ /tmp/test` - Should succeed
  - `./rsync-obsidian-to-icloud.sh ./test-src/ test/test2` - Should fail due to slash present
  - `./rsync-obsidian-to-icloud.sh ./test-src/ $(pwd)/test-dest` - Should sync to `./test-dest/`.
  - `./rsync-obsidian-to-icloud.sh ./test-src/ test-dest` - Should sync to `test-dest` in iCloud and be visible via iPhone Obsidian app.

 
## Who built this? / Contact

My name is Douglas Muth, and I am a software engineer in Philadelphia, PA.

There are several ways to get in touch with me:
- Email to doug.muth AT gmail DOT com or dmuth AT dmuth DOT org
- [Facebook](https://facebook.com/dmuth) and [Twitter](http://twitter.com/dmuth)
- [LinkedIn](https://linkedin.com/in/dmuth)

Feel free to reach out to me if you have any comments, suggestions, or bug reports.


