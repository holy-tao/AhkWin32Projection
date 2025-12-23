#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the supported blend mode.
 * @remarks
 * In the preceding member descriptions, the RGBA values of the source and destination are indicated by the s and d subscripts.
 * 
 * The values in this enumerated type are used by the following render states:
 * 
 * -   D3DRS\_DESTBLEND
 * -   D3DRS\_SRCBLEND
 * -   D3DRS\_DESTBLENDALPHA
 * -   D3DRS\_SRCBLENDALPHA
 * 
 * See [**D3DRENDERSTATETYPE**](./d3drenderstatetype.md)
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dblend
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DBLEND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_ONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_SRCCOLOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_INVSRCCOLOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_SRCALPHA => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_INVSRCALPHA => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_DESTALPHA => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_INVDESTALPHA => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_DESTCOLOR => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_INVDESTCOLOR => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_SRCALPHASAT => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_BOTHSRCALPHA => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_BOTHINVSRCALPHA => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_BLENDFACTOR => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_INVBLENDFACTOR => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_SRCCOLOR2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DBLEND_INVSRCCOLOR2 => 17
}
