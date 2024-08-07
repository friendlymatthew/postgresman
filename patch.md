## Applying patches:

Example
```bash
git am ~/Desktop/v13-0003-Remove-dependence-on-integer-wrapping-for-jsonb.patch
```

## Creating patches

Make sure to commit your work, and condense it into one single commit.
```bash
git format-patch master
```