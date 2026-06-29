#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS structure contains information about a target device.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_device_name_flags
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - friendlyNameFromEdid
     * - friendlyNameForced
     * - edidIdsValid
     * - reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    friendlyNameFromEdid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    friendlyNameForced {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    edidIdsValid {
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
        DefineProp(this.Prototype, 'value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
