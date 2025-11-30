#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dswapeffect
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSWAPEFFECT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_DISCARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_FLIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_COPY => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_OVERLAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSWAPEFFECT_FLIPEX => 5
}
