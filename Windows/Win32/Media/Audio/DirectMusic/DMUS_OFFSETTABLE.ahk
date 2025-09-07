#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DMUS_OFFSETTABLE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Array<UInt32>}
     */
    ulOffsetTable{
        get {
            if(!this.HasProp("__ulOffsetTableProxyArray"))
                this.__ulOffsetTableProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__ulOffsetTableProxyArray
        }
    }
}
