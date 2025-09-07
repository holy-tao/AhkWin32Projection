#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_DESCRIPTOR.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USB_PIPE_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NODE_CONNECTION_INFORMATION_EX extends Win32Struct
{
    static sizeof => 43

    static packingSize => 1

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
                this.__DeviceDescriptor := USB_DEVICE_DESCRIPTOR(this.ptr + 4)
            return this.__DeviceDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    CurrentConfigurationValue {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    Speed {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * @type {Integer}
     */
    DeviceIsHub {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    DeviceAddress {
        get => NumGet(this, 25, "ushort")
        set => NumPut("ushort", value, this, 25)
    }

    /**
     * @type {Integer}
     */
    NumberOfOpenPipes {
        get => NumGet(this, 27, "uint")
        set => NumPut("uint", value, this, 27)
    }

    /**
     * @type {Integer}
     */
    ConnectionStatus {
        get => NumGet(this, 31, "int")
        set => NumPut("int", value, this, 31)
    }

    /**
     * @type {Array<USB_PIPE_INFO>}
     */
    PipeList{
        get {
            if(!this.HasProp("__PipeListProxyArray"))
                this.__PipeListProxyArray := Win32FixedArray(this.ptr + 35, 8, USB_PIPE_INFO, "")
            return this.__PipeListProxyArray
        }
    }
}
