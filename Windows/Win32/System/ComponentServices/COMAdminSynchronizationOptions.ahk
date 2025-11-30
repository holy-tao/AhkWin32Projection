#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminSynchronizationOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationIgnored => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationSupported => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationRequired => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminSynchronizationRequiresNew => 4
}
