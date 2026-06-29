#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXTS_PTE_INFO {
    #StructPack 8

    SizeOfStruct : UInt32

    VirtualAddress : Int64

    PpeAddress : Int64

    PdeAddress : Int64

    PteAddress : Int64

    Pfn : Int64

    Levels : Int64

    /**
     * This bitfield backs the following members:
     * - PteValid
     * - PteTransition
     * - Prototype
     * - Protection
     * - Reserved
     */
    _bitfield1 : Int32


    /**
     * @type {Integer}
     */
    PteValid {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PteTransition {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Prototype {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Protection {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }
    /**
     * This bitfield backs the following members:
     * - ReadInProgress
     * - WriteInProgress
     * - Modified
     */
    _bitfield2 : Int32


    /**
     * @type {Integer}
     */
    ReadInProgress {
        get => (this._bitfield2 >> 0) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 0) | (this._bitfield2 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    WriteInProgress {
        get => (this._bitfield2 >> 1) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 1) | (this._bitfield2 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Modified {
        get => (this._bitfield2 >> 2) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 2) | (this._bitfield2 & ~(0x1 << 2))
    }
}
