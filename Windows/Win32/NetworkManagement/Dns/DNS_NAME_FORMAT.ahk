#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_NAME_FORMAT enumeration specifies name format information for DNS.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_name_format
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_NAME_FORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
