#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminActivationOptions extends Win32Enum {

    /**
     * Native name: COMAdminActivationInproc
     * @type {Integer (Int32)}
     */
    static Inproc => 0

    /**
     * Native name: COMAdminActivationLocal
     * @type {Integer (Int32)}
     */
    static Local => 1
}
