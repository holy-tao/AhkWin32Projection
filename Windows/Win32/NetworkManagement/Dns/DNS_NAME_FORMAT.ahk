#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DNS_NAME_FORMAT enumeration specifies name format information for DNS.
 * @see https://docs.microsoft.com/windows/win32/api//windns/ne-windns-dns_name_format
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_NAME_FORMAT{

    /**
     * The name format is a DNS domain.
     * @type {Integer (Int32)}
     */
    static DnsNameDomain => 0

    /**
     * The name format is a DNS domain label.
     * @type {Integer (Int32)}
     */
    static DnsNameDomainLabel => 1

    /**
     * The name format is a full DNS host name.
     * @type {Integer (Int32)}
     */
    static DnsNameHostnameFull => 2

    /**
     * The name format is a  DNS host label.
     * @type {Integer (Int32)}
     */
    static DnsNameHostnameLabel => 3

    /**
     * The name format is a  DNS wildcard.
     * @type {Integer (Int32)}
     */
    static DnsNameWildcard => 4

    /**
     * The name format is a  DNS SRV record.
     * @type {Integer (Int32)}
     */
    static DnsNameSrvRecord => 5

    /**
     * Windows 7 or later: The name format is a DNS domain or a full DNS host name.
     * @type {Integer (Int32)}
     */
    static DnsNameValidateTld => 6
}
