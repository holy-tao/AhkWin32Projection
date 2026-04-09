#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DMUS_OFFSETTABLE extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    ulOffsetTable {
        get {
            if(!this.HasProp("__ulOffsetTableProxyArray"))
                this.__ulOffsetTableProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
            return this.__ulOffsetTableProxyArray
        }
    }
}
