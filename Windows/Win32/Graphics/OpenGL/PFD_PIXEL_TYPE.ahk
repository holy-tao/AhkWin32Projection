#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class PFD_PIXEL_TYPE extends Win32Enum{

    /**
     * @type {Integer (Byte)}
     */
    static PFD_TYPE_RGBA => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PFD_TYPE_COLORINDEX => 0x01
}
