#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SPPHRASEELEMENT.ahk
#Include .\SPTRANSITIONID.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPPATHENTRY extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {SPTRANSITIONID}
     */
    hTransition {
        get {
            if(!this.HasProp("__hTransition"))
                this.__hTransition := SPTRANSITIONID(0, this)
            return this.__hTransition
        }
    }

    /**
     * @type {SPPHRASEELEMENT}
     */
    elem {
        get {
            if(!this.HasProp("__elem"))
                this.__elem := SPPHRASEELEMENT(8, this)
            return this.__elem
        }
    }
}
