#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDEGREETYPE.ahk" { D3DDEGREETYPE }
#Import ".\D3DBASISTYPE.ahk" { D3DBASISTYPE }

/**
 * Describes a triangular high-order patch.
 * @remarks
 * For example, the following diagram identifies the vertex order and segment numbers for a cubic Bézier triangle patch. The vertex order determines the segment numbers used by [**DrawTriPatch**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-drawtripatch). The offset is the number of bytes to the first triangle patch vertex in the vertex buffer.
 * 
 * ![diagram of a triangular high-order patch with nine vertices](images/hop-tripatch-info.png)
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtripatch-info
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DTRIPATCH_INFO {
    #StructPack 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Starting vertex offset, in number of vertices.
     */
    StartVertexOffset : UInt32

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of vertices.
     */
    NumVertices : UInt32

    /**
     * Type: **[**D3DBASISTYPE**](./d3dbasistype.md)**
     * 
     * 
     * Member of the [**D3DBASISTYPE**](./d3dbasistype.md) enumerated type, which defines the basis type for the triangular high-order patch. The only valid value for this member is D3DBASIS\_BEZIER.
     */
    Basis : D3DBASISTYPE

    /**
     * Type: **[**D3DDEGREETYPE**](./d3ddegreetype.md)**
     * 
     * 
     * Member of the [**D3DDEGREETYPE**](./d3ddegreetype.md) enumerated type, defining the degree type for the triangular high-order patch.
     * 
     * 
     * 
     * | Value                | Number of vertices |
     * |----------------------|--------------------|
     * | D3DDEGREE\_CUBIC     | 10                 |
     * | D3DDEGREE\_LINEAR    | 3                  |
     * | D3DDEGREE\_QUADRATIC | N/A                |
     * | D3DDEGREE\_QUINTIC   | 21                 |
     * 
     * 
     * 
     *  
     * 
     * N/A - Not available. Not supported.
     */
    Degree : D3DDEGREETYPE

}
