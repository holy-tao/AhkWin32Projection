#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_GET_MONITOR_SPECIALIZATION {
    #StructPack 4

    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * This bitfield backs the following members:
     * - isSpecializationEnabled
     * - isSpecializationAvailableForMonitor
     * - isSpecializationAvailableForSystem
     * - reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    isSpecializationEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    isSpecializationAvailableForMonitor {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    isSpecializationAvailableForSystem {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 3) & 0x1FFFFFFF
        set => this._bitfield := ((value & 0x1FFFFFFF) << 3) | (this._bitfield & ~(0x1FFFFFFF << 3))
    }
    static __New() {
        DefineProp(this.Prototype, 'value', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
