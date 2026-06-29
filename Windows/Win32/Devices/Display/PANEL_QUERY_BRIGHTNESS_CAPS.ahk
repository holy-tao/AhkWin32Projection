#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRIGHTNESS_INTERFACE_VERSION.ahk" { BRIGHTNESS_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_QUERY_BRIGHTNESS_CAPS {
    #StructPack 4

    Version : BRIGHTNESS_INTERFACE_VERSION

    /**
     * This bitfield backs the following members:
     * - Smooth
     * - Adaptive
     * - NitsCalibrated
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Smooth {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Adaptive {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    NitsCalibrated {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
