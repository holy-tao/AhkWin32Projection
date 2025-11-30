#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevtype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_HAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_REF => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_SW => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVTYPE_NULLREF => 4
}
