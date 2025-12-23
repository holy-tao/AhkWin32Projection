#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringAlignment extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StringAlignmentNear => 0

    /**
     * @type {Integer (Int32)}
     */
    static StringAlignmentCenter => 1

    /**
     * @type {Integer (Int32)}
     */
    static StringAlignmentFar => 2
}
