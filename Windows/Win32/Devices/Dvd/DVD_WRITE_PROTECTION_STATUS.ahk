#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_WRITE_PROTECTION_STATUS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - SoftwareWriteProtectUntilPowerdown
     * - MediaPersistentWriteProtect
     * - CartridgeWriteProtect
     * - MediaSpecificWriteProtect
     * - Reserved0
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    SoftwareWriteProtectUntilPowerdown {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MediaPersistentWriteProtect {
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
    MediaSpecificWriteProtect {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    Reserved1 : Int8[3]

}
