#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class GPUP_DRIVER_ESCAPE_INPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {LUID}
     */
    vfLUID{
        get {
            if(!this.HasProp("__vfLUID"))
                this.__vfLUID := LUID(0, this)
            return this.__vfLUID
        }
    }
}
