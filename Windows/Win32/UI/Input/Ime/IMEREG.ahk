#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEREG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REG_HEAD => 0

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REG_TAIL => 1

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REG_DEL => 2
}
