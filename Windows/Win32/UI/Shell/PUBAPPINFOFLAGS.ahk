#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which members in the PUBAPPINFO structure are valid. These flags are bitmasks set in the dwMask member and passed to IPublishedApp::GetPublishedAppInfo.
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/ne-shappmgr-pubappinfoflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PUBAPPINFOFLAGS{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">pszSource</a> string is valid and contains the display name of the publishing source. If multiple sources publish an application of the same name, Add/Remove Programs identifies them by "&lt;application name&gt; : &lt;publishing source&gt;".
     * @type {Integer (Int32)}
     */
    static PAI_SOURCE => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">stAssigned</a> member is valid and contains the time that the application should be installed as assigned by an application administrator.
     * @type {Integer (Int32)}
     */
    static PAI_ASSIGNEDTIME => 2

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static PAI_PUBLISHEDTIME => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">stScheduled</a> member is valid and contains the time that the application should be installed as assigned by the user.
     * @type {Integer (Int32)}
     */
    static PAI_SCHEDULEDTIME => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">stExpired</a> member is valid and contains the time after which Add/Remove Programs should no longer install the program.
     * @type {Integer (Int32)}
     */
    static PAI_EXPIRETIME => 16
}
