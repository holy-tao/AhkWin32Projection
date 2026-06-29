#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POWER_LIMIT_TYPES.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class POWER_LIMIT_ATTRIBUTES extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - SupportTimeParameter
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        SupportTimeParameter {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        AsUlong {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {POWER_LIMIT_TYPES}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DomainId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MaxValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MinValue {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MinTimeParameter {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MaxTimeParameter {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DefaultACValue {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    DefaultDCValue {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := POWER_LIMIT_ATTRIBUTES._Flags(32, this)
            return this.__Flags
        }
    }
}
