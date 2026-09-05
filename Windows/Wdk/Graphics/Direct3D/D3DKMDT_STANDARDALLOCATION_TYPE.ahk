#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_STANDARDALLOCATION_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMDT_STANDARDALLOCATION_SHAREDPRIMARYSURFACE
     * @type {Integer (Int32)}
     */
    static SHAREDPRIMARYSURFACE => 1

    /**
     * Native name: D3DKMDT_STANDARDALLOCATION_SHADOWSURFACE
     * @type {Integer (Int32)}
     */
    static SHADOWSURFACE => 2

    /**
     * Native name: D3DKMDT_STANDARDALLOCATION_STAGINGSURFACE
     * @type {Integer (Int32)}
     */
    static STAGINGSURFACE => 3

    /**
     * Native name: D3DKMDT_STANDARDALLOCATION_GDISURFACE
     * @type {Integer (Int32)}
     */
    static GDISURFACE => 4

    /**
     * Native name: D3DKMDT_STANDARDALLOCATION_VGPU
     * @type {Integer (Int32)}
     */
    static VGPU => 5
}
