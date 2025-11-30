#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDPN_SOURCE_MODE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_RMT_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_RMT_GRAPHICS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_RMT_TEXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_RMT_GRAPHICS_STEREO => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_RMT_GRAPHICS_STEREO_ADVANCED_SCAN => 4
}
