#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_SET_ADVANCED_COLOR_STATE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DISPLAYCONFIG_DEVICE_INFO_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DISPLAYCONFIG_DEVICE_INFO_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * This bitfield backs the following members:
     * - enableAdvancedColor
     * - reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    enableAdvancedColor {
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

    /**
     * @type {Integer}
     */
    value {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
