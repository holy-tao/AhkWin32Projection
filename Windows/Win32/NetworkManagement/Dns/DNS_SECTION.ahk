#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DNS_SECTION enumeration is used in record flags, and as an index into DNS wire message header section counts.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_section
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_SECTION extends Win32Enum {

    /**
     * The DNS section specified is a DNS question.
     * Native name: DnsSectionQuestion
     * @type {Integer (Int32)}
     */
    static Question => 0

    /**
     * The DNS section specified is a DNS answer.
     * Native name: DnsSectionAnswer
     * @type {Integer (Int32)}
     */
    static Answer => 1

    /**
     * The DNS section specified indicates a DNS authority.
     * Native name: DnsSectionAuthority
     * @type {Integer (Int32)}
     */
    static Authority => 2

    /**
     * The DNS section specified is additional DNS information.
     * Native name: DnsSectionAddtional
     * @type {Integer (Int32)}
     */
    static Addtional => 3
}
