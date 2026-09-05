#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class XPSRAS_RENDERING_MODE extends Win32Enum {

    /**
     * Native name: XPSRAS_RENDERING_MODE_ANTIALIASED
     * @type {Integer (Int32)}
     */
    static ANTIALIASED => 0

    /**
     * Native name: XPSRAS_RENDERING_MODE_ALIASED
     * @type {Integer (Int32)}
     */
    static ALIASED => 1
}
