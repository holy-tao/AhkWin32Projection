#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class RTL_BALANCED_NODE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Array<RTL_BALANCED_NODE>}
     */
    Children{
        get {
            if(!this.HasProp("__ChildrenProxyArray"))
                this.__ChildrenProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ptr")
            return this.__ChildrenProxyArray
        }
    }

    /**
     * @type {Pointer<RTL_BALANCED_NODE>}
     */
    Left {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<RTL_BALANCED_NODE>}
     */
    Right {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This bitfield backs the following members:
     * - Red
     * - Balance
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Red {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Balance {
        get => (this._bitfield >> 1) & 0x3
        set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
    }

    /**
     * @type {Pointer}
     */
    ParentValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
