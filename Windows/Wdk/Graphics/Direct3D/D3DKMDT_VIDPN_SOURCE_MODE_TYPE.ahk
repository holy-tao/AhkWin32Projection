#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_SOURCE_MODE_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMDT_RMT_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static RMT_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_RMT_GRAPHICS
     * @type {Integer (Int32)}
     */
    static RMT_GRAPHICS => 1

    /**
     * Native name: D3DKMDT_RMT_TEXT
     * @type {Integer (Int32)}
     */
    static RMT_TEXT => 2

    /**
     * Native name: D3DKMDT_RMT_GRAPHICS_STEREO
     * @type {Integer (Int32)}
     */
    static RMT_GRAPHICS_STEREO => 3

    /**
     * Native name: D3DKMDT_RMT_GRAPHICS_STEREO_ADVANCED_SCAN
     * @type {Integer (Int32)}
     */
    static RMT_GRAPHICS_STEREO_ADVANCED_SCAN => 4
}
