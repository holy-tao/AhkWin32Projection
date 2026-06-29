#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @architecture X64, Arm64
 */
export default struct IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Flags
     * - TryOffset
     */
    _bitfield1 : Int32


    /**
     * @type {Integer}
     */
    Flags {
        get => (this._bitfield1 >> 0) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    TryOffset {
        get => (this._bitfield1 >> 16) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 16) | (this._bitfield1 & ~(0xFFFF << 16))
    }
    /**
     * This bitfield backs the following members:
     * - TryLength
     * - HandlerOffset
     * - HandlerLength
     */
    _bitfield2 : Int32


    /**
     * @type {Integer}
     */
    TryLength {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    HandlerOffset {
        get => (this._bitfield2 >> 8) & 0xFFFF
        set => this._bitfield2 := ((value & 0xFFFF) << 8) | (this._bitfield2 & ~(0xFFFF << 8))
    }

    /**
     * @type {Integer}
     */
    HandlerLength {
        get => (this._bitfield2 >> 24) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 24) | (this._bitfield2 & ~(0xFF << 24))
    }
    ClassToken : UInt32

    static __New() {
        DefineProp(this.Prototype, 'FilterOffset', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
