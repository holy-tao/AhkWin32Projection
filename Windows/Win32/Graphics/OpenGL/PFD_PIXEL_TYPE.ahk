#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
class PFD_PIXEL_TYPE extends Win32Enum {

    /**
     * Native name: PFD_TYPE_RGBA
     * @type {Integer (Byte)}
     */
    static RGBA => 0x00

    /**
     * Native name: PFD_TYPE_COLORINDEX
     * @type {Integer (Byte)}
     */
    static COLORINDEX => 0x01
}
