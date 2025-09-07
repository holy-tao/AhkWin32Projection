#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates which status icon should be displayed.
 * @remarks
 * <b>CREDENTIAL_PROVIDER_STATUS_ICON</b> is not used starting in Windows 10.
  * 
  * As part of <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential-reportresult">ReportResult</a>, a credential provider may specify a status icon to display. It is important to not that only Logon UI calls <b>ReportResult</b>, Credential UI does not.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_status_icon
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_STATUS_ICON{

    /**
     * No icon indicated.
     * @type {Integer (Int32)}
     */
    static CPSI_NONE => 0

    /**
     * Display the error icon.
     * @type {Integer (Int32)}
     */
    static CPSI_ERROR => 1

    /**
     * Display the warning icon.
     * @type {Integer (Int32)}
     */
    static CPSI_WARNING => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static CPSI_SUCCESS => 3
}
