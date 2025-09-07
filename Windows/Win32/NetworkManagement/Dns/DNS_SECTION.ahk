#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DNS_SECTION enumeration is used in record flags, and as an index into DNS wire message header section counts.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_section
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SECTION{

    /**
     * The DNS section specified is a DNS question.
     * @type {Integer (Int32)}
     */
    static DnsSectionQuestion => 0

    /**
     * The DNS section specified is a DNS answer.
     * @type {Integer (Int32)}
     */
    static DnsSectionAnswer => 1

    /**
     * The DNS section specified indicates a DNS authority.
     * @type {Integer (Int32)}
     */
    static DnsSectionAuthority => 2

    /**
     * The DNS section specified is additional DNS information.
     * @type {Integer (Int32)}
     */
    static DnsSectionAddtional => 3
}
