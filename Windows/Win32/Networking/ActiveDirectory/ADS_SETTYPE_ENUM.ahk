#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ADS_SETTYPE_ENUM enumeration specifies the available pathname format used by the IADsPathname::Set method.
 * @remarks
 * Since VBScript cannot read information from a type library, VBScript applications do not understand the symbolic constants as defined above. You should use the numerical constants instead to set the appropriate flags in your VBScript applications. If you want to use the symbolic constants as a good programming practice, you should make explicit declarations of such constants, as done here, in your VBScript applications.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_settype_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class ADS_SETTYPE_ENUM extends Win32Enum {

    /**
     * Sets the full path, for example, "LDAP://servername/o=internet/…/cn=bar".
     * Native name: ADS_SETTYPE_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 1

    /**
     * Updates the provider only, for example, "LDAP".
     * Native name: ADS_SETTYPE_PROVIDER
     * @type {Integer (Int32)}
     */
    static PROVIDER => 2

    /**
     * Updates the server name only, for example, "servername".
     * Native name: ADS_SETTYPE_SERVER
     * @type {Integer (Int32)}
     */
    static SERVER => 3

    /**
     * Updates the distinguished name only, for example, "o=internet/…/cn=bar".
     * Native name: ADS_SETTYPE_DN
     * @type {Integer (Int32)}
     */
    static DN => 4
}
