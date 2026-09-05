#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminAccessChecksLevelOptions extends Win32Enum {

    /**
     * Native name: COMAdminAccessChecksApplicationLevel
     * @type {Integer (Int32)}
     */
    static ApplicationLevel => 0

    /**
     * Native name: COMAdminAccessChecksApplicationComponentLevel
     * @type {Integer (Int32)}
     */
    static ApplicationComponentLevel => 1
}
