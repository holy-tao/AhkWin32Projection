#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @charset Unicode
 * @architecture X64, Arm64
 */
class DRAGINFOW extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {POINT}
     */
    pt {
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(4, this)
            return this.__pt
        }
    }

    /**
     * @type {BOOL}
     */
    fNC {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {PWSTR}
     */
    lpFileList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    grfKeyState {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
