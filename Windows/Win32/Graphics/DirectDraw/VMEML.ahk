#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VMEML.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class VMEML extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<VMEML>}
     */
    next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    ptr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    bDiscardable {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
