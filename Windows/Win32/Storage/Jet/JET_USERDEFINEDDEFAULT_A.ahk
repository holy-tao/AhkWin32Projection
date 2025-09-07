#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset ANSI
 */
class JET_USERDEFINEDDEFAULT_A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    szCallback{
        get {
            if(!this.HasProp("__szCallback"))
                this.__szCallback := PSTR(this.ptr + 0)
            return this.__szCallback
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbUserData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbUserData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PSTR}
     */
    szDependantColumns{
        get {
            if(!this.HasProp("__szDependantColumns"))
                this.__szDependantColumns := PSTR(this.ptr + 24)
            return this.__szDependantColumns
        }
    }
}
