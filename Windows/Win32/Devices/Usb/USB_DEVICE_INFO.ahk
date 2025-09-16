#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_DESCRIPTOR.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USB_PIPE_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_INFO extends Win32Struct
{
    static sizeof => 1080

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DeviceState {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {USB_DEVICE_DESCRIPTOR}
     */
    DeviceDescriptor{
        get {
            if(!this.HasProp("__DeviceDescriptor"))
                this.__DeviceDescriptor := USB_DEVICE_DESCRIPTOR(this.ptr + 8)
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
     * @type {Integer}
     */
    Speed {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    DeviceAddress {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ConnectionStatus {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {String}
     */
    PnpHardwareId {
        get => StrGet(this.ptr + 44, 127, "UTF-16")
        set => StrPut(value, this.ptr + 44, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    PnpCompatibleId {
        get => StrGet(this.ptr + 300, 127, "UTF-16")
        set => StrPut(value, this.ptr + 300, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    SerialNumberId {
        get => StrGet(this.ptr + 556, 127, "UTF-16")
        set => StrPut(value, this.ptr + 556, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    PnpDeviceDescription {
        get => StrGet(this.ptr + 812, 127, "UTF-16")
        set => StrPut(value, this.ptr + 812, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    NumberOfOpenPipes {
        get => NumGet(this, 1068, "uint")
        set => NumPut("uint", value, this, 1068)
    }

    /**
     * @type {Array<USB_PIPE_INFO>}
     */
    PipeList{
        get {
            if(!this.HasProp("__PipeListProxyArray"))
                this.__PipeListProxyArray := Win32FixedArray(this.ptr + 1072, 1, USB_PIPE_INFO, "")
            return this.__PipeListProxyArray
        }
    }
}
