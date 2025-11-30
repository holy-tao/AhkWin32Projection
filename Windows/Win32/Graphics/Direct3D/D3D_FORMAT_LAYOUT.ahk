#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_FORMAT_LAYOUT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DFL_STANDARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DFL_CUSTOM => -1
}
