#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_CUSTOM_ERROR_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszStatus{
        get {
            if(!this.HasProp("__pszStatus"))
                this.__pszStatus := PSTR(this.ptr + 0)
            return this.__pszStatus
        }
    }

    /**
     * @type {Integer}
     */
    uHttpSubError {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    fAsync{
        get {
            if(!this.HasProp("__fAsync"))
                this.__fAsync := BOOL(this.ptr + 12)
            return this.__fAsync
        }
    }
}
