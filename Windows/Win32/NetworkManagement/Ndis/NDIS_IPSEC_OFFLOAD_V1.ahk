#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_IPSEC_OFFLOAD_V1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _Supported extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Encapsulation {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AhEspCombined {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        TransportTunnelCombined {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        IPv4Options {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    class _IPv4AH extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Md5
         * - Sha_1
         * - Transport
         * - Tunnel
         * - Send
         * - Receive
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Md5 {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Sha_1 {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    
        /**
         * @type {Integer}
         */
        Transport {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        Tunnel {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    
        /**
         * @type {Integer}
         */
        Send {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }
    
        /**
         * @type {Integer}
         */
        Receive {
            get => (this._bitfield >> 10) & 0x3
            set => this._bitfield := ((value & 0x3) << 10) | (this._bitfield & ~(0x3 << 10))
        }
    
    }

    class _IPv4ESP extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Des
         * - Reserved
         * - TripleDes
         * - NullEsp
         * - Transport
         * - Tunnel
         * - Send
         * - Receive
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Des {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        TripleDes {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        NullEsp {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    
        /**
         * @type {Integer}
         */
        Transport {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }
    
        /**
         * @type {Integer}
         */
        Tunnel {
            get => (this._bitfield >> 10) & 0x3
            set => this._bitfield := ((value & 0x3) << 10) | (this._bitfield & ~(0x3 << 10))
        }
    
        /**
         * @type {Integer}
         */
        Send {
            get => (this._bitfield >> 12) & 0x3
            set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
        }
    
        /**
         * @type {Integer}
         */
        Receive {
            get => (this._bitfield >> 14) & 0x3
            set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
        }
    
    }

    /**
     * @type {_Supported}
     */
    Supported{
        get {
            if(!this.HasProp("__Supported"))
                this.__Supported := %this.__Class%._Supported(0, this)
            return this.__Supported
        }
    }

    /**
     * @type {_IPv4AH}
     */
    IPv4AH{
        get {
            if(!this.HasProp("__IPv4AH"))
                this.__IPv4AH := %this.__Class%._IPv4AH(20, this)
            return this.__IPv4AH
        }
    }

    /**
     * @type {_IPv4ESP}
     */
    IPv4ESP{
        get {
            if(!this.HasProp("__IPv4ESP"))
                this.__IPv4ESP := %this.__Class%._IPv4ESP(24, this)
            return this.__IPv4ESP
        }
    }
}
