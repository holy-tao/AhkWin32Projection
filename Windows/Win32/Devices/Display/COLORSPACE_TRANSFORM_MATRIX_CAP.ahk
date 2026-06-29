#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COLORSPACE_TRANSFORM_DATA_TYPE.ahk" { COLORSPACE_TRANSFORM_DATA_TYPE }
#Import ".\COLORSPACE_TRANSFORM_DATA_CAP.ahk" { COLORSPACE_TRANSFORM_DATA_CAP }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM_MATRIX_CAP {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - MatrixSizeX
     * - MatrixSizeY
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    MatrixSizeX {
        get => (this._bitfield >> 0) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 0) | (this._bitfield & ~(0x3FF << 0))
    }

    /**
     * @type {Integer}
     */
    MatrixSizeY {
        get => (this._bitfield >> 10) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 10) | (this._bitfield & ~(0x3FF << 10))
    }
    DataCap : COLORSPACE_TRANSFORM_DATA_CAP

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
