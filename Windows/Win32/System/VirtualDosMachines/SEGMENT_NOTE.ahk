#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class SEGMENT_NOTE extends Win32Struct
{
    static sizeof => 280

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Selector1 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Selector2 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Segment {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Array<SByte>}
     */
    Module{
        get {
            if(!this.HasProp("__ModuleProxyArray"))
                this.__ModuleProxyArray := Win32FixedArray(this.ptr + 6, 10, Primitive, "char")
            return this.__ModuleProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    FileName{
        get {
            if(!this.HasProp("__FileNameProxyArray"))
                this.__FileNameProxyArray := Win32FixedArray(this.ptr + 16, 256, Primitive, "char")
            return this.__FileNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 272, "ushort")
        set => NumPut("ushort", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }
}
