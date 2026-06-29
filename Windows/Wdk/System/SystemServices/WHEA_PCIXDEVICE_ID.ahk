#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIXDEVICE_ID {
    #StructPack 4

    VendorId : UInt16

    DeviceId : UInt16

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
     * - BusNumber
     * - SegmentNumber
     * - Reserved1
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
    BusNumber {
        get => (this._bitfield2 >> 8) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 8) | (this._bitfield2 & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    SegmentNumber {
        get => (this._bitfield2 >> 16) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 16) | (this._bitfield2 & ~(0xFF << 16))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield2 >> 24) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 24) | (this._bitfield2 & ~(0xFF << 24))
    }
    Reserved2 : UInt32

}
