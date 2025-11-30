#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DIB_USAGE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DIB_RGB_COLORS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIB_PAL_COLORS => 1
}
