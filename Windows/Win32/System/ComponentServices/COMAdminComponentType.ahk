#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminComponentType extends Win32Enum {

    /**
     * Native name: COMAdmin32BitComponent
     * @type {Integer (Int32)}
     */
    static Admin32BitComponent => 1

    /**
     * Native name: COMAdmin64BitComponent
     * @type {Integer (Int32)}
     */
    static Admin64BitComponent => 2
}
