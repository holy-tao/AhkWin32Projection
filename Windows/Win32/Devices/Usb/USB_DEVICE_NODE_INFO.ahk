#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_TOPOLOGY_ADDRESS.ahk
#Include .\USB_DEVICE_DESCRIPTOR.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USB_PIPE_INFO.ahk
#Include .\USB_DEVICE_INFO.ahk
#Include .\USB_HUB_DESCRIPTOR.ahk
#Include .\USB_HUB_PORT_INFORMATION.ahk
#Include .\USB_HUB_DEVICE_INFO.ahk
#Include .\USB_CONFIGURATION_DESCRIPTOR.ahk
#Include .\USB_COMPOSITE_FUNCTION_INFO.ahk
#Include .\USB_COMPOSITE_DEVICE_INFO.ahk
#Include .\USB_CONTROLLER_DEVICE_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_NODE_INFO extends Win32Struct
{
    static sizeof => 1208

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Sig {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LengthInBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    DeviceDescription {
        get => StrGet(this.ptr + 8, 39, "UTF-16")
        set => StrPut(value, this.ptr + 8, 39, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    NodeType {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {USB_TOPOLOGY_ADDRESS}
     */
    BusAddress{
        get {
            if(!this.HasProp("__BusAddress"))
                this.__BusAddress := USB_TOPOLOGY_ADDRESS(this.ptr + 96)
            return this.__BusAddress
        }
    }

    /**
     * @type {USB_DEVICE_INFO}
     */
    UsbDeviceInfo{
        get {
            if(!this.HasProp("__UsbDeviceInfo"))
                this.__UsbDeviceInfo := USB_DEVICE_INFO(this.ptr + 128)
            return this.__UsbDeviceInfo
        }
    }

    /**
     * @type {USB_HUB_DEVICE_INFO}
     */
    HubDeviceInfo{
        get {
            if(!this.HasProp("__HubDeviceInfo"))
                this.__HubDeviceInfo := USB_HUB_DEVICE_INFO(this.ptr + 128)
            return this.__HubDeviceInfo
        }
    }

    /**
     * @type {USB_COMPOSITE_DEVICE_INFO}
     */
    CompositeDeviceInfo{
        get {
            if(!this.HasProp("__CompositeDeviceInfo"))
                this.__CompositeDeviceInfo := USB_COMPOSITE_DEVICE_INFO(this.ptr + 128)
            return this.__CompositeDeviceInfo
        }
    }

    /**
     * @type {USB_CONTROLLER_DEVICE_INFO}
     */
    ControllerDeviceInfo{
        get {
            if(!this.HasProp("__ControllerDeviceInfo"))
                this.__ControllerDeviceInfo := USB_CONTROLLER_DEVICE_INFO(this.ptr + 128)
            return this.__ControllerDeviceInfo
        }
    }

    /**
     * @type {Array<Byte>}
     */
    DeviceInformation{
        get {
            if(!this.HasProp("__DeviceInformationProxyArray"))
                this.__DeviceInformationProxyArray := Win32FixedArray(this.ptr + 128, 4, Primitive, "char")
            return this.__DeviceInformationProxyArray
        }
    }
}
