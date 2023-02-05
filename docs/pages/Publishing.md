# Publishing

## On Rubygems.org

On new release don't forget to rebuild the library documentation:

```bash
bundle exec yard doc
```

```bash
git tag -a vx.x.x
git push --follow-tags
gem push dcdetector-x.x.x.gem
```

See https://guides.rubygems.org/publishing/.
