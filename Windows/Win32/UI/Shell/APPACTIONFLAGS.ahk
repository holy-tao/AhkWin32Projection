#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies application management actions supported by an application publisher. These flags are bitmasks passed to IShellApp::GetPossibleActions.
 * @remarks
 * The Add or Remove Programs application in Control Panel uses only <b><b>APPACTION_INSTALL</b></b> and <b><b>APPACTION_ADDLATER</b></b> for published applications.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/ne-shappmgr-appactionflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPACTIONFLAGS extends Win32Enum{

    /**
     * Indicates that the application can be installed. Published applications always set this bit.
     * @type {Integer (Int32)}
     */
    static APPACTION_INSTALL => 1

    /**
     * Not applicable to published applications.
     * @type {Integer (Int32)}
     */
    static APPACTION_UNINSTALL => 2

    /**
     * Not applicable to published applications.
     * @type {Integer (Int32)}
     */
    static APPACTION_MODIFY => 4

    /**
     * Not applicable to published applications.
     * @type {Integer (Int32)}
     */
    static APPACTION_REPAIR => 8

    /**
     * Not applicable to published applications.
     * @type {Integer (Int32)}
     */
    static APPACTION_UPGRADE => 16

    /**
     * Not applicable to published applications.
     * @type {Integer (Int32)}
     */
    static APPACTION_CANGETSIZE => 32

    /**
     * Not applicable to published applications.
     * @type {Integer (Int32)}
     */
    static APPACTION_MODIFYREMOVE => 128

    /**
     * Indicates that the application supports scheduled installation.  If this bit is set, then the Control Panel's Add or Remove Programs application presents the user an <b>Add Later</b> button. If you select <b>Add Later</b>, you are prompted to select the desired time of installation. The <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ipublishedapp-install">IPublishedApp::Install</a> method is then called with the installation time.
     * @type {Integer (Int32)}
     */
    static APPACTION_ADDLATER => 256

    /**
     * Obsolete.
     * @type {Integer (Int32)}
     */
    static APPACTION_UNSCHEDULE => 512
}
