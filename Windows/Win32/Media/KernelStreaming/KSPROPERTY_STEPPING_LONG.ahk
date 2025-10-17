#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSPROPERTY_BOUNDS_LONG.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_STEPPING_LONG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SteppingDelta {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {KSPROPERTY_BOUNDS_LONG}
     */
    Bounds{
        get {
            if(!this.HasProp("__Bounds"))
                this.__Bounds := KSPROPERTY_BOUNDS_LONG(8, this)
            return this.__Bounds
        }
    }
}
