#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DNS_CHARSET enumeration specifies the character set used.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ne-windns-dns_charset
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CHARSET extends Win32Enum{

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
