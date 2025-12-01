#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The SECPKG_NAME_TYPE enumeration is used to describe the type of name specified for an account.The SECPKG_NAME_TYPE enumeration is used by the GetAuthDataForUser and OpenSamUser functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ne-ntsecpkg-secpkg_name_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_NAME_TYPE extends Win32Enum{

    /**
     * The account name is compatible with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Security Accounts Manager</a> (SAM). An example of a name in SAM-compatible format is <b>"</b><i>ExampleDomain</i><b>\\</b><i>UserName</i><b>"</b>.
     * @type {Integer (Int32)}
     */
    static SecNameSamCompatible => 0

    /**
     * The account name is in the AltSecId property of the SAM account.
     * @type {Integer (Int32)}
     */
    static SecNameAlternateId => 1

    /**
     * The account name is a flat user principal name (UPN) style account name.
     * @type {Integer (Int32)}
     */
    static SecNameFlat => 2

    /**
     * The account name is the distinguished name of the object.
     * @type {Integer (Int32)}
     */
    static SecNameDN => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SecNameSPN => 4
}
