#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DedupHash extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Hash{
        get {
            if(!this.HasProp("__HashProxyArray"))
                this.__HashProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__HashProxyArray
        }
    }
}
