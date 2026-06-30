#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\USB_DEVICE_DESCRIPTOR.ahk
#Include .\USB_COMPOSITE_FUNCTION_INFO.ahk
#Include .\USB_CONFIGURATION_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_COMPOSITE_DEVICE_INFO extends Win32Struct {
    static sizeof => 34

    static packingSize => 2

    /**
     * @type {USB_DEVICE_DESCRIPTOR}
     */
    DeviceDescriptor {
        get {
            if(!this.HasProp("__DeviceDescriptor"))
                this.__DeviceDescriptor := USB_DEVICE_DESCRIPTOR(0, this)
            return this.__DeviceDescriptor
        }
    }

    /**
     * @type {USB_CONFIGURATION_DESCRIPTOR}
     */
    CurrentConfigDescriptor {
        get {
            if(!this.HasProp("__CurrentConfigDescriptor"))
                this.__CurrentConfigDescriptor := USB_CONFIGURATION_DESCRIPTOR(18, this)
            return this.__CurrentConfigDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    CurrentConfigurationValue {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    NumberOfFunctions {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * @type {USB_COMPOSITE_FUNCTION_INFO}
     */
    FunctionInfo {
        get {
            if(!this.HasProp("__FunctionInfoProxyArray"))
                this.__FunctionInfoProxyArray := Win32FixedArray(this.ptr + 30, 1, USB_COMPOSITE_FUNCTION_INFO, "")
            return this.__FunctionInfoProxyArray
        }
    }
}
