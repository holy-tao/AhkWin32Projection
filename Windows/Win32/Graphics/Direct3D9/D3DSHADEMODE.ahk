#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that describe the supported shading modes.
 * @remarks
 * The first vertex of a triangle for flat shading mode is defined in the following manner.
 * 
 * -   For a triangle list, the first vertex of the triangle i is i \* 3.
 * -   For a triangle strip, the first vertex of the triangle i is vertex i.
 * -   For a triangle fan, the first vertex of the triangle i is vertex i + 1.
 * 
 * The members of this enumerated type define the vales for the D3DRS\_SHADEMODE render state.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dshademode
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSHADEMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSHADE_FLAT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSHADE_GOURAUD => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSHADE_PHONG => 3
}
