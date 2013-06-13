# Running a Perl script through Node.js via FastCGI

This is just a perl script that run as fastcgi, and we use it to test the fastcgi node.js library.

Only require perl and cpan, and using cpan you can install the `FCGI` module used here.

``` cpan FCGI ```

That command will insall the `FCGI` perl module.

## Run the fastcgi perl script


```
  cd fastcgi/test/fixtures
  perl remote.PL
  perl remote.fpl
```

The script will create the Unix socket `/tmp/testing-fastcgi-node.socket`. Now will run the test suite using this fastcgi perl script as backed for the test suite
