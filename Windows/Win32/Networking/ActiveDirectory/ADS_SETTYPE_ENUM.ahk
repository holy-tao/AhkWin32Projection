#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_SETTYPE_ENUM enumeration specifies the available pathname format used by the IADsPathname::Set method.
 * @remarks
 * 
 * Since VBScript cannot read information from a type library, VBScript applications do not understand the symbolic constants as defined above. You should use the numerical constants instead to set the appropriate flags in your VBScript applications. If you want to use the symbolic constants as a good programming practice, you should make explicit declarations of such constants, as done here, in your VBScript applications.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_settype_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SETTYPE_ENUM{

    /**
     * Sets the full path, for example, "LDAP://servername/o=internet/…/cn=bar".
     * @type {Integer (Int32)}
     */
    static ADS_SETTYPE_FULL => 1

    /**
     * Updates the provider only, for example, "LDAP".
     * @type {Integer (Int32)}
     */
    static ADS_SETTYPE_PROVIDER => 2

    /**
     * Updates the server name only, for example, "servername".
     * @type {Integer (Int32)}
     */
    static ADS_SETTYPE_SERVER => 3

    /**
     * Updates the distinguished name only, for example, "o=internet/…/cn=bar".
     * @type {Integer (Int32)}
     */
    static ADS_SETTYPE_DN => 4
}
