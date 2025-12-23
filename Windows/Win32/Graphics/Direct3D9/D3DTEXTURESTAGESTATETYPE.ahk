#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Texture stage states define multi-blender texture operations.
 * @remarks
 * Members of this enumerated type are used with the [**IDirect3DDevice9::GetTextureStageState**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-gettexturestagestate) and [**IDirect3DDevice9::SetTextureStageState**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-settexturestagestate) methods to retrieve and set texture state values.
 * 
 * The valid range of values for the D3DTSS\_BUMPENVMAT00, D3DTSS\_BUMPENVMAT01, D3DTSS\_BUMPENVMAT10, and D3DTSS\_BUMPENVMAT11 bump-mapping matrix coefficients is greater than or equal to -8.0 and less than 8.0. This range, expressed in mathematical notation is (-8.0,8.0).
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
