#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class PBDA_TAG_ATTRIBUTE extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Guid}
     */
    TableUUId {
        get {
            if(!this.HasProp("__TableUUId"))
                this.__TableUUId := Guid(0, this)
            return this.__TableUUId
        }
    }

    /**
     * @type {Integer}
     */
    TableId {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VersionNo {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    TableDataSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    TableData {
        get {
            if(!this.HasProp("__TableDataProxyArray"))
                this.__TableDataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__TableDataProxyArray
        }
    }
}
