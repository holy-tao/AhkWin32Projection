#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct SYSTEM_SUPPORTED_PROCESSOR_ARCHITECTURES_INFORMATION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Machine
     * - KernelMode
     * - UserMode
     * - Native
     * - Process
     * - WoW64Container
     * - ReservedZero0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Machine {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    KernelMode {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    UserMode {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    Native {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * @type {Integer}
     */
    Process {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * @type {Integer}
     */
    WoW64Container {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    ReservedZero0 {
        get => (this._bitfield >> 21) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 21) | (this._bitfield & ~(0x7FF << 21))
    }
}
