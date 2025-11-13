#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_ADAPTER_POWER_STATES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    class _States extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - Online
         * - RecState
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
        Online {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        RecState {
            get => (this._bitfield >> 1) & 0x3
            set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
        }
    
    }

    /**
     * @type {_States}
     */
    States{
        get {
            if(!this.HasProp("__States"))
                this.__States := %this.__Class%._States(0, this)
            return this.__States
        }
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
