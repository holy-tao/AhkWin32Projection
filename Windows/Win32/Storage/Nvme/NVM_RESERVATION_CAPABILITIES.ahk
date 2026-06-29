#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVM_RESERVATION_CAPABILITIES {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - PersistThroughPowerLoss
     * - WriteExclusiveReservation
     * - ExclusiveAccessReservation
     * - WriteExclusiveRegistrantsOnlyReservation
     * - ExclusiveAccessRegistrantsOnlyReservation
     * - WriteExclusiveAllRegistrantsReservation
     * - ExclusiveAccessAllRegistrantsReservation
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    PersistThroughPowerLoss {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    WriteExclusiveReservation {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ExclusiveAccessReservation {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    WriteExclusiveRegistrantsOnlyReservation {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    ExclusiveAccessRegistrantsOnlyReservation {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    WriteExclusiveAllRegistrantsReservation {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    ExclusiveAccessAllRegistrantsReservation {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
