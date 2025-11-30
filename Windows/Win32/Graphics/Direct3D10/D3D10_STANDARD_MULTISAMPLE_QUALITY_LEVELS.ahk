#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_STANDARD_MULTISAMPLE_QUALITY_LEVELS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_STANDARD_MULTISAMPLE_PATTERN => -1

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_CENTER_MULTISAMPLE_PATTERN => -2
}
