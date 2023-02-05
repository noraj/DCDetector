# Installation

## Production

### Install from rubygems.org

```bash
gem install dcdetector
```

Gem: [dcdetector](https://rubygems.org/gems/dcdetector)

### Install from BlackArch

From the repository:

```bash
pacman -S dcdetector
```

PKGBUILD: [dcdetector](https://github.com/BlackArch/blackarch/blob/master/packages/dcdetector/PKGBUILD)

## Development

It's better to use [rbenv](https://github.com/rbenv/rbenv) or [asdf](https://github.com/asdf-vm/asdf) to have latests version of ruby and to avoid trashing your system ruby.

### Install from rubygems.org

```bash
gem install --development dcdetector
```

### Build from git

Just replace `x.x.x` with the gem version you see after `gem build`.

```bash
git clone https://github.com/noraj/dcdetector.git dcdetector
cd dcdetector
gem install bundler
bundler install
gem build dcdetector.gemspec
gem install dcdetector-x.x.x.gem
```

Note: if an automatic install is needed you can get the version with `$ gem build dcdetector.gemspec | grep Version | cut -d' ' -f4`.

### Run without installing the gem

From local file:

```bash
irb -Ilib -rdcdetector
```

Same for the CLI tool:

```bash
ruby -Ilib -rdcdetector bin/dcdetector
# or
ruby -Ilib -rdcdetector bin/dcd
```
