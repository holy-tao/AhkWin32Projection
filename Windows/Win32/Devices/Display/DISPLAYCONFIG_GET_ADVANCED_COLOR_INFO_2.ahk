#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import "..\..\Graphics\Gdi\DISPLAYCONFIG_COLOR_ENCODING.ahk" { DISPLAYCONFIG_COLOR_ENCODING }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import "..\..\Graphics\Gdi\DISPLAYCONFIG_ADVANCED_COLOR_MODE.ahk" { DISPLAYCONFIG_ADVANCED_COLOR_MODE }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_GET_ADVANCED_COLOR_INFO_2 {
    #StructPack 4

    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * This bitfield backs the following members:
     * - advancedColorSupported
     * - advancedColorActive
     * - reserved1
     * - advancedColorLimitedByPolicy
     * - highDynamicRangeSupported
     * - highDynamicRangeUserEnabled
     * - wideColorSupported
     * - wideColorUserEnabled
     * - reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    advancedColorSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    advancedColorActive {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    reserved1 {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    advancedColorLimitedByPolicy {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    highDynamicRangeSupported {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    highDynamicRangeUserEnabled {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    wideColorSupported {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    wideColorUserEnabled {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 8) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 8) | (this._bitfield & ~(0xFFFFFF << 8))
    }
    colorEncoding : DISPLAYCONFIG_COLOR_ENCODING

    bitsPerColorChannel : UInt32

    activeColorMode : DISPLAYCONFIG_ADVANCED_COLOR_MODE

    static __New() {
        DefineProp(this.Prototype, 'value', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
