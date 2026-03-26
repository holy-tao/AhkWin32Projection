#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TOUCHPAD_PARAMETERS_V1.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TOUCHPAD_PARAMETERS_V2 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {TOUCHPAD_PARAMETERS_V1}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := TOUCHPAD_PARAMETERS_V1(0, this)
            return this.__Base
        }
    }

    /**
     * This bitfield backs the following members:
     * - button1Supported
     * - button2Supported
     * - button3Supported
     * - Reserved3
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

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
