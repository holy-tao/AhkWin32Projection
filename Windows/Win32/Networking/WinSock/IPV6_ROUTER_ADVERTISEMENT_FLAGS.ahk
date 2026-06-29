#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV6_ROUTER_ADVERTISEMENT_FLAGS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Reserved
     * - Preference
     * - HomeAgent
     * - OtherStatefulConfiguration
     * - ManagedAddressConfiguration
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Preference {
        get => (this._bitfield >> 3) & 0x3
        set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
    }

    /**
     * @type {Integer}
     */
    HomeAgent {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    OtherStatefulConfiguration {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    ManagedAddressConfiguration {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
