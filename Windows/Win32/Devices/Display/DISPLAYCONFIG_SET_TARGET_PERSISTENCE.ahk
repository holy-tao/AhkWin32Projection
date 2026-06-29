#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * The DISPLAYCONFIG_SET_TARGET_PERSISTENCE structure contains information about setting the display.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_set_target_persistence
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_SET_TARGET_PERSISTENCE {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information for setting the target persistence. The <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER is set to DISPLAYCONFIG_DEVICE_INFO_SET_TARGET_PERSISTENCE. DISPLAYCONFIG_DEVICE_INFO_HEADER also contains the adapter and target identifiers of the target to set the persistence for. The <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER is set to at least the size of the DISPLAYCONFIG_SET_TARGET_PERSISTENCE structure.
     */
    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * This bitfield backs the following members:
     * - bootPersistenceOn
     * - reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    bootPersistenceOn {
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
