#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDEGREETYPE.ahk" { D3DDEGREETYPE }
#Import ".\D3DBASISTYPE.ahk" { D3DBASISTYPE }

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
 */
export default struct D3DRECTPATCH_INFO {
    #StructPack 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Starting vertex offset width, in number of vertices.
     */
    StartVertexOffsetWidth : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Starting vertex offset height, in number of vertices.
     */
    StartVertexOffsetHeight : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of each vertex, in number of vertices.
     */
    Width : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Height of each vertex, in number of vertices.
     */
    Height : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Width of the imaginary two-dimensional vertex array, which occupies the same space as the vertex buffer. For an example, see the diagram below.
     */
    Stride : UInt32

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
     */
    Basis : D3DBASISTYPE

    /**
     * Type: **[**D3DDEGREETYPE**](./d3ddegreetype.md)**
     * 
     * 
     * Member of the [**D3DDEGREETYPE**](./d3ddegreetype.md) enumerated type, defining the degree for the rectangular patch.
     */
    Degree : D3DDEGREETYPE

}
