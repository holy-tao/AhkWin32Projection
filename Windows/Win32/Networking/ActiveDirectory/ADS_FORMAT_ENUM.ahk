#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the available path value types used by the IADsPathname::Retrieve method.
 * @remarks
 * The WinNT provider does not support any of the X.500 format specifiers.
  * 
  * Because Visual Basic Scripting Edition  cannot read data from a type library, VBScript applications cannot recognize the symbolic constants as defined above. You should use the numeric constants instead to set the appropriate flags in your VBScript applications. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_format_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_FORMAT_ENUM{

    /**
     * Returns the full path in Windows format, for example, "LDAP://servername/o=internet/…/cn=bar".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_WINDOWS => 1

    /**
     * Returns Windows format without server, for example, "LDAP://o=internet/…/cn=bar".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_WINDOWS_NO_SERVER => 2

    /**
     * Returns Windows format of the distinguished name only, for example, "o=internet/…/cn=bar".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_WINDOWS_DN => 3

    /**
     * Returns Windows format of Parent only, for example, "o=internet/…".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_WINDOWS_PARENT => 4

    /**
     * Returns the full path in X.500 format, for example, "LDAP://servername/cn=bar,…,o=internet".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_X500 => 5

    /**
     * Returns the path without server in X.500 format, for example, "LDAP://cn=bar,…,o=internet".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_X500_NO_SERVER => 6

    /**
     * Returns only the distinguished name in X.500 format. For example, "cn=bar,…,o=internet".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_X500_DN => 7

    /**
     * Returns only the parent in X.500 format, for example, "…,o=internet".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_X500_PARENT => 8

    /**
     * Returns the server name, for example, "servername".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_SERVER => 9

    /**
     * Returns the name of the provider, for example, "LDAP".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_PROVIDER => 10

    /**
     * Returns the name of the leaf, for example, "cn=bar".
     * @type {Integer (Int32)}
     */
    static ADS_FORMAT_LEAF => 11
}
