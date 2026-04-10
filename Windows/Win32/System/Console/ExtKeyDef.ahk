#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ExtKeySubst.ahk

/**
 * @namespace Windows.Win32.System.Console
 */
class ExtKeyDef extends Win32Struct {
    static sizeof => 18

    static packingSize => 2

    /**
     * @type {ExtKeySubst}
     */
    keys {
        get {
            if(!this.HasProp("__keysProxyArray"))
                this.__keysProxyArray := Win32FixedArray(this.ptr + 0, 3, ExtKeySubst, "")
            return this.__keysProxyArray
        }
    }
}
