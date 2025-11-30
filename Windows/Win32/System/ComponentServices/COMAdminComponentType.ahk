#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminComponentType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdmin32BitComponent => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdmin64BitComponent => 2
}
