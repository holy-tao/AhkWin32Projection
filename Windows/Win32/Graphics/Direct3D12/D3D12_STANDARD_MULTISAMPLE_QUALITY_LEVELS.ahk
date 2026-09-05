#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_STANDARD_MULTISAMPLE_QUALITY_LEVELS extends Win32Enum {

    /**
     * Native name: D3D12_STANDARD_MULTISAMPLE_PATTERN
     * @type {Integer (Int32)}
     */
    static PATTERN => -1

    /**
     * Native name: D3D12_CENTER_MULTISAMPLE_PATTERN
     * @type {Integer (Int32)}
     */
    static CENTER_MULTISAMPLE_PATTERN => -2
}
