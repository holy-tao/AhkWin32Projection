#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of computer name.
 * @see https://learn.microsoft.com/windows/win32/api/sysinfoapi/ne-sysinfoapi-computer_name_format
 * @namespace Windows.Win32.System.SystemInformation
 */
class COMPUTER_NAME_FORMAT extends Win32Enum {

    /**
     * The NetBIOS name of the local computer or the cluster associated with the local computer. This name is limited to MAX_COMPUTERNAME_LENGTH + 1 characters and may be a truncated version of the DNS host name. For example, if the DNS host name is "corporate-mail-server", the NetBIOS name would be "corporate-mail-".
     * Native name: ComputerNameNetBIOS
     * @type {Integer (Int32)}
     */
    static NetBIOS => 0

    /**
     * The DNS name of the local computer or the cluster associated with the local computer.
     * Native name: ComputerNameDnsHostname
     * @type {Integer (Int32)}
     */
    static DnsHostname => 1

    /**
     * The name of the DNS domain assigned to the local computer or the cluster associated with the local computer.
     * Native name: ComputerNameDnsDomain
     * @type {Integer (Int32)}
     */
    static DnsDomain => 2

    /**
     * The fully qualified DNS name that uniquely identifies the local computer or the cluster associated with the local computer. 
     * 
     * 
     * 
     * 
     * This name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>. For example, if the DNS host name is "corporate-mail-server" and the DNS domain name is "microsoft.com", the fully qualified DNS name is "corporate-mail-server.microsoft.com".
     * Native name: ComputerNameDnsFullyQualified
     * @type {Integer (Int32)}
     */
    static DnsFullyQualified => 3

    /**
     * The NetBIOS name of the local computer. On a cluster, this is the NetBIOS name of the local node on the cluster.
     * Native name: ComputerNamePhysicalNetBIOS
     * @type {Integer (Int32)}
     */
    static PhysicalNetBIOS => 4

    /**
     * The DNS host name of the local computer. On a cluster, this is the DNS host name of the local node on the cluster.
     * Native name: ComputerNamePhysicalDnsHostname
     * @type {Integer (Int32)}
     */
    static PhysicalDnsHostname => 5

    /**
     * The name of the DNS domain assigned to the local computer. On a cluster, this is the DNS domain of the local node on the cluster.
     * Native name: ComputerNamePhysicalDnsDomain
     * @type {Integer (Int32)}
     */
    static PhysicalDnsDomain => 6

    /**
     * The fully qualified DNS name that uniquely identifies the computer. On a cluster, this is the fully qualified DNS name of the local node on the cluster. The fully qualified DNS name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>.
     * Native name: ComputerNamePhysicalDnsFullyQualified
     * @type {Integer (Int32)}
     */
    static PhysicalDnsFullyQualified => 7

    /**
     * Not used.
     * Native name: ComputerNameMax
     * @type {Integer (Int32)}
     */
    static Max => 8
}
