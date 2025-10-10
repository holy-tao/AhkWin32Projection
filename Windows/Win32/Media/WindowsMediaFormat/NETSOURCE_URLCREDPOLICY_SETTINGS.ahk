#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NETSOURCE_URLCREDPOLICY_SETTINGS enumeration type is used for an output parameter of IWMSInternalAdminNetSource2::GetCredentialsEx.
 * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/ne-wmsinternaladminnetsource-netsource_urlcredpolicy_settings
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class NETSOURCE_URLCREDPOLICY_SETTINGS{

    /**
     * Specifies that your application can log on to servers for which passwords are cached without informing the user.
     * @type {Integer (Int32)}
     */
    static NETSOURCE_URLCREDPOLICY_SETTING_SILENTLOGONOK => 0

    /**
     * Specifies that your application must notify the user when your application needs to log on to a server. You application can fill in the fields of a password dialog, but must get confirmation.
     * @type {Integer (Int32)}
     */
    static NETSOURCE_URLCREDPOLICY_SETTING_MUSTPROMPTUSER => 1

    /**
     * Specifies that your application can never log on to network servers for the user. Your application can still navigate servers that do not require passwords.
     * @type {Integer (Int32)}
     */
    static NETSOURCE_URLCREDPOLICY_SETTING_ANONYMOUSONLY => 2
}
