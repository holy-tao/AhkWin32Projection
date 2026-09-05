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
 */
class D3DBLEND extends Win32Enum {

    /**
     * Native name: D3DBLEND_ZERO
     * @type {Integer (Int32)}
     */
    static ZERO => 1

    /**
     * Native name: D3DBLEND_ONE
     * @type {Integer (Int32)}
     */
    static ONE => 2

    /**
     * Native name: D3DBLEND_SRCCOLOR
     * @type {Integer (Int32)}
     */
    static SRCCOLOR => 3

    /**
     * Native name: D3DBLEND_INVSRCCOLOR
     * @type {Integer (Int32)}
     */
    static INVSRCCOLOR => 4

    /**
     * Native name: D3DBLEND_SRCALPHA
     * @type {Integer (Int32)}
     */
    static SRCALPHA => 5

    /**
     * Native name: D3DBLEND_INVSRCALPHA
     * @type {Integer (Int32)}
     */
    static INVSRCALPHA => 6

    /**
     * Native name: D3DBLEND_DESTALPHA
     * @type {Integer (Int32)}
     */
    static DESTALPHA => 7

    /**
     * Native name: D3DBLEND_INVDESTALPHA
     * @type {Integer (Int32)}
     */
    static INVDESTALPHA => 8

    /**
     * Native name: D3DBLEND_DESTCOLOR
     * @type {Integer (Int32)}
     */
    static DESTCOLOR => 9

    /**
     * Native name: D3DBLEND_INVDESTCOLOR
     * @type {Integer (Int32)}
     */
    static INVDESTCOLOR => 10

    /**
     * Native name: D3DBLEND_SRCALPHASAT
     * @type {Integer (Int32)}
     */
    static SRCALPHASAT => 11

    /**
     * Native name: D3DBLEND_BOTHSRCALPHA
     * @type {Integer (Int32)}
     */
    static BOTHSRCALPHA => 12

    /**
     * Native name: D3DBLEND_BOTHINVSRCALPHA
     * @type {Integer (Int32)}
     */
    static BOTHINVSRCALPHA => 13

    /**
     * Native name: D3DBLEND_BLENDFACTOR
     * @type {Integer (Int32)}
     */
    static BLENDFACTOR => 14

    /**
     * Native name: D3DBLEND_INVBLENDFACTOR
     * @type {Integer (Int32)}
     */
    static INVBLENDFACTOR => 15

    /**
     * Native name: D3DBLEND_SRCCOLOR2
     * @type {Integer (Int32)}
     */
    static SRCCOLOR2 => 16

    /**
     * Native name: D3DBLEND_INVSRCCOLOR2
     * @type {Integer (Int32)}
     */
    static INVSRCCOLOR2 => 17
}
