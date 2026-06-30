#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class DELTA_INPUT extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    lpcStart {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpStart {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    uSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    Editable {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
