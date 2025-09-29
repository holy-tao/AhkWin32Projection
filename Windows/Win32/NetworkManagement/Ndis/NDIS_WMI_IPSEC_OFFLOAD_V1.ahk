#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_IPSEC_OFFLOAD_V1 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    class _Supported extends Win32Struct {
        static sizeof => 80
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
        static sizeof => 80
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Md5 {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Sha_1 {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        Transport {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Tunnel {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Send {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        Receive {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    class _IPv4ESP extends Win32Struct {
        static sizeof => 80
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Des {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        TripleDes {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        NullEsp {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Transport {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        Tunnel {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
        /**
         * @type {Integer}
         */
        Send {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        Receive {
            get => NumGet(this, 28, "uint")
            set => NumPut("uint", value, this, 28)
        }
    
    }

    /**
     * @type {_Supported}
     */
    Supported{
        get {
            if(!this.HasProp("__Supported"))
                this.__Supported := %this.__Class%._Supported(this.ptr + 0)
            return this.__Supported
        }
    }

    /**
     * @type {_IPv4AH}
     */
    IPv4AH{
        get {
            if(!this.HasProp("__IPv4AH"))
                this.__IPv4AH := %this.__Class%._IPv4AH(this.ptr + 24)
            return this.__IPv4AH
        }
    }

    /**
     * @type {_IPv4ESP}
     */
    IPv4ESP{
        get {
            if(!this.HasProp("__IPv4ESP"))
                this.__IPv4ESP := %this.__Class%._IPv4ESP(this.ptr + 48)
            return this.__IPv4ESP
        }
    }
}
