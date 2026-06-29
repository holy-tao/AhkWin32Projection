#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LEGACY_TOUCHPAD_FEATURES.ahk" { LEGACY_TOUCHPAD_FEATURES }
#Import ".\TOUCHPAD_SENSITIVITY_LEVEL.ahk" { TOUCHPAD_SENSITIVITY_LEVEL }
#Import ".\TOUCHPAD_PARAMETERS_V1.ahk" { TOUCHPAD_PARAMETERS_V1 }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TOUCHPAD_PARAMETERS_V2 {
    #StructPack 4

    Base : TOUCHPAD_PARAMETERS_V1

    /**
     * This bitfield backs the following members:
     * - button1Supported
     * - button2Supported
     * - button3Supported
     * - Reserved3
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    button1Supported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    button2Supported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    button3Supported {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield >> 3) & 0x1FFFFFFF
        set => this._bitfield := ((value & 0x1FFFFFFF) << 3) | (this._bitfield & ~(0x1FFFFFFF << 3))
    }
}
