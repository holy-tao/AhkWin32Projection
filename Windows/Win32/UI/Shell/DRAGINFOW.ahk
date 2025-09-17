#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class DRAGINFOW extends Win32Struct
{
    static sizeof => 40

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
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(this.ptr + 8)
            return this.__pt
        }
    }

    /**
     * @type {Integer}
     */
    fNC {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    lpFileList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    grfKeyState {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
