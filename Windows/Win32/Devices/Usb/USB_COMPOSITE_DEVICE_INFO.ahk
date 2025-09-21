#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_DESCRIPTOR.ahk
#Include .\USB_CONFIGURATION_DESCRIPTOR.ahk
#Include .\USB_COMPOSITE_FUNCTION_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_COMPOSITE_DEVICE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {USB_DEVICE_DESCRIPTOR}
     */
    DeviceDescriptor{
        get {
            if(!this.HasProp("__DeviceDescriptor"))
                this.__DeviceDescriptor := USB_DEVICE_DESCRIPTOR(this.ptr + 0)
            return this.__DeviceDescriptor
        }
    }

    /**
     * @type {USB_CONFIGURATION_DESCRIPTOR}
     */
    CurrentConfigDescriptor{
        get {
            if(!this.HasProp("__CurrentConfigDescriptor"))
                this.__CurrentConfigDescriptor := USB_CONFIGURATION_DESCRIPTOR(this.ptr + 24)
            return this.__CurrentConfigDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    CurrentConfigurationValue {
        get => NumGet(this, 34, "char")
        set => NumPut("char", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    NumberOfFunctions {
        get => NumGet(this, 35, "char")
        set => NumPut("char", value, this, 35)
    }

    /**
     * @type {Array<USB_COMPOSITE_FUNCTION_INFO>}
     */
    FunctionInfo{
        get {
            if(!this.HasProp("__FunctionInfoProxyArray"))
                this.__FunctionInfoProxyArray := Win32FixedArray(this.ptr + 40, 1, USB_COMPOSITE_FUNCTION_INFO, "")
            return this.__FunctionInfoProxyArray
        }
    }
}
