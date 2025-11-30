#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_domain_authentication_kind
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_DOMAIN_AUTHENTICATION_KIND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_AUTHENTICATION_KIND_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_AUTHENTICATION_KIND_LDAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_AUTHENTICATION_KIND_TLS => 2
}
