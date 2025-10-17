#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSCAMERA_EXTENDEDPROP_ROI_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {RECT}
     */
    Region{
        get {
            if(!this.HasProp("__Region"))
                this.__Region := RECT(0, this)
            return this.__Region
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Weight {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RegionOfInterestType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
