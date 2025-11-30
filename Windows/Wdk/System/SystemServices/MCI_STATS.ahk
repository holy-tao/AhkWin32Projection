#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MCI_STATS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _MciStats extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        McaCod {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MsCod {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * This bitfield backs the following members:
         * - OtherInfo
         * - Damage
         * - AddressValid
         * - MiscValid
         * - Enabled
         * - UnCorrected
         * - OverFlow
         * - Valid
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        OtherInfo {
            get => (this._bitfield >> 0) & 0x1FFFFFF
            set => this._bitfield := ((value & 0x1FFFFFF) << 0) | (this._bitfield & ~(0x1FFFFFF << 0))
        }
    
        /**
         * @type {Integer}
         */
        Damage {
            get => (this._bitfield >> 25) & 0x1
            set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
        }
    
        /**
         * @type {Integer}
         */
        AddressValid {
            get => (this._bitfield >> 26) & 0x1
            set => this._bitfield := ((value & 0x1) << 26) | (this._bitfield & ~(0x1 << 26))
        }
    
        /**
         * @type {Integer}
         */
        MiscValid {
            get => (this._bitfield >> 27) & 0x1
            set => this._bitfield := ((value & 0x1) << 27) | (this._bitfield & ~(0x1 << 27))
        }
    
        /**
         * @type {Integer}
         */
        Enabled {
            get => (this._bitfield >> 28) & 0x1
            set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
        }
    
        /**
         * @type {Integer}
         */
        UnCorrected {
            get => (this._bitfield >> 29) & 0x1
            set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
        }
    
        /**
         * @type {Integer}
         */
        OverFlow {
            get => (this._bitfield >> 30) & 0x1
            set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
        }
    
        /**
         * @type {Integer}
         */
        Valid {
            get => (this._bitfield >> 31) & 0x1
            set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
        }
    
    }

    /**
     * @type {_MciStats}
     */
    MciStats{
        get {
            if(!this.HasProp("__MciStats"))
                this.__MciStats := %this.__Class%._MciStats(0, this)
            return this.__MciStats
        }
    }

    /**
     * @type {Integer}
     */
    QuadPart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
