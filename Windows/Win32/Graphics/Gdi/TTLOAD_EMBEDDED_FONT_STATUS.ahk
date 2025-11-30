#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TTLOAD_EMBEDDED_FONT_STATUS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TTLOAD_FONT_SUBSETTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TTLOAD_FONT_IN_SYSSTARTUP => 2
}
