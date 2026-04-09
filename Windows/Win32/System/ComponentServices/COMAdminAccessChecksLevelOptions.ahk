#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminAccessChecksLevelOptions extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAccessChecksApplicationLevel => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAccessChecksApplicationComponentLevel => 1
}
