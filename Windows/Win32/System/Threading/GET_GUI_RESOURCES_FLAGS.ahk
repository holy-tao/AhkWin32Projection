#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class GET_GUI_RESOURCES_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GR_GLOBAL => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static GR_GDIOBJECTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GR_GDIOBJECTS_PEAK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GR_USEROBJECTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GR_USEROBJECTS_PEAK => 4
}
