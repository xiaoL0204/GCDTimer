# GCDTimer
 封装了gcd timer，更易使用。


## Usage


### creat:
```
self.timer = [XLGCDTimer timerWithInterval:1.0 block:^{
        
}];
```
### start timer:
```
[self.timer fire];
```

### cancel:
```
[self.timer stop];
```
