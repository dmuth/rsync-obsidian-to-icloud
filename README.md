


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


