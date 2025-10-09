#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_PROXY_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwszFriendlyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Switch {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    class _DNS_CONNECTION_PROXY_INFO_CONFIG extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Pointer<Char>}
         */
        pwszServer {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwszUsername {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwszPassword {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwszException {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwszExtraInfo {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        Port {
            get => NumGet(this, 40, "ushort")
            set => NumPut("ushort", value, this, 40)
        }
    
    }

    class _DNS_CONNECTION_PROXY_INFO_SCRIPT extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Pointer<Char>}
         */
        pwszScript {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwszUsername {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pwszPassword {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    /**
     * @type {_DNS_CONNECTION_PROXY_INFO_CONFIG}
     */
    Config{
        get {
            if(!this.HasProp("__Config"))
                this.__Config := %this.__Class%._DNS_CONNECTION_PROXY_INFO_CONFIG(this.ptr + 24)
            return this.__Config
        }
    }

    /**
     * @type {_DNS_CONNECTION_PROXY_INFO_SCRIPT}
     */
    Script{
        get {
            if(!this.HasProp("__Script"))
                this.__Script := %this.__Class%._DNS_CONNECTION_PROXY_INFO_SCRIPT(this.ptr + 24)
            return this.__Script
        }
    }
}
