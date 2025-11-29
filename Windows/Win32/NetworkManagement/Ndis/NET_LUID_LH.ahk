#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ns-ifdef-net_luid_lh
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_LUID_LH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _Info extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Reserved
         * - NetLuidIndex
         * - IfType
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        NetLuidIndex {
            get => (this._bitfield >> 24) & 0xFFFFFF
            set => this._bitfield := ((value & 0xFFFFFF) << 24) | (this._bitfield & ~(0xFFFFFF << 24))
        }
    
        /**
         * @type {Integer}
         */
        IfType {
            get => (this._bitfield >> 48) & 0xFFFF
            set => this._bitfield := ((value & 0xFFFF) << 48) | (this._bitfield & ~(0xFFFF << 48))
        }
    
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_Info}
     */
    Info{
        get {
            if(!this.HasProp("__Info"))
                this.__Info := %this.__Class%._Info(0, this)
            return this.__Info
        }
    }
}
