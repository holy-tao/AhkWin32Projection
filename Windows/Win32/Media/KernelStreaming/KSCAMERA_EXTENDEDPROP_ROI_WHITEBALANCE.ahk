#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KSCAMERA_EXTENDEDPROP_ROI_INFO.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_EXTENDEDPROP_ROI_WHITEBALANCE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSCAMERA_EXTENDEDPROP_ROI_INFO}
     */
    ROIInfo{
        get {
            if(!this.HasProp("__ROIInfo"))
                this.__ROIInfo := KSCAMERA_EXTENDEDPROP_ROI_INFO(this.ptr + 0)
            return this.__ROIInfo
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
