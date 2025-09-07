#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DNS_CONFIG_TYPE enumeration provides DNS configuration type information.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_config_type
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONFIG_TYPE{

    /**
     * For use with Unicode on Windows 2000.
     * @type {Integer (Int32)}
     */
    static DnsConfigPrimaryDomainName_W => 0

    /**
     * For use with ANSI on Windows 2000.
     * @type {Integer (Int32)}
     */
    static DnsConfigPrimaryDomainName_A => 1

    /**
     * For use with UTF8 on Windows 2000.
     * @type {Integer (Int32)}
     */
    static DnsConfigPrimaryDomainName_UTF8 => 2

    /**
     * Not currently available.
     * @type {Integer (Int32)}
     */
    static DnsConfigAdapterDomainName_W => 3

    /**
     * Not currently available.
     * @type {Integer (Int32)}
     */
    static DnsConfigAdapterDomainName_A => 4

    /**
     * Not currently available.
     * @type {Integer (Int32)}
     */
    static DnsConfigAdapterDomainName_UTF8 => 5

    /**
     * For configuring a DNS Server list on Windows 2000.
     * @type {Integer (Int32)}
     */
    static DnsConfigDnsServerList => 6

    /**
     * Not currently available.
     * @type {Integer (Int32)}
     */
    static DnsConfigSearchList => 7

    /**
     * Not currently available.
     * @type {Integer (Int32)}
     */
    static DnsConfigAdapterInfo => 8

    /**
     * Specifies that primary host name registration is enabled on Windows 2000.
     * @type {Integer (Int32)}
     */
    static DnsConfigPrimaryHostNameRegistrationEnabled => 9

    /**
     * Specifies that adapter host name registration is enabled on Windows 2000.
     * @type {Integer (Int32)}
     */
    static DnsConfigAdapterHostNameRegistrationEnabled => 10

    /**
     * Specifies configuration of the maximum number of address registrations on Windows 2000.
     * @type {Integer (Int32)}
     */
    static DnsConfigAddressRegistrationMaxCount => 11

    /**
     * Specifies configuration of the host name in Unicode on Windows XP, Windows Server 2003, and later versions of Windows.
     * @type {Integer (Int32)}
     */
    static DnsConfigHostName_W => 12

    /**
     * Specifies configuration of the host name in ANSI on Windows XP, Windows Server 2003, and later versions of Windows.
     * @type {Integer (Int32)}
     */
    static DnsConfigHostName_A => 13

    /**
     * Specifies configuration of the host name in UTF8 on Windows XP, Windows Server 2003, and later versions of Windows.
     * @type {Integer (Int32)}
     */
    static DnsConfigHostName_UTF8 => 14

    /**
     * Specifies configuration of the full host name (fully qualified domain name) in Unicode on Windows XP, Windows Server 2003, and later versions of Windows.
     * @type {Integer (Int32)}
     */
    static DnsConfigFullHostName_W => 15

    /**
     * Specifies configuration of the full host name (fully qualified domain name) in ANSI on Windows XP, Windows Server 2003, and later versions of Windows.
     * @type {Integer (Int32)}
     */
    static DnsConfigFullHostName_A => 16

    /**
     * Specifies configuration of the full host name (fully qualified domain name) in UTF8 on Windows XP, Windows Server 2003, and later versions of Windows.
     * @type {Integer (Int32)}
     */
    static DnsConfigFullHostName_UTF8 => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DnsConfigNameServer => 18
}
