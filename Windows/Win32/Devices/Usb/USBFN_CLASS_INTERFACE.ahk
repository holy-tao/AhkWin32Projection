#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBFN_PIPE_INFORMATION.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_CLASS_INTERFACE extends Win32Struct {
    static sizeof => 196

    static packingSize => 4

    /**
     * @type {Integer}
     */
    InterfaceNumber {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PipeCount {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {USBFN_PIPE_INFORMATION}
     */
    PipeArr {
        get {
            if(!this.HasProp("__PipeArrProxyArray"))
                this.__PipeArrProxyArray := Win32FixedArray(this.ptr + 4, 16, USBFN_PIPE_INFORMATION, "")
            return this.__PipeArrProxyArray
        }
    }
}
