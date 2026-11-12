#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_CACHEMEM_CAPABILITY_HEADER_REGISTER extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - CxlCapabilityID
     * - CxlCapabilityVersion
     * - CapabilityOffset
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CxlCapabilityID {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    CxlCapabilityVersion {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    CapabilityOffset {
        get => (this._bitfield >> 20) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 20) | (this._bitfield & ~(0xFFF << 20))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
