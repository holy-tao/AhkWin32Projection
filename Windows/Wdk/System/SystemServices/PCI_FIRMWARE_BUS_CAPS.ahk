#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_FIRMWARE_BUS_CAPS {
    #StructPack 2

    Type : UInt16

    Length : UInt16

    /**
     * This bitfield backs the following members:
     * - SixtyFourBitDevice
     * - PciXMode1EccCapable
     * - DeviceIdMessagingCapable
     * - ObffWakeSignalCapable
     * - Reserved1
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    SixtyFourBitDevice {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PciXMode1EccCapable {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    DeviceIdMessagingCapable {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ObffWakeSignalCapable {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    CurrentSpeedAndMode : Int8

    SupportedSpeedsAndModesLowByte : Int8

    SupportedSpeedsAndModesHighByte : Int8

    Voltage : Int8

    Reserved2 : Int8[7]

}
