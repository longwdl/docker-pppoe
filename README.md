# PPPoE服务器

## 使用方式

通过[pipework](https://github.com/jpetazzo/pipework)支持使得容器拥有自己的IP，便于实现网络层以下的协议

pipework可配置参数为：

1. `pipework_cmd` - pipework 命令行，参考[example](https://github.com/dreamcat4/docker-images/blob/master/pipework/3.%20Examples.md)
2. `pipework_key` - pipework 密钥，需要与服务器一致

## 可配置参数

- `PPPOE_DNS1` - 首选DNS服务器，默认为119.29.29.29
- `PPPOE_DNS2` - 备用DNS服务器，默认为114.114.114.114
- `PPPOE_LOCAL` - 网关地址，默认为11.11.11.1
- `PPPOE_REMOTE` - 地址池起始地址，默认为11.11.11.11
- `PPPOE_NUM` - 地址池数量，默认为100
- `PPPOE_IFACE` - 容器中使用的接口，默认为eth1

## 注意事项

privileged需要设置为true，否则无法正常创建ppp设备！
