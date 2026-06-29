#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COLORSPACE_TRANSFORM_DATA_TYPE.ahk" { COLORSPACE_TRANSFORM_DATA_TYPE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM_DATA_CAP {
    #StructPack 4

    DataType : COLORSPACE_TRANSFORM_DATA_TYPE

    /**
     * This bitfield backs the following members:
     * - BitCountOfInteger
     * - BitCountOfFraction
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    BitCountOfInteger {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    BitCountOfFraction {
        get => (this._bitfield >> 6) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 6) | (this._bitfield & ~(0x3F << 6))
    }

    /**
     * @type {Integer}
     */
    BitCountOfExponent {
        get => (this._bitfield1 >> 0) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 0) | (this._bitfield1 & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    BitCountOfMantissa {
        get => (this._bitfield1 >> 6) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 6) | (this._bitfield1 & ~(0x3F << 6))
    }
    NumericRangeMin : Float32

    NumericRangeMax : Float32

    static __New() {
        DefineProp(this.Prototype, '_bitfield1', { type: Int32, offset: 4 })
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
