# rfid_plugin
Flutter project.
封装RFID SDK 接口

## 准备

### 引入依赖
```yaml

  rfid_plugin:
    git:
      url: git@github.com:XiaoWensc/rfid_plugin.git
      ref: master
```

#### android
```groovy
allprojects {
    repositories {
        google()
        mavenCentral()
        flatDir {
            dirs project(":rfid_plugin").file("libs")
        }
    }
}
```

## API

### 初始化 打开设备
```
bool isInit = await RfidPlugin().init();
isInit 是否开启设备
```

### 读取数据
*读取标签数据*
```
String data = await RfidPlugin().readData(accessPwd: "1234", bank: 0, ptr: 1, cnt: 1);
Parameters:
accessPwd - Access password
bank - 读取的存储区(read storage area): 0: Bank_RESERVED、1: Bank_EPC、2: Bank_TID、3: Bank_USER
ptr - 读取的起始地址(单位:字) (read start address(unit: word))
cnt - 读取的数据长度(单位:字) (read data length(unit: word))
Returns:
返回获取的数据, null表示读取失败 (return acquired data, null means read failure)
```
*详细参数说明请参考SDK文档*

### 结束使用 关闭设备
```
bool isFree = await RfidPlugin().free();
isFree 是否关闭设备
```

### 获取缓冲区的标签数据
```
UHFTAGInfo? info = await RfidPlugin().readTagFromBuffer();
Returns:
标签数据(Tag data)
```

### 启动识别Tag循环，只是开启识别Tag循环，之后将识别到的标签号上传到缓冲区
```
bool data = await RfidPlugin().startInventoryTag();
Returns:
是否启动成功
```

### 停止循环识别
```
bool data = await RfidPlugin().stopInventory();

Returns:
成功true，失败false 
```
