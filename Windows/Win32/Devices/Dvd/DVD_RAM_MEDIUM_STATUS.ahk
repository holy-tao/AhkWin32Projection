#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_RAM_MEDIUM_STATUS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - PersistentWriteProtect
     * - CartridgeWriteProtect
     * - MediaSpecificWriteInhibit
     * - Reserved1
     * - CartridgeNotSealed
     * - MediaInCartridge
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PersistentWriteProtect {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    CartridgeWriteProtect {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    MediaSpecificWriteInhibit {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 4) & 0x3
        set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
    }

    /**
     * @type {Integer}
     */
    CartridgeNotSealed {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    MediaInCartridge {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    DiscTypeIdentification : Int8

    Reserved2 : Int8

    MediaSpecificWriteInhibitInformation : Int8

}
