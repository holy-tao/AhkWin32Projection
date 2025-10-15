#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    pwszFriendlyName{
        get {
            if(!this.HasProp("__pwszFriendlyName"))
                this.__pwszFriendlyName := PWSTR(this.ptr + 8)
            return this.__pwszFriendlyName
        }
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
         * @type {PWSTR}
         */
        pwszServer{
            get {
                if(!this.HasProp("__pwszServer"))
                    this.__pwszServer := PWSTR(this.ptr + 0)
                return this.__pwszServer
            }
        }
    
        /**
         * @type {PWSTR}
         */
        pwszUsername{
            get {
                if(!this.HasProp("__pwszUsername"))
                    this.__pwszUsername := PWSTR(this.ptr + 8)
                return this.__pwszUsername
            }
        }
    
        /**
         * @type {PWSTR}
         */
        pwszPassword{
            get {
                if(!this.HasProp("__pwszPassword"))
                    this.__pwszPassword := PWSTR(this.ptr + 16)
                return this.__pwszPassword
            }
        }
    
        /**
         * @type {PWSTR}
         */
        pwszException{
            get {
                if(!this.HasProp("__pwszException"))
                    this.__pwszException := PWSTR(this.ptr + 24)
                return this.__pwszException
            }
        }
    
        /**
         * @type {PWSTR}
         */
        pwszExtraInfo{
            get {
                if(!this.HasProp("__pwszExtraInfo"))
                    this.__pwszExtraInfo := PWSTR(this.ptr + 32)
                return this.__pwszExtraInfo
            }
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
         * @type {PWSTR}
         */
        pwszScript{
            get {
                if(!this.HasProp("__pwszScript"))
                    this.__pwszScript := PWSTR(this.ptr + 0)
                return this.__pwszScript
            }
        }
    
        /**
         * @type {PWSTR}
         */
        pwszUsername{
            get {
                if(!this.HasProp("__pwszUsername"))
                    this.__pwszUsername := PWSTR(this.ptr + 8)
                return this.__pwszUsername
            }
        }
    
        /**
         * @type {PWSTR}
         */
        pwszPassword{
            get {
                if(!this.HasProp("__pwszPassword"))
                    this.__pwszPassword := PWSTR(this.ptr + 16)
                return this.__pwszPassword
            }
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
