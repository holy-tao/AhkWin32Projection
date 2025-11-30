#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTUREMAGFILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFG_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFG_LINEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFG_FLATCUBIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFG_GAUSSIANCUBIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTFG_ANISOTROPIC => 5
}
