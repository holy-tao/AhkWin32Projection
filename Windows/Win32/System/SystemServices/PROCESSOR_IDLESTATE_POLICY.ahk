#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PROCESSOR_IDLESTATE_INFO.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESSOR_IDLESTATE_POLICY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AsWORD {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * This bitfield backs the following members:
     * - AllowScaling
     * - Disabled
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    AllowScaling {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Disabled {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 2) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 2) | (this._bitfield & ~(0x3FFF << 2))
    }

    /**
     * @type {Integer}
     */
    PolicyCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<PROCESSOR_IDLESTATE_INFO>}
     */
    Policy{
        get {
            if(!this.HasProp("__PolicyProxyArray"))
                this.__PolicyProxyArray := Win32FixedArray(this.ptr + 8, 3, PROCESSOR_IDLESTATE_INFO, "")
            return this.__PolicyProxyArray
        }
    }
}
