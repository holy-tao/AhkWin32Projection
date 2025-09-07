#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that describe transformation state values.
 * @remarks
 * The transform states in the range 256 through 511 are reserved to store up to 256 world matrices that can be indexed using the D3DTS\_WORLDMATRIX and D3DTS\_WORLD macros.
  * 
  * 
  * 
  * | Macros                                                  | Description                                                                                                                                                                      |
  * |---------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  * | [**D3DTS\_WORLD**](d3dts-world.md)                     | Equivalent to D3DTS\_WORLDMATRIX(0).                                                                                                                                  |
  * | [**D3DTS\_WORLDMATRIX**](d3dts-worldmatrix.md) (index) | Identifies the transform matrix to set for the world matrix at index. Multiple world matrices are used only for vertex blending. Otherwise only D3DTS\_WORLD is used. |
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtransformstatetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTRANSFORMSTATETYPE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_VIEW => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_PROJECTION => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE0 => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE1 => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE2 => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE3 => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE4 => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE5 => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE6 => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DTS_TEXTURE7 => 23
}
