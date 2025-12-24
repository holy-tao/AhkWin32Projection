#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_DEVICE_CAPABILITIES_REGISTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - MaxPayloadSizeSupported
     * - PhantomFunctionsSupported
     * - ExtendedTagSupported
     * - L0sAcceptableLatency
     * - L1AcceptableLatency
     * - Undefined
     * - RoleBasedErrorReporting
     * - Rsvd1
     * - CapturedSlotPowerLimit
     * - CapturedSlotPowerLimitScale
     * - FunctionLevelResetCapability
     * - Rsvd2
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaxPayloadSizeSupported {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    PhantomFunctionsSupported {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }

    /**
     * @type {Integer}
     */
    ExtendedTagSupported {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    L0sAcceptableLatency {
        get => (this._bitfield >> 6) & 0x7
        set => this._bitfield := ((value & 0x7) << 6) | (this._bitfield & ~(0x7 << 6))
    }

    /**
     * @type {Integer}
     */
    L1AcceptableLatency {
        get => (this._bitfield >> 9) & 0x7
        set => this._bitfield := ((value & 0x7) << 9) | (this._bitfield & ~(0x7 << 9))
    }

    /**
     * @type {Integer}
     */
    Undefined {
        get => (this._bitfield >> 12) & 0x7
        set => this._bitfield := ((value & 0x7) << 12) | (this._bitfield & ~(0x7 << 12))
    }

    /**
     * @type {Integer}
     */
    RoleBasedErrorReporting {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    Rsvd1 {
        get => (this._bitfield >> 16) & 0x3
        set => this._bitfield := ((value & 0x3) << 16) | (this._bitfield & ~(0x3 << 16))
    }

    /**
     * @type {Integer}
     */
    CapturedSlotPowerLimit {
        get => (this._bitfield >> 18) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 18) | (this._bitfield & ~(0xFF << 18))
    }

    /**
     * @type {Integer}
     */
    CapturedSlotPowerLimitScale {
        get => (this._bitfield >> 26) & 0x3
        set => this._bitfield := ((value & 0x3) << 26) | (this._bitfield & ~(0x3 << 26))
    }

    /**
     * @type {Integer}
     */
    FunctionLevelResetCapability {
        get => (this._bitfield >> 28) & 0x1
        set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
    }

    /**
     * @type {Integer}
     */
    Rsvd2 {
        get => (this._bitfield >> 29) & 0x7
        set => this._bitfield := ((value & 0x7) << 29) | (this._bitfield & ~(0x7 << 29))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
