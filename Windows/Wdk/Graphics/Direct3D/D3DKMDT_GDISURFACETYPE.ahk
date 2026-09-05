#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_GDISURFACETYPE extends Win32Enum {

    /**
     * Native name: D3DKMDT_GDISURFACE_INVALID
     * @type {Integer (Int32)}
     */
    static GDISURFACE_INVALID => 0

    /**
     * Native name: D3DKMDT_GDISURFACE_TEXTURE
     * @type {Integer (Int32)}
     */
    static GDISURFACE_TEXTURE => 1

    /**
     * Native name: D3DKMDT_GDISURFACE_STAGING_CPUVISIBLE
     * @type {Integer (Int32)}
     */
    static GDISURFACE_STAGING_CPUVISIBLE => 2

    /**
     * Native name: D3DKMDT_GDISURFACE_STAGING
     * @type {Integer (Int32)}
     */
    static GDISURFACE_STAGING => 3

    /**
     * Native name: D3DKMDT_GDISURFACE_LOOKUPTABLE
     * @type {Integer (Int32)}
     */
    static GDISURFACE_LOOKUPTABLE => 4

    /**
     * Native name: D3DKMDT_GDISURFACE_EXISTINGSYSMEM
     * @type {Integer (Int32)}
     */
    static GDISURFACE_EXISTINGSYSMEM => 5

    /**
     * Native name: D3DKMDT_GDISURFACE_TEXTURE_CPUVISIBLE
     * @type {Integer (Int32)}
     */
    static GDISURFACE_TEXTURE_CPUVISIBLE => 6

    /**
     * Native name: D3DKMDT_GDISURFACE_TEXTURE_CROSSADAPTER
     * @type {Integer (Int32)}
     */
    static GDISURFACE_TEXTURE_CROSSADAPTER => 7

    /**
     * Native name: D3DKMDT_GDISURFACE_TEXTURE_CPUVISIBLE_CROSSADAPTER
     * @type {Integer (Int32)}
     */
    static GDISURFACE_TEXTURE_CPUVISIBLE_CROSSADAPTER => 8
}
