#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class GET_GUIDE_LINE_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GGL_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GGL_INDEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GGL_STRING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GGL_PRIVATE => 4
}
