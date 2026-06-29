#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - NmiNotification
     * - InterruptNotification
     * - InterruptPriority
     * - Reserved
     * - Sint
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    NmiNotification {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    InterruptNotification {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    InterruptPriority {
        get => (this._bitfield >> 2) & 0xF
        set => this._bitfield := ((value & 0xF) << 2) | (this._bitfield & ~(0xF << 2))
    }

    /**
     * @type {Integer}
     */
    Sint {
        get => (this._bitfield >> 48) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 48) | (this._bitfield & ~(0xFFFF << 48))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT64', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
