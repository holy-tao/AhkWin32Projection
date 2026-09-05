#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminSynchronizationOptions extends Win32Enum {

    /**
     * Native name: COMAdminSynchronizationIgnored
     * @type {Integer (Int32)}
     */
    static Ignored => 0

    /**
     * Native name: COMAdminSynchronizationNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: COMAdminSynchronizationSupported
     * @type {Integer (Int32)}
     */
    static Supported => 2

    /**
     * Native name: COMAdminSynchronizationRequired
     * @type {Integer (Int32)}
     */
    static Required => 3

    /**
     * Native name: COMAdminSynchronizationRequiresNew
     * @type {Integer (Int32)}
     */
    static RequiresNew => 4
}
