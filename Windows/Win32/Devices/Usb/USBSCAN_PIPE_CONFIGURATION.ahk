#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBSCAN_PIPE_INFORMATION.ahk
#Include .\RAW_PIPE_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBSCAN_PIPE_CONFIGURATION extends Win32Struct {
    static sizeof => 68

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfPipes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {USBSCAN_PIPE_INFORMATION}
     */
    PipeInfo {
        get {
            if(!this.HasProp("__PipeInfoProxyArray"))
                this.__PipeInfoProxyArray := Win32FixedArray(this.ptr + 4, 8, USBSCAN_PIPE_INFORMATION, "")
            return this.__PipeInfoProxyArray
        }
    }
}
