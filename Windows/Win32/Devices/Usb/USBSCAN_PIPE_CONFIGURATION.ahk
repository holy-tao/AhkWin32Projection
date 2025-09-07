#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBSCAN_PIPE_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBSCAN_PIPE_CONFIGURATION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfPipes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<USBSCAN_PIPE_INFORMATION>}
     */
    PipeInfo{
        get {
            if(!this.HasProp("__PipeInfoProxyArray"))
                this.__PipeInfoProxyArray := Win32FixedArray(this.ptr + 8, 8, USBSCAN_PIPE_INFORMATION, "")
            return this.__PipeInfoProxyArray
        }
    }
}
