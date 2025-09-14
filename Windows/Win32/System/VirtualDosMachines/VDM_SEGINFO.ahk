#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class VDM_SEGINFO extends Win32Struct
{
    static sizeof => 276

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Selector {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SegNumber {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    ModuleName{
        get {
            if(!this.HasProp("__ModuleNameProxyArray"))
                this.__ModuleNameProxyArray := Win32FixedArray(this.ptr + 10, 9, Primitive, "char")
            return this.__ModuleNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    FileName{
        get {
            if(!this.HasProp("__FileNameProxyArray"))
                this.__FileNameProxyArray := Win32FixedArray(this.ptr + 19, 255, Primitive, "char")
            return this.__FileNameProxyArray
        }
    }
}
