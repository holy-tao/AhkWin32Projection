#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINT_FEATURE_OPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszFeature{
        get {
            if(!this.HasProp("__pszFeature"))
                this.__pszFeature := PSTR(this.ptr + 0)
            return this.__pszFeature
        }
    }

    /**
     * @type {PSTR}
     */
    pszOption{
        get {
            if(!this.HasProp("__pszOption"))
                this.__pszOption := PSTR(this.ptr + 8)
            return this.__pszOption
        }
    }
}
