#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class DOCEVENT_CREATEDCPRE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszDriver{
        get {
            if(!this.HasProp("__pszDriver"))
                this.__pszDriver := PWSTR(this.ptr + 0)
            return this.__pszDriver
        }
    }

    /**
     * @type {PWSTR}
     */
    pszDevice{
        get {
            if(!this.HasProp("__pszDevice"))
                this.__pszDevice := PWSTR(this.ptr + 8)
            return this.__pszDevice
        }
    }

    /**
     * @type {Pointer<DEVMODEW>}
     */
    pdm {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    bIC{
        get {
            if(!this.HasProp("__bIC"))
                this.__bIC := BOOL(this.ptr + 24)
            return this.__bIC
        }
    }
}
