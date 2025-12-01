#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The locally unique identifier (LUID) for a network interface.
 * @remarks
 * The <b>NET_LUID</b> structure is protocol independent and works with network interfaces for both the IPv6 and IPv4 protocol. The <b>NET_LUID</b> structure is defined on Windows Vista and later. 
 * 
 * The <b>IF_LUID</b> and <b>NET_LUID_LH</b> structures are other names that can be used for the <b>NET_LUID</b> union.
 * 
 * The values for the <b>IfType</b> bitfield are defined in the <i>Ipifcons.h</i> include file. Only the possible values listed in the description of the <b>IfType</b> member are currently supported.
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
     * Type: <b>ULONG64</b>
     * 
     * A 64-bit value that represents the LUID.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A named union containing the component fields in the 64-bit LUID  <b>Value</b> member.
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
