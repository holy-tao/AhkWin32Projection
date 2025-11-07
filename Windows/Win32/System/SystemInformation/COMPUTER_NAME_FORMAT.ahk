#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a type of computer name.
 * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/ne-sysinfoapi-computer_name_format
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class COMPUTER_NAME_FORMAT{

    /**
     * The NetBIOS name of the local computer or the cluster associated with the local computer. This name is limited to MAX_COMPUTERNAME_LENGTH + 1 characters and may be a truncated version of the DNS host name. For example, if the DNS host name is "corporate-mail-server", the NetBIOS name would be "corporate-mail-".
     * @type {Integer (Int32)}
     */
    static ComputerNameNetBIOS => 0

    /**
     * The DNS name of the local computer or the cluster associated with the local computer.
     * @type {Integer (Int32)}
     */
    static ComputerNameDnsHostname => 1

    /**
     * The name of the DNS domain assigned to the local computer or the cluster associated with the local computer.
     * @type {Integer (Int32)}
     */
    static ComputerNameDnsDomain => 2

    /**
     * The fully qualified DNS name that uniquely identifies the local computer or the cluster associated with the local computer. 
     * 
     * 
     * 
     * 
     * This name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>. For example, if the DNS host name is "corporate-mail-server" and the DNS domain name is "microsoft.com", the fully qualified DNS name is "corporate-mail-server.microsoft.com".
     * @type {Integer (Int32)}
     */
    static ComputerNameDnsFullyQualified => 3

    /**
     * The NetBIOS name of the local computer. On a cluster, this is the NetBIOS name of the local node on the cluster.
     * @type {Integer (Int32)}
     */
    static ComputerNamePhysicalNetBIOS => 4

    /**
     * The DNS host name of the local computer. On a cluster, this is the DNS host name of the local node on the cluster.
     * @type {Integer (Int32)}
     */
    static ComputerNamePhysicalDnsHostname => 5

    /**
     * The name of the DNS domain assigned to the local computer. On a cluster, this is the DNS domain of the local node on the cluster.
     * @type {Integer (Int32)}
     */
    static ComputerNamePhysicalDnsDomain => 6

    /**
     * The fully qualified DNS name that uniquely identifies the computer. On a cluster, this is the fully qualified DNS name of the local node on the cluster. The fully qualified DNS name is a combination of the DNS host name and the DNS domain name, using the form <i>HostName</i>.<i>DomainName</i>.
     * @type {Integer (Int32)}
     */
    static ComputerNamePhysicalDnsFullyQualified => 7

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static ComputerNameMax => 8
}
