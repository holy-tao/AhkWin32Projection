#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_DESCRIPTOR.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USB_PIPE_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NODE_CONNECTION_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {USB_DEVICE_DESCRIPTOR}
     */
    DeviceDescriptor{
        get {
            if(!this.HasProp("__DeviceDescriptor"))
                this.__DeviceDescriptor := USB_DEVICE_DESCRIPTOR(8, this)
            return this.__DeviceDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    CurrentConfigurationValue {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {BOOLEAN}
     */
    LowSpeed {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * @type {BOOLEAN}
     */
    DeviceIsHub {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    DeviceAddress {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * @type {Integer}
     */
    NumberOfOpenPipes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ConnectionStatus {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Array<USB_PIPE_INFO>}
     */
    PipeList{
        get {
            if(!this.HasProp("__PipeListProxyArray"))
                this.__PipeListProxyArray := Win32FixedArray(this.ptr + 40, 1, USB_PIPE_INFO, "")
            return this.__PipeListProxyArray
        }
    }
}
