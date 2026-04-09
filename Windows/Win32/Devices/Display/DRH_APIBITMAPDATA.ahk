#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SURFOBJ.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class DRH_APIBITMAPDATA extends Win32Struct {
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
    b {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
