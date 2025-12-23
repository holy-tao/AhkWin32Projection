#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTUREMIPFILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFP_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFP_POINT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFP_LINEAR => 3
}
