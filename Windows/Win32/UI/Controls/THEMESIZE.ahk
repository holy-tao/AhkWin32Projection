#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ne-uxtheme-themesize
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class THEMESIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TS_MIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static TS_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static TS_DRAW => 2
}
