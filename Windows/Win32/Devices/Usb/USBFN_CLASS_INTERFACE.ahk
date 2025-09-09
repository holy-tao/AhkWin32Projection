#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USBFN_PIPE_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_CLASS_INTERFACE extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

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
     * @type {Array<USBFN_PIPE_INFORMATION>}
     */
    PipeArr{
        get {
            if(!this.HasProp("__PipeArrProxyArray"))
                this.__PipeArrProxyArray := Win32FixedArray(this.ptr + 8, 16, USBFN_PIPE_INFORMATION, "")
            return this.__PipeArrProxyArray
        }
    }
}
