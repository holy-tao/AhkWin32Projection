#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSPROPERTY_BOUNDS_LONGLONG.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_STEPPING_LONGLONG extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SteppingDelta {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {KSPROPERTY_BOUNDS_LONGLONG}
     */
    Bounds{
        get {
            if(!this.HasProp("__Bounds"))
                this.__Bounds := KSPROPERTY_BOUNDS_LONGLONG(8, this)
            return this.__Bounds
        }
    }
}
