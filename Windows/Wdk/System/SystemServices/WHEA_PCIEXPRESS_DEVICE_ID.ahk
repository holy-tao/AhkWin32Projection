#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIEXPRESS_DEVICE_ID {
    #StructPack 4

    VendorID : UInt16

    DeviceID : UInt16

    /**
     * This bitfield backs the following members:
     * - ClassCode
     * - FunctionNumber
     */
    _bitfield1 : Int32


    /**
     * @type {Integer}
     */
    ClassCode {
        get => (this._bitfield1 >> 0) & 0xFFFFFF
        set => this._bitfield1 := ((value & 0xFFFFFF) << 0) | (this._bitfield1 & ~(0xFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    FunctionNumber {
        get => (this._bitfield1 >> 24) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 24) | (this._bitfield1 & ~(0xFF << 24))
    }
    /**
     * This bitfield backs the following members:
     * - DeviceNumber
     * - Segment
     * - PrimaryBusNumber
     */
    _bitfield2 : Int32


    /**
     * @type {Integer}
     */
    DeviceNumber {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    Segment {
        get => (this._bitfield2 >> 8) & 0xFFFF
        set => this._bitfield2 := ((value & 0xFFFF) << 8) | (this._bitfield2 & ~(0xFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    PrimaryBusNumber {
        get => (this._bitfield2 >> 24) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 24) | (this._bitfield2 & ~(0xFF << 24))
    }
    /**
     * This bitfield backs the following members:
     * - SecondaryBusNumber
     * - Reserved1
     * - SlotNumber
     * - Reserved2
     */
    _bitfield3 : Int32


    /**
     * @type {Integer}
     */
    SecondaryBusNumber {
        get => (this._bitfield3 >> 0) & 0xFF
        set => this._bitfield3 := ((value & 0xFF) << 0) | (this._bitfield3 & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield3 >> 8) & 0x7
        set => this._bitfield3 := ((value & 0x7) << 8) | (this._bitfield3 & ~(0x7 << 8))
    }

    /**
     * @type {Integer}
     */
    SlotNumber {
        get => (this._bitfield3 >> 11) & 0x1FFF
        set => this._bitfield3 := ((value & 0x1FFF) << 11) | (this._bitfield3 & ~(0x1FFF << 11))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield3 >> 24) & 0xFF
        set => this._bitfield3 := ((value & 0xFF) << 24) | (this._bitfield3 & ~(0xFF << 24))
    }
}
