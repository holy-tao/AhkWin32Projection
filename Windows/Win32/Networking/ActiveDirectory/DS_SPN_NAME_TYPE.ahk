#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DS_SPN_NAME_TYPE enumeration is used by the DsGetSPN function to identify the format for composing SPNs.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_spn_name_type
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_SPN_NAME_TYPE extends Win32Enum{

    /**
     * The SPN format for the distinguished name service of the host-based service, which provides services identified with its host computer. This SPN uses the following format:
     * 
     * 
     * ```cpp
     * jeffsmith.fabrikam.com
     * ```
     * @type {Integer (Int32)}
     */
    static DS_SPN_DNS_HOST => 0

    /**
     * The SPN format for the distinguished name of the host-based service, which provides services identified with its host computer. This SPN uses the following format:
     * 
     * 
     * ```cpp
     * cn=jeffsmith,ou=computers,dc=fabrikam,dc=com
     * ```
     * @type {Integer (Int32)}
     */
    static DS_SPN_DN_HOST => 1

    /**
     * The SPN format for the NetBIOS service of the host-based service, which provides services identified with its host computer. This SPN uses the following format:
     * 
     * 
     * ```cpp
     * jeffsmith-nec
     * ```
     * @type {Integer (Int32)}
     */
    static DS_SPN_NB_HOST => 2

    /**
     * The SPN format for a replicable service that provides services to the specified domain. This SPN uses the following format:
     * 
     * 
     * ```cpp
     * fabrikam.com
     * ```
     * @type {Integer (Int32)}
     */
    static DS_SPN_DOMAIN => 3

    /**
     * The SPN format for a replicable service that provides services to the specified NetBIOS domain. This SPN uses the following format:
     * 
     * 
     * ```cpp
     * fabrikam
     * ```
     * @type {Integer (Int32)}
     */
    static DS_SPN_NB_DOMAIN => 4

    /**
     * The SPN format for a specified service. This SPN uses the following formats, depending on which service is used:
     * 
     * 
     * ```cpp
     * cn=anRpcService,cn=RPC Services,cn=system,dc=fabrikam,dc=com
     * ```
     * 
     * 
     * 
     * ```cpp
     * cn=aWsService,cn=Winsock Services,cn=system,dc=fabrikam,dc=com
     * ```
     * 
     * 
     * 
     * ```cpp
     * cn=aService,dc=itg,dc=fabrikam,dc=com
     * ```
     * 
     * 
     * 
     * ```cpp
     * www.fabrikam.com, ftp.fabrikam.com, ldap.fabrikam.com
     * ```
     * 
     * 
     * 
     * ```cpp
     * products.fabrikam.com
     * ```
     * @type {Integer (Int32)}
     */
    static DS_SPN_SERVICE => 5
}
