#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of size value to retrieve for a visual style part.
 * @remarks
 * A value from the <b>THEMESIZE</b> enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemepartsize">GetThemePartSize</a> function to specify the type of size value to retrieve for a particular visual style part.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ne-uxtheme-themesize
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class THEMESIZE extends Win32Enum{

    /**
     * Receives the minimum size of a visual style part.
     * @type {Integer (Int32)}
     */
    static TS_MIN => 0

    /**
     * Receives the size of the visual style part that will best fit the available space.
     * @type {Integer (Int32)}
     */
    static TS_TRUE => 1

    /**
     * Receives the size that the theme manager uses to draw a part.
     * @type {Integer (Int32)}
     */
    static TS_DRAW => 2
}
