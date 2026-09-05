#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminImpersonationLevelOptions extends Win32Enum {

    /**
     * Native name: COMAdminImpersonationAnonymous
     * @type {Integer (Int32)}
     */
    static Anonymous => 1

    /**
     * Native name: COMAdminImpersonationIdentify
     * @type {Integer (Int32)}
     */
    static Identify => 2

    /**
     * Native name: COMAdminImpersonationImpersonate
     * @type {Integer (Int32)}
     */
    static Impersonate => 3

    /**
     * Native name: COMAdminImpersonationDelegate
     * @type {Integer (Int32)}
     */
    static Delegate => 4
}
