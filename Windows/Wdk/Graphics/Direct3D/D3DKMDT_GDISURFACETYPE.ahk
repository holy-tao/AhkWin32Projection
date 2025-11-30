#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_GDISURFACETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_STAGING_CPUVISIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_STAGING => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_LOOKUPTABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_EXISTINGSYSMEM => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE_CPUVISIBLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE_CROSSADAPTER => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE_CPUVISIBLE_CROSSADAPTER => 8
}
