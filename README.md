# Log Parser

This is a proof of concept application to parse a log with this format

```
/help_page/1 126.318.035.038
/contact 184.123.665.067
/home 184.123.665.067
/about/2 444.701.448.104
```


## Usage

`./parser.rb logs/webserver.log`

## Tests

Just run `rspec` after installing the necessary gems via `bundler`

## Next steps

This is just a proof of concept so it does not handle cases like:
1. Different log structures
2. Errors inside a log

It would be pretty simple to modify LogEntry class to store much more data and then add different LogParser subclasses to parse different log types (Apache, NGINX, etc)
Also we could add new operations to the Analyzer class to analize more metrics or do different aggregations (By day, week, etc)
