#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_BUS_ERROR {
    #StructPack 8

    ValidationBit : IntPtr

    /**
     * This bitfield backs the following members:
     * - TransactionType
     * - Operation
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    TransactionType {
        get => (this._bitfield1 >> 0) & 0x3
        set => this._bitfield1 := ((value & 0x3) << 0) | (this._bitfield1 & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Operation {
        get => (this._bitfield1 >> 2) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 2) | (this._bitfield1 & ~(0xF << 2))
    }
    /**
     * This bitfield backs the following members:
     * - Level
     * - ProcessorContextCorrupt
     * - Corrected
     * - PrecisePC
     * - RestartablePC
     */
    _bitfield2 : Int8


    /**
     * @type {Integer}
     */
    Level {
        get => (this._bitfield2 >> 0) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 0) | (this._bitfield2 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    ProcessorContextCorrupt {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Corrected {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PrecisePC {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    RestartablePC {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }
    /**
     * This bitfield backs the following members:
     * - ParticipationType
     * - TimeOut
     * - AddressSpace
     */
    _bitfield3 : Int8


    /**
     * @type {Integer}
     */
    ParticipationType {
        get => (this._bitfield3 >> 0) & 0x3
        set => this._bitfield3 := ((value & 0x3) << 0) | (this._bitfield3 & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    TimeOut {
        get => (this._bitfield3 >> 2) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 2) | (this._bitfield3 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    AddressSpace {
        get => (this._bitfield3 >> 3) & 0x3
        set => this._bitfield3 := ((value & 0x3) << 3) | (this._bitfield3 & ~(0x3 << 3))
    }
    /**
     * This bitfield backs the following members:
     * - MemoryAccessAttributes
     */
    _bitfield4 : Int16


    /**
     * @type {Integer}
     */
    MemoryAccessAttributes {
        get => (this._bitfield4 >> 0) & 0x1FF
        set => this._bitfield4 := ((value & 0x1FF) << 0) | (this._bitfield4 & ~(0x1FF << 0))
    }
    /**
     * This bitfield backs the following members:
     * - AccessMode
     */
    _bitfield5 : Int8


    /**
     * @type {Integer}
     */
    AccessMode {
        get => (this._bitfield5 >> 0) & 0x1
        set => this._bitfield5 := ((value & 0x1) << 0) | (this._bitfield5 & ~(0x1 << 0))
    }
    /**
     * This bitfield backs the following members:
     * - Reserved
     */
    _bitfield6 : Int32

}
