#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDPN_PRESENT_PATH_CONTENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPC_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPC_GRAPHICS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPC_VIDEO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPC_NOTSPECIFIED => 255
}
