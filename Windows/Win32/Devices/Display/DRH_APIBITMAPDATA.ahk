#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DRH_APIBITMAPDATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<SURFOBJ>}
     */
    pso {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    b{
        get {
            if(!this.HasProp("__b"))
                this.__b := BOOL(this.ptr + 8)
            return this.__b
        }
    }
}
