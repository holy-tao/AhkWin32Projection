#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class XPSRAS_RENDERING_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_RENDERING_MODE_ANTIALIASED => 0

    /**
     * @type {Integer (Int32)}
     */
    static XPSRAS_RENDERING_MODE_ALIASED => 1
}
