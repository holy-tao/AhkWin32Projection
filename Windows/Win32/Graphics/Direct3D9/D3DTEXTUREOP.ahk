#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines per-stage texture-blending operations.
 * @remarks
 * The members of this type are used when setting color or alpha operations by using the D3DTSS\_COLOROP or D3DTSS\_ALPHAOP values with the [**IDirect3DDevice9::SetTextureStageState**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-settexturestagestate) method.
 * 
 * In the above formulas, S<sub>RGBA</sub> is the RGBA color produced by a texture operation, and Arg1, Arg2, and Arg3 represent the complete RGBA color of the texture arguments. Individual components of an argument are shown with subscripts. For example, the alpha component for argument 1 would be shown as Arg1<sub>A</sub>.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtextureop
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTUREOP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_DISABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_SELECTARG1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_SELECTARG2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MODULATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MODULATE2X => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MODULATE4X => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_ADD => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_ADDSIGNED => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_ADDSIGNED2X => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_SUBTRACT => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_ADDSMOOTH => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_BLENDDIFFUSEALPHA => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_BLENDTEXTUREALPHA => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_BLENDFACTORALPHA => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_BLENDTEXTUREALPHAPM => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_BLENDCURRENTALPHA => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_PREMODULATE => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MODULATEALPHA_ADDCOLOR => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MODULATECOLOR_ADDALPHA => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MODULATEINVALPHA_ADDCOLOR => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MODULATEINVCOLOR_ADDALPHA => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_BUMPENVMAP => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_BUMPENVMAPLUMINANCE => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_DOTPRODUCT3 => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_MULTIPLYADD => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3DTOP_LERP => 26
}
