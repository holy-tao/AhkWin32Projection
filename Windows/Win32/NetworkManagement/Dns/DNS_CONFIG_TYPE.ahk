#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DNS_CONFIG_TYPE enumeration provides DNS configuration type information.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ne-windns-dns_config_type
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_CONFIG_TYPE extends Win32Enum {

    /**
     * For use with Unicode on Windows 2000.
     * Native name: DnsConfigPrimaryDomainName_W
     * @type {Integer (Int32)}
     */
    static PrimaryDomainName_W => 0

    /**
     * For use with ANSI on Windows 2000.
     * Native name: DnsConfigPrimaryDomainName_A
     * @type {Integer (Int32)}
     */
    static PrimaryDomainName_A => 1

    /**
     * For use with UTF8 on Windows 2000.
     * Native name: DnsConfigPrimaryDomainName_UTF8
     * @type {Integer (Int32)}
     */
    static PrimaryDomainName_UTF8 => 2

    /**
     * Not currently available.
     * Native name: DnsConfigAdapterDomainName_W
     * @type {Integer (Int32)}
     */
    static AdapterDomainName_W => 3

    /**
     * Not currently available.
     * Native name: DnsConfigAdapterDomainName_A
     * @type {Integer (Int32)}
     */
    static AdapterDomainName_A => 4

    /**
     * Not currently available.
     * Native name: DnsConfigAdapterDomainName_UTF8
     * @type {Integer (Int32)}
     */
    static AdapterDomainName_UTF8 => 5

    /**
     * For configuring a DNS Server list on Windows 2000.
     * Native name: DnsConfigDnsServerList
     * @type {Integer (Int32)}
     */
    static DnsServerList => 6

    /**
     * Not currently available.
     * Native name: DnsConfigSearchList
     * @type {Integer (Int32)}
     */
    static SearchList => 7

    /**
     * Not currently available.
     * Native name: DnsConfigAdapterInfo
     * @type {Integer (Int32)}
     */
    static AdapterInfo => 8

    /**
     * Specifies that primary host name registration is enabled on Windows 2000.
     * Native name: DnsConfigPrimaryHostNameRegistrationEnabled
     * @type {Integer (Int32)}
     */
    static PrimaryHostNameRegistrationEnabled => 9

    /**
     * Specifies that adapter host name registration is enabled on Windows 2000.
     * Native name: DnsConfigAdapterHostNameRegistrationEnabled
     * @type {Integer (Int32)}
     */
    static AdapterHostNameRegistrationEnabled => 10

    /**
     * Specifies configuration of the maximum number of address registrations on Windows 2000.
     * Native name: DnsConfigAddressRegistrationMaxCount
     * @type {Integer (Int32)}
     */
    static AddressRegistrationMaxCount => 11

    /**
     * Specifies configuration of the host name in Unicode on Windows XP, Windows Server 2003, and later versions of Windows.
     * Native name: DnsConfigHostName_W
     * @type {Integer (Int32)}
     */
    static HostName_W => 12

    /**
     * Specifies configuration of the host name in ANSI on Windows XP, Windows Server 2003, and later versions of Windows.
     * Native name: DnsConfigHostName_A
     * @type {Integer (Int32)}
     */
    static HostName_A => 13

    /**
     * Specifies configuration of the host name in UTF8 on Windows XP, Windows Server 2003, and later versions of Windows.
     * Native name: DnsConfigHostName_UTF8
     * @type {Integer (Int32)}
     */
    static HostName_UTF8 => 14

    /**
     * Specifies configuration of the full host name (fully qualified domain name) in Unicode on Windows XP, Windows Server 2003, and later versions of Windows.
     * Native name: DnsConfigFullHostName_W
     * @type {Integer (Int32)}
     */
    static FullHostName_W => 15

    /**
     * Specifies configuration of the full host name (fully qualified domain name) in ANSI on Windows XP, Windows Server 2003, and later versions of Windows.
     * Native name: DnsConfigFullHostName_A
     * @type {Integer (Int32)}
     */
    static FullHostName_A => 16

    /**
     * Specifies configuration of the full host name (fully qualified domain name) in UTF8 on Windows XP, Windows Server 2003, and later versions of Windows.
     * Native name: DnsConfigFullHostName_UTF8
     * @type {Integer (Int32)}
     */
    static FullHostName_UTF8 => 17

    /**
     * Native name: DnsConfigNameServer
     * @type {Integer (Int32)}
     */
    static NameServer => 18
}
