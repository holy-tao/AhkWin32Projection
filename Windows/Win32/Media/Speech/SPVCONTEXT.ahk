#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPVCONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pCategory{
        get {
            if(!this.HasProp("__pCategory"))
                this.__pCategory := PWSTR(this.ptr + 0)
            return this.__pCategory
        }
    }

    /**
     * @type {PWSTR}
     */
    pBefore{
        get {
            if(!this.HasProp("__pBefore"))
                this.__pBefore := PWSTR(this.ptr + 8)
            return this.__pBefore
        }
    }

    /**
     * @type {PWSTR}
     */
    pAfter{
        get {
            if(!this.HasProp("__pAfter"))
                this.__pAfter := PWSTR(this.ptr + 16)
            return this.__pAfter
        }
    }
}
