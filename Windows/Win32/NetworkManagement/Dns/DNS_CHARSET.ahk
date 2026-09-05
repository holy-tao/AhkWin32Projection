#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DNS_CHARSET enumeration specifies the character set used.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_charset
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_CHARSET extends Win32Enum {

    /**
     * The character set is unknown.
     * Native name: DnsCharSetUnknown
     * @type {Integer (Int32)}
     */
    static CharSetUnknown => 0

    /**
     * The character set is Unicode.
     * Native name: DnsCharSetUnicode
     * @type {Integer (Int32)}
     */
    static CharSetUnicode => 1

    /**
     * The character set is UTF8.
     * Native name: DnsCharSetUtf8
     * @type {Integer (Int32)}
     */
    static CharSetUtf8 => 2

    /**
     * The character set is ANSI.
     * Native name: DnsCharSetAnsi
     * @type {Integer (Int32)}
     */
    static CharSetAnsi => 3
}
