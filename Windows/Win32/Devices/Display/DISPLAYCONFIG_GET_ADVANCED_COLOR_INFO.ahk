#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_GET_ADVANCED_COLOR_INFO extends Win32Struct
{
    static sizeof => 40

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
     * - advancedColorSupported
     * - advancedColorEnabled
     * - wideColorEnforced
     * - advancedColorForceDisabled
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

    /**
     * @type {Integer}
     */
    value {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    colorEncoding {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    bitsPerColorChannel {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
