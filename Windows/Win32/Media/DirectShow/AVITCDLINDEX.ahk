#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\TIMECODE.ahk
#Include .\AVITCDLINDEX_ENTRY.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVITCDLINDEX extends Win32Struct
{
    static sizeof => 18752

    static packingSize => 8

    /**
     * @type {Integer}
     */
    fcc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wLongsPerEntry {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bIndexSubType {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    bIndexType {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    nEntriesInUse {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwChunkId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 20, 3, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }

    /**
     * @type {Array<AVITCDLINDEX_ENTRY>}
     */
    aIndex{
        get {
            if(!this.HasProp("__aIndexProxyArray"))
                this.__aIndexProxyArray := Win32FixedArray(this.ptr + 32, 584, AVITCDLINDEX_ENTRY, "")
            return this.__aIndexProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    adwTrailingFill{
        get {
            if(!this.HasProp("__adwTrailingFillProxyArray"))
                this.__adwTrailingFillProxyArray := Win32FixedArray(this.ptr + 4704, 3512, Primitive, "uint")
            return this.__adwTrailingFillProxyArray
        }
    }
}
