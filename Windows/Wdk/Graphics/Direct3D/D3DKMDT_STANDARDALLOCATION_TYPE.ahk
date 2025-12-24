#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_STANDARDALLOCATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_STANDARDALLOCATION_SHAREDPRIMARYSURFACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_STANDARDALLOCATION_SHADOWSURFACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_STANDARDALLOCATION_STAGINGSURFACE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_STANDARDALLOCATION_GDISURFACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_STANDARDALLOCATION_VGPU => 5
}
