#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_SET_WCG_STATE {
    #StructPack 4

    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * This bitfield backs the following members:
     * - enableWcg
     * - reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    enableWcg {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 1) & 0x7FFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'value', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
