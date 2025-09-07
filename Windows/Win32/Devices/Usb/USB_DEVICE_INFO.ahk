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
    static sizeof => 1075

    static packingSize => 1

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
                this.__DeviceDescriptor := USB_DEVICE_DESCRIPTOR(this.ptr + 6)
            return this.__DeviceDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    CurrentConfigurationValue {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Speed {
        get => NumGet(this, 25, "int")
        set => NumPut("int", value, this, 25)
    }

    /**
     * @type {Integer}
     */
    DeviceAddress {
        get => NumGet(this, 29, "ushort")
        set => NumPut("ushort", value, this, 29)
    }

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 31, "uint")
        set => NumPut("uint", value, this, 31)
    }

    /**
     * @type {Integer}
     */
    ConnectionStatus {
        get => NumGet(this, 35, "int")
        set => NumPut("int", value, this, 35)
    }

    /**
     * @type {String}
     */
    PnpHardwareId {
        get => StrGet(this.ptr + 39, 127, "UTF-16")
        set => StrPut(value, this.ptr + 39, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    PnpCompatibleId {
        get => StrGet(this.ptr + 295, 127, "UTF-16")
        set => StrPut(value, this.ptr + 295, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    SerialNumberId {
        get => StrGet(this.ptr + 551, 127, "UTF-16")
        set => StrPut(value, this.ptr + 551, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    PnpDeviceDescription {
        get => StrGet(this.ptr + 807, 127, "UTF-16")
        set => StrPut(value, this.ptr + 807, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    NumberOfOpenPipes {
        get => NumGet(this, 1063, "uint")
        set => NumPut("uint", value, this, 1063)
    }

    /**
     * @type {Array<USB_PIPE_INFO>}
     */
    PipeList{
        get {
            if(!this.HasProp("__PipeListProxyArray"))
                this.__PipeListProxyArray := Win32FixedArray(this.ptr + 1067, 8, USB_PIPE_INFO, "")
            return this.__PipeListProxyArray
        }
    }
}
