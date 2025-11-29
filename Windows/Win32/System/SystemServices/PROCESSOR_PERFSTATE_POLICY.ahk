#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESSOR_PERFSTATE_POLICY extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaxThrottle {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MinThrottle {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    BusyAdjThreshold {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    class _Flags_e__Union extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * @type {Integer}
         */
        AsBYTE {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - NoDomainAccounting
         * - IncreasePolicy
         * - DecreasePolicy
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        NoDomainAccounting {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        IncreasePolicy {
            get => (this._bitfield >> 1) & 0x3
            set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
        }
    
        /**
         * @type {Integer}
         */
        DecreasePolicy {
            get => (this._bitfield >> 3) & 0x3
            set => this._bitfield := ((value & 0x3) << 3) | (this._bitfield & ~(0x3 << 3))
        }
    
    }

    /**
     * @type {Integer}
     */
    Spare {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {_Flags_e__Union}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags_e__Union(7, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    TimeCheck {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IncreaseTime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DecreaseTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    IncreasePercent {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DecreasePercent {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
