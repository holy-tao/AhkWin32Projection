#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a rectangular high-order patch.
 * @remarks
 * The following diagram identifies the parameters that specify a rectangle patch.
 * 
 * ![diagram of a rectangular high-order patch and the parameters that specify it](images/hop-rectpatch.png)
 * 
 * Each of the vertices in the vertex buffer is shown as a black dot. In this case, the vertex buffer has 20 vertices in it, 16 of which are in the rectangle patch. The stride is the number of vertices in the width of the vertex buffer, in this case five. The x offset to the first vertex is called the StartIndexVertexWidth and is in this case 1. The y offset to the first patch vertex is called the StartIndexVertexHeight and is in this case 0.
 * 
 * To render a stream of individual rectangular patches (non-mosaic), you should interpret your geometry as a long narrow (1 x N) rectangular patch. The **D3DRECTPATCH\_INFO** structure for such a strip (cubic Bézier) would be set up in the following manner.
 * 
 * 
 * ```
 *     
 * D3DRECTPATCH_INFO RectInfo;
 * 
 * RectInfo.Width = 4;
 * RectInfo.Height = 4;
 * RectInfo.Stride = 4;
 * RectInfo.Basis = D3DBASIS_BEZIER;
 * RectInfo.Order = D3DORDER_CUBIC;
 * RectInfo.StartVertexOffsetWidth = 0;
 * RectInfo.StartVertexOffsetHeight = 4*i;  // The variable i is the index of the 
 * //   patch you want to render.
 * ```
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3drectpatch-info
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DRECTPATCH_INFO extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Starting vertex offset width, in number of vertices.
     * @type {Integer}
     */
    StartVertexOffsetWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Starting vertex offset height, in number of vertices.
     * @type {Integer}
     */
    StartVertexOffsetHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of each vertex, in number of vertices.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of each vertex, in number of vertices.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the imaginary two-dimensional vertex array, which occupies the same space as the vertex buffer. For an example, see the diagram below.
     * @type {Integer}
     */
    Stride {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[**D3DBASISTYPE**](./d3dbasistype.md)**
     * 
     * 
     * Member of the [**D3DBASISTYPE**](./d3dbasistype.md) enumerated type, defining the basis type for the rectangular high-order patch.
     * 
     * 
     * 
     * | Value                 | Order supported            | Width and height                  |
     * |-----------------------|----------------------------|-----------------------------------|
     * | D3DBASIS\_BEZIER      | Linear, cubic, and quintic | Width = height = (DWORD)order + 1 |
     * | D3DBASIS\_BSPLINE     | Linear, cubic, and quintic | Width = height > (DWORD)order  |
     * | D3DBASIS\_INTERPOLATE | Cubic                      | Width = height > (DWORD)order  |
     * @type {Integer}
     */
    Basis {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: **[**D3DDEGREETYPE**](./d3ddegreetype.md)**
     * 
     * 
     * Member of the [**D3DDEGREETYPE**](./d3ddegreetype.md) enumerated type, defining the degree for the rectangular patch.
     * @type {Integer}
     */
    Degree {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
