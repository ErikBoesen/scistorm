# SciStorm

Some code for SciStorm, a website for teenagers interested in STEM.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ cd ~/tmp
$ git clone https://github.com/ErikBoesen/scistorm.git
$ cd scistorm
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## License

This code is available under the MIT License. See `LICENSE` for more information.
