#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class RASCON_IPUI extends Win32Struct {
    static sizeof => 1100

    static packingSize => 4

    /**
     * @type {Guid}
     */
    guidConnection {
        get {
            if(!this.HasProp("__guidConnection"))
                this.__guidConnection := Guid(0, this)
            return this.__guidConnection
        }
    }

    /**
     * @type {BOOL}
     */
    fIPv6Cfg {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {String}
     */
    pszwIpAddr {
        get => StrGet(this.ptr + 24, 15, "UTF-16")
        set => StrPut(value, this.ptr + 24, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwDnsAddr {
        get => StrGet(this.ptr + 56, 15, "UTF-16")
        set => StrPut(value, this.ptr + 56, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwDns2Addr {
        get => StrGet(this.ptr + 88, 15, "UTF-16")
        set => StrPut(value, this.ptr + 88, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwWinsAddr {
        get => StrGet(this.ptr + 120, 15, "UTF-16")
        set => StrPut(value, this.ptr + 120, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwWins2Addr {
        get => StrGet(this.ptr + 152, 15, "UTF-16")
        set => StrPut(value, this.ptr + 152, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwDnsSuffix {
        get => StrGet(this.ptr + 184, 255, "UTF-16")
        set => StrPut(value, this.ptr + 184, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwIpv6Addr {
        get => StrGet(this.ptr + 696, 64, "UTF-16")
        set => StrPut(value, this.ptr + 696, 64, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwIpv6PrefixLength {
        get => NumGet(this, 828, "uint")
        set => NumPut("uint", value, this, 828)
    }

    /**
     * @type {String}
     */
    pszwIpv6DnsAddr {
        get => StrGet(this.ptr + 832, 64, "UTF-16")
        set => StrPut(value, this.ptr + 832, 64, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwIpv6Dns2Addr {
        get => StrGet(this.ptr + 962, 64, "UTF-16")
        set => StrPut(value, this.ptr + 962, 64, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwIPv4InfMetric {
        get => NumGet(this, 1092, "uint")
        set => NumPut("uint", value, this, 1092)
    }

    /**
     * @type {Integer}
     */
    dwIPv6InfMetric {
        get => NumGet(this, 1096, "uint")
        set => NumPut("uint", value, this, 1096)
    }
}
