#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class DRAGINFOA extends Win32Struct
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
     * @type {BOOL}
     */
    fNC{
        get {
            if(!this.HasProp("__fNC"))
                this.__fNC := BOOL(this.ptr + 16)
            return this.__fNC
        }
    }

    /**
     * @type {PSTR}
     */
    lpFileList{
        get {
            if(!this.HasProp("__lpFileList"))
                this.__lpFileList := PSTR(this.ptr + 24)
            return this.__lpFileList
        }
    }

    /**
     * @type {Integer}
     */
    grfKeyState {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
