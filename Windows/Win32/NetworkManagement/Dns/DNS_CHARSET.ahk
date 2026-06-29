#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_CHARSET enumeration specifies the character set used.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_charset
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CHARSET {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The character set is unknown.
     * @type {Integer (Int32)}
     */
    static DnsCharSetUnknown => 0

    /**
     * The character set is Unicode.
     * @type {Integer (Int32)}
     */
    static DnsCharSetUnicode => 1

    /**
     * The character set is UTF8.
     * @type {Integer (Int32)}
     */
    static DnsCharSetUtf8 => 2

    /**
     * The character set is ANSI.
     * @type {Integer (Int32)}
     */
    static DnsCharSetAnsi => 3
}
