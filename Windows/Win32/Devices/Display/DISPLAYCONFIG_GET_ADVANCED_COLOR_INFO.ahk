#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import "..\..\Graphics\Gdi\DISPLAYCONFIG_COLOR_ENCODING.ahk" { DISPLAYCONFIG_COLOR_ENCODING }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_GET_ADVANCED_COLOR_INFO {
    #StructPack 4

    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * This bitfield backs the following members:
     * - advancedColorSupported
     * - advancedColorEnabled
     * - wideColorEnforced
     * - advancedColorForceDisabled
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
    advancedColorEnabled {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    wideColorEnforced {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    advancedColorForceDisabled {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 4) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 4) | (this._bitfield & ~(0xFFFFFFF << 4))
    }
    colorEncoding : DISPLAYCONFIG_COLOR_ENCODING

    bitsPerColorChannel : UInt32

    static __New() {
        DefineProp(this.Prototype, 'value', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
