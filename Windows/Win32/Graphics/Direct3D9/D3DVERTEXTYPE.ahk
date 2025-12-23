#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DVERTEXTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DVT_VERTEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DVT_LVERTEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DVT_TLVERTEX => 3
}
