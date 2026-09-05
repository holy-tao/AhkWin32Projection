#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DNS_NAME_FORMAT enumeration specifies name format information for DNS.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_name_format
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_NAME_FORMAT extends Win32Enum {

    /**
     * The name format is a DNS domain.
     * Native name: DnsNameDomain
     * @type {Integer (Int32)}
     */
    static Domain => 0

    /**
     * The name format is a DNS domain label.
     * Native name: DnsNameDomainLabel
     * @type {Integer (Int32)}
     */
    static DomainLabel => 1

    /**
     * The name format is a full DNS host name.
     * Native name: DnsNameHostnameFull
     * @type {Integer (Int32)}
     */
    static HostnameFull => 2

    /**
     * The name format is a  DNS host label.
     * Native name: DnsNameHostnameLabel
     * @type {Integer (Int32)}
     */
    static HostnameLabel => 3

    /**
     * The name format is a  DNS wildcard.
     * Native name: DnsNameWildcard
     * @type {Integer (Int32)}
     */
    static Wildcard => 4

    /**
     * The name format is a  DNS SRV record.
     * Native name: DnsNameSrvRecord
     * @type {Integer (Int32)}
     */
    static SrvRecord => 5

    /**
     * Windows 7 or later: The name format is a DNS domain or a full DNS host name.
     * Native name: DnsNameValidateTld
     * @type {Integer (Int32)}
     */
    static ValidateTld => 6
}
