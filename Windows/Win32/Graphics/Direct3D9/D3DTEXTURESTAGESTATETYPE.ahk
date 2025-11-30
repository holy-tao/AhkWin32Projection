#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtexturestagestatetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTURESTAGESTATETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_COLOROP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_COLORARG1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_COLORARG2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_ALPHAOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_ALPHAARG1 => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_ALPHAARG2 => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_BUMPENVMAT00 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_BUMPENVMAT01 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_BUMPENVMAT10 => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_BUMPENVMAT11 => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_TEXCOORDINDEX => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_BUMPENVLSCALE => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_BUMPENVLOFFSET => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_TEXTURETRANSFORMFLAGS => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_COLORARG0 => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_ALPHAARG0 => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_RESULTARG => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3DTSS_CONSTANT => 32
}
