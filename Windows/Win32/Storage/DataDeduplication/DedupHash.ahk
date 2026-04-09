#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
class DedupHash extends Win32Struct {
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Hash {
        get {
            if(!this.HasProp("__HashProxyArray"))
                this.__HashProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__HashProxyArray
        }
    }
}
