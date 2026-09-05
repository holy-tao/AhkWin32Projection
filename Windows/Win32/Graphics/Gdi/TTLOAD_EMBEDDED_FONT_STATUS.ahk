#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class TTLOAD_EMBEDDED_FONT_STATUS extends Win32BitflagEnum {

    /**
     * Native name: TTLOAD_FONT_SUBSETTED
     * @type {Integer (UInt32)}
     */
    static SUBSETTED => 1

    /**
     * Native name: TTLOAD_FONT_IN_SYSSTARTUP
     * @type {Integer (UInt32)}
     */
    static IN_SYSSTARTUP => 2
}
