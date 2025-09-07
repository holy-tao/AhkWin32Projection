#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class RASCON_IPUI extends Win32Struct
{
    static sizeof => 1096

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    guidConnection {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fIPv6Cfg {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {String}
     */
    pszwIpAddr {
        get => StrGet(this.ptr + 16, 15, "UTF-16")
        set => StrPut(value, this.ptr + 16, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwDnsAddr {
        get => StrGet(this.ptr + 48, 15, "UTF-16")
        set => StrPut(value, this.ptr + 48, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwDns2Addr {
        get => StrGet(this.ptr + 80, 15, "UTF-16")
        set => StrPut(value, this.ptr + 80, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwWinsAddr {
        get => StrGet(this.ptr + 112, 15, "UTF-16")
        set => StrPut(value, this.ptr + 112, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwWins2Addr {
        get => StrGet(this.ptr + 144, 15, "UTF-16")
        set => StrPut(value, this.ptr + 144, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwDnsSuffix {
        get => StrGet(this.ptr + 176, 255, "UTF-16")
        set => StrPut(value, this.ptr + 176, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwIpv6Addr {
        get => StrGet(this.ptr + 688, 64, "UTF-16")
        set => StrPut(value, this.ptr + 688, 64, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwIpv6PrefixLength {
        get => NumGet(this, 820, "uint")
        set => NumPut("uint", value, this, 820)
    }

    /**
     * @type {String}
     */
    pszwIpv6DnsAddr {
        get => StrGet(this.ptr + 824, 64, "UTF-16")
        set => StrPut(value, this.ptr + 824, 64, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszwIpv6Dns2Addr {
        get => StrGet(this.ptr + 954, 64, "UTF-16")
        set => StrPut(value, this.ptr + 954, 64, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwIPv4InfMetric {
        get => NumGet(this, 1084, "uint")
        set => NumPut("uint", value, this, 1084)
    }

    /**
     * @type {Integer}
     */
    dwIPv6InfMetric {
        get => NumGet(this, 1088, "uint")
        set => NumPut("uint", value, this, 1088)
    }
}
