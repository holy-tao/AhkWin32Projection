#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class LSA_LOOKUP_DOMAIN_INFO_CLASS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static AccountDomainInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static DnsDomainInformation => 12
}
