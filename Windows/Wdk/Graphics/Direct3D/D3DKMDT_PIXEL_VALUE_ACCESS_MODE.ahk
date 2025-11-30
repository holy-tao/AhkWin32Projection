#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_PIXEL_VALUE_ACCESS_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_PVAM_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_PVAM_DIRECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_PVAM_PRESETPALETTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_PVAM_SETTABLEPALETTE => 3
}
