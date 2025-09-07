#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines texture coordinate transformation values.
 * @remarks
 * Texture coordinates can be transformed using a 4 x 4 matrix before the results are passed to the rasterizer. The texture coordinate transforms are set by calling [**IDirect3DDevice9::SetTextureStageState**](/windows/desktop/api), and by passing in the D3DTSS\_TEXTURETRANSFORMFLAGS texture stage state and one of the values from **D3DTEXTURETRANSFORMFLAGS**. For more information about texture transforms, see [Texture Coordinate Transformations (Direct3D 9)](texture-coordinate-transformations.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtexturetransformflags
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTEXTURETRANSFORMFLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static D3DTTFF_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DTTFF_COUNT1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTTFF_COUNT2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTTFF_COUNT3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DTTFF_COUNT4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTTFF_PROJECTED => 256
}
