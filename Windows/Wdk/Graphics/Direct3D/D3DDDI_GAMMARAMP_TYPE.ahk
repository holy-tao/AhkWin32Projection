#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_GAMMARAMP_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_RGB256x3x16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_DXGI_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_MATRIX_3x4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_GAMMARAMP_MATRIX_V2 => 5
}
