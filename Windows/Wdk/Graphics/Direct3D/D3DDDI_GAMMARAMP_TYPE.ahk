#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_GAMMARAMP_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_GAMMARAMP_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static UNINITIALIZED => 0

    /**
     * Native name: D3DDDI_GAMMARAMP_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Native name: D3DDDI_GAMMARAMP_RGB256x3x16
     * @type {Integer (Int32)}
     */
    static RGB256x3x16 => 2

    /**
     * Native name: D3DDDI_GAMMARAMP_DXGI_1
     * @type {Integer (Int32)}
     */
    static DXGI_1 => 3

    /**
     * Native name: D3DDDI_GAMMARAMP_MATRIX_3x4
     * @type {Integer (Int32)}
     */
    static MATRIX_3x4 => 4

    /**
     * Native name: D3DDDI_GAMMARAMP_MATRIX_V2
     * @type {Integer (Int32)}
     */
    static MATRIX_V2 => 5
}
