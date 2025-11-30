#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddegreetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEGREETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEGREE_LINEAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEGREE_QUADRATIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEGREE_CUBIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEGREE_QUINTIC => 5
}
