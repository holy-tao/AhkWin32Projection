#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtexturefiltertype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTUREFILTERTYPE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_LINEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_ANISOTROPIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_PYRAMIDALQUAD => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_GAUSSIANQUAD => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXF_CONVOLUTIONMONO => 8
}
