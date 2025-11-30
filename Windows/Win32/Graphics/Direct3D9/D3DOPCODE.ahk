#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DOPCODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_LINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_TRIANGLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_MATRIXLOAD => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_MATRIXMULTIPLY => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_STATETRANSFORM => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_STATELIGHT => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_STATERENDER => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_PROCESSVERTICES => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_TEXTURELOAD => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_EXIT => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_BRANCHFORWARD => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_SPAN => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DOP_SETSTATUS => 14
}
