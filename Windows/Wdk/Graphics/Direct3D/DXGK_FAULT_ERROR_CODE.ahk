#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_FAULT_ERROR_CODE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - IsDeviceSpecificCode
     * - GeneralErrorCode
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IsDeviceSpecificCode {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    GeneralErrorCode {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }

    /**
     * @type {Integer}
     */
    IsDeviceSpecificCodeReservedBit {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DeviceSpecificCode {
        get => (this._bitfield1 >> 1) & 0x7FFFFFFF
        set => this._bitfield1 := ((value & 0x7FFFFFFF) << 1) | (this._bitfield1 & ~(0x7FFFFFFF << 1))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield1', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
