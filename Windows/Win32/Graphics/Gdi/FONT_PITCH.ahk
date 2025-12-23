#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FONT_PITCH extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static DEFAULT_PITCH => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static FIXED_PITCH => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static VARIABLE_PITCH => 0x02
}
