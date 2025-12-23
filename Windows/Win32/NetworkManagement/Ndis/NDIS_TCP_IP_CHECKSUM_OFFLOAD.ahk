#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_TCP_IP_CHECKSUM_OFFLOAD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    class _IPv4Transmit extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Encapsulation {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - IpOptionsSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         * - IpChecksum
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        IpOptionsSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    
        /**
         * @type {Integer}
         */
        IpChecksum {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }
    
    }

    class _IPv4Receive extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Encapsulation {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - IpOptionsSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         * - IpChecksum
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        IpOptionsSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    
        /**
         * @type {Integer}
         */
        IpChecksum {
            get => (this._bitfield >> 8) & 0x3
            set => this._bitfield := ((value & 0x3) << 8) | (this._bitfield & ~(0x3 << 8))
        }
    
    }

    class _IPv6Transmit extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Encapsulation {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - IpExtensionHeadersSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        IpExtensionHeadersSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    
    }

    class _IPv6Receive extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Encapsulation {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * This bitfield backs the following members:
         * - IpExtensionHeadersSupported
         * - TcpOptionsSupported
         * - TcpChecksum
         * - UdpChecksum
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        IpExtensionHeadersSupported {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => (this._bitfield >> 6) & 0x3
            set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
        }
    
    }

    /**
     * @type {_IPv4Transmit}
     */
    IPv4Transmit{
        get {
            if(!this.HasProp("__IPv4Transmit"))
                this.__IPv4Transmit := %this.__Class%._IPv4Transmit(0, this)
            return this.__IPv4Transmit
        }
    }

    /**
     * @type {_IPv4Receive}
     */
    IPv4Receive{
        get {
            if(!this.HasProp("__IPv4Receive"))
                this.__IPv4Receive := %this.__Class%._IPv4Receive(8, this)
            return this.__IPv4Receive
        }
    }

    /**
     * @type {_IPv6Transmit}
     */
    IPv6Transmit{
        get {
            if(!this.HasProp("__IPv6Transmit"))
                this.__IPv6Transmit := %this.__Class%._IPv6Transmit(16, this)
            return this.__IPv6Transmit
        }
    }

    /**
     * @type {_IPv6Receive}
     */
    IPv6Receive{
        get {
            if(!this.HasProp("__IPv6Receive"))
                this.__IPv6Receive := %this.__Class%._IPv6Receive(24, this)
            return this.__IPv6Receive
        }
    }
}
