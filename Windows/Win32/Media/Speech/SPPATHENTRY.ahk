#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SPTRANSITIONID.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SPPHRASEELEMENT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPATHENTRY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {SPTRANSITIONID}
     */
    hTransition{
        get {
            if(!this.HasProp("__hTransition"))
                this.__hTransition := SPTRANSITIONID(this.ptr + 0)
            return this.__hTransition
        }
    }

    /**
     * @type {SPPHRASEELEMENT}
     */
    elem{
        get {
            if(!this.HasProp("__elem"))
                this.__elem := SPPHRASEELEMENT(this.ptr + 8)
            return this.__elem
        }
    }
}
