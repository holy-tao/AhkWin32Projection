#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_PRESENT_PATH_CONTENT extends Win32Enum {

    /**
     * Native name: D3DKMDT_VPPC_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static VPPC_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_VPPC_GRAPHICS
     * @type {Integer (Int32)}
     */
    static VPPC_GRAPHICS => 1

    /**
     * Native name: D3DKMDT_VPPC_VIDEO
     * @type {Integer (Int32)}
     */
    static VPPC_VIDEO => 2

    /**
     * Native name: D3DKMDT_VPPC_NOTSPECIFIED
     * @type {Integer (Int32)}
     */
    static VPPC_NOTSPECIFIED => 255
}
