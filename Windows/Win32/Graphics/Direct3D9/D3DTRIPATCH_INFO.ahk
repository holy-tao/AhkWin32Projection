#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a triangular high-order patch.
 * @remarks
 * For example, the following diagram identifies the vertex order and segment numbers for a cubic Bézier triangle patch. The vertex order determines the segment numbers used by [**DrawTriPatch**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-drawtripatch). The offset is the number of bytes to the first triangle patch vertex in the vertex buffer.
 * 
 * ![diagram of a triangular high-order patch with nine vertices](images/hop-tripatch-info.png)
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dtripatch-info
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DTRIPATCH_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Starting vertex offset, in number of vertices.
     * @type {Integer}
     */
    StartVertexOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**UINT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Number of vertices.
     * @type {Integer}
     */
    NumVertices {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[**D3DBASISTYPE**](./d3dbasistype.md)**
     * 
     * 
     * Member of the [**D3DBASISTYPE**](./d3dbasistype.md) enumerated type, which defines the basis type for the triangular high-order patch. The only valid value for this member is D3DBASIS\_BEZIER.
     * @type {Integer}
     */
    Basis {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

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
     * @type {Integer}
     */
    Degree {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
