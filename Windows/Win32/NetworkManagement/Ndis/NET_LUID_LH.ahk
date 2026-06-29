#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct NET_LUID_LH {
    #StructPack 8


    struct _Info {
        /**
         * This bitfield backs the following members:
         * - Reserved
         * - NetLuidIndex
         * - IfType
         */
        _bitfield : Int64


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
     */
    Value : Int64

    static __New() {
        DefineProp(this.Prototype, 'Info', { type: NET_LUID_LH._Info, offset: 0 })
        this.DeleteProp("__New")
    }
}
