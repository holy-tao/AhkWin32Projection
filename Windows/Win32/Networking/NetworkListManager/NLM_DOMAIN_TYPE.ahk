#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NLM_DOMAIN_TYPE enumeration is a set of flags that specify the domain type of a network.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/ne-netlistmgr-nlm_domain_type
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_DOMAIN_TYPE extends Win32Enum{

    /**
     * The Network is not an Active Directory Network.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_TYPE_NON_DOMAIN_NETWORK => 0

    /**
     * The Network is an Active Directory Network, but this machine is not authenticated against it.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_TYPE_DOMAIN_NETWORK => 1

    /**
     * The Network is an Active Directory Network, and this machine is authenticated against it.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_TYPE_DOMAIN_AUTHENTICATED => 2
}
