#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtextureaddress
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTUREADDRESS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_WRAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_MIRROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_CLAMP => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_BORDER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTADDRESS_MIRRORONCE => 5
}
