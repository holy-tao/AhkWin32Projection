#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_controller_capabilities
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CONTROLLER_CAPABILITIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - MQES
     * - CQR
     * - AMS_WeightedRoundRobinWithUrgent
     * - AMS_VendorSpecific
     * - Reserved0
     * - TO
     * - DSTRD
     * - NSSRS
     * - CSS_NVM
     * - CSS_Reserved0
     * - CSS_Reserved1
     * - CSS_Reserved2
     * - CSS_Reserved3
     * - CSS_Reserved4
     * - CSS_MultipleIo
     * - CSS_AdminOnly
     * - BPS
     * - CPS
     * - MPSMIN
     * - MPSMAX
     * - PMRS
     * - CMBS
     * - NSSS
     * - CRWMS
     * - CRIMS
     * - Reserved2
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MQES {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    CQR {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    AMS_WeightedRoundRobinWithUrgent {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    AMS_VendorSpecific {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 19) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 19) | (this._bitfield & ~(0x1F << 19))
    }

    /**
     * @type {Integer}
     */
    TO {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }

    /**
     * @type {Integer}
     */
    DSTRD {
        get => (this._bitfield >> 32) & 0xF
        set => this._bitfield := ((value & 0xF) << 32) | (this._bitfield & ~(0xF << 32))
    }

    /**
     * @type {Integer}
     */
    NSSRS {
        get => (this._bitfield >> 36) & 0x1
        set => this._bitfield := ((value & 0x1) << 36) | (this._bitfield & ~(0x1 << 36))
    }

    /**
     * @type {Integer}
     */
    CSS_NVM {
        get => (this._bitfield >> 37) & 0x1
        set => this._bitfield := ((value & 0x1) << 37) | (this._bitfield & ~(0x1 << 37))
    }

    /**
     * @type {Integer}
     */
    CSS_Reserved0 {
        get => (this._bitfield >> 38) & 0x1
        set => this._bitfield := ((value & 0x1) << 38) | (this._bitfield & ~(0x1 << 38))
    }

    /**
     * @type {Integer}
     */
    CSS_Reserved1 {
        get => (this._bitfield >> 39) & 0x1
        set => this._bitfield := ((value & 0x1) << 39) | (this._bitfield & ~(0x1 << 39))
    }

    /**
     * @type {Integer}
     */
    CSS_Reserved2 {
        get => (this._bitfield >> 40) & 0x1
        set => this._bitfield := ((value & 0x1) << 40) | (this._bitfield & ~(0x1 << 40))
    }

    /**
     * @type {Integer}
     */
    CSS_Reserved3 {
        get => (this._bitfield >> 41) & 0x1
        set => this._bitfield := ((value & 0x1) << 41) | (this._bitfield & ~(0x1 << 41))
    }

    /**
     * @type {Integer}
     */
    CSS_Reserved4 {
        get => (this._bitfield >> 42) & 0x1
        set => this._bitfield := ((value & 0x1) << 42) | (this._bitfield & ~(0x1 << 42))
    }

    /**
     * @type {Integer}
     */
    CSS_MultipleIo {
        get => (this._bitfield >> 43) & 0x1
        set => this._bitfield := ((value & 0x1) << 43) | (this._bitfield & ~(0x1 << 43))
    }

    /**
     * @type {Integer}
     */
    CSS_AdminOnly {
        get => (this._bitfield >> 44) & 0x1
        set => this._bitfield := ((value & 0x1) << 44) | (this._bitfield & ~(0x1 << 44))
    }

    /**
     * @type {Integer}
     */
    BPS {
        get => (this._bitfield >> 45) & 0x1
        set => this._bitfield := ((value & 0x1) << 45) | (this._bitfield & ~(0x1 << 45))
    }

    /**
     * @type {Integer}
     */
    CPS {
        get => (this._bitfield >> 46) & 0x3
        set => this._bitfield := ((value & 0x3) << 46) | (this._bitfield & ~(0x3 << 46))
    }

    /**
     * @type {Integer}
     */
    MPSMIN {
        get => (this._bitfield >> 48) & 0xF
        set => this._bitfield := ((value & 0xF) << 48) | (this._bitfield & ~(0xF << 48))
    }

    /**
     * @type {Integer}
     */
    MPSMAX {
        get => (this._bitfield >> 52) & 0xF
        set => this._bitfield := ((value & 0xF) << 52) | (this._bitfield & ~(0xF << 52))
    }

    /**
     * @type {Integer}
     */
    PMRS {
        get => (this._bitfield >> 56) & 0x1
        set => this._bitfield := ((value & 0x1) << 56) | (this._bitfield & ~(0x1 << 56))
    }

    /**
     * @type {Integer}
     */
    CMBS {
        get => (this._bitfield >> 57) & 0x1
        set => this._bitfield := ((value & 0x1) << 57) | (this._bitfield & ~(0x1 << 57))
    }

    /**
     * @type {Integer}
     */
    NSSS {
        get => (this._bitfield >> 58) & 0x1
        set => this._bitfield := ((value & 0x1) << 58) | (this._bitfield & ~(0x1 << 58))
    }

    /**
     * @type {Integer}
     */
    CRWMS {
        get => (this._bitfield >> 59) & 0x1
        set => this._bitfield := ((value & 0x1) << 59) | (this._bitfield & ~(0x1 << 59))
    }

    /**
     * @type {Integer}
     */
    CRIMS {
        get => (this._bitfield >> 60) & 0x1
        set => this._bitfield := ((value & 0x1) << 60) | (this._bitfield & ~(0x1 << 60))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 61) & 0x7
        set => this._bitfield := ((value & 0x7) << 61) | (this._bitfield & ~(0x7 << 61))
    }

    /**
     * @type {Integer}
     */
    AsUlonglong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
