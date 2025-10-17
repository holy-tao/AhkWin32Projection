#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_REINITIALIZE_MEDIA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    class _SanitizeOption extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - SanitizeMethod
         * - DisallowUnrestrictedSanitizeExit
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
        SanitizeMethod {
            get => (this._bitfield >> 0) & 0xF
            set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        DisallowUnrestrictedSanitizeExit {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 5) & 0x7FFFFFF
            set => this._bitfield := ((value & 0x7FFFFFF) << 5) | (this._bitfield & ~(0x7FFFFFF << 5))
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TimeoutInSeconds {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_SanitizeOption}
     */
    SanitizeOption{
        get {
            if(!this.HasProp("__SanitizeOption"))
                this.__SanitizeOption := %this.__Class%._SanitizeOption(12, this)
            return this.__SanitizeOption
        }
    }
}
