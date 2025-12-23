#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the vertex data layout. Each vertex can contain one or more data types, and each data type is described by a vertex element.
 * @remarks
 * Vertex data is defined using an array of **D3DVERTEXELEMENT9** structures. Use [**D3DDECL\_END**](d3ddecl-end.md) to declare the last element in the declaration.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dvertexelement9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DVERTEXELEMENT9 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Stream number.
     * @type {Integer}
     */
    Stream {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Offset from the beginning of the vertex data to the data associated with the particular data type.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: **[**BYTE**](../winprog/windows-data-types.md)**
     * 
     * 
     * The data type, specified as a [**D3DDECLTYPE**](./d3ddecltype.md). One of several predefined types that define the data size. Some methods have an implied type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * Type: **[**BYTE**](../winprog/windows-data-types.md)**
     * 
     * 
     * The method specifies the tessellator processing, which determines how the tessellator interprets (or operates on) the vertex data. For more information, see [**D3DDECLMETHOD**](./d3ddeclmethod.md).
     * @type {Integer}
     */
    Method {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * Type: **[**BYTE**](../winprog/windows-data-types.md)**
     * 
     * 
     * Defines what the data will be used for; that is, the interoperability between vertex data layouts and vertex shaders. Each usage acts to bind a vertex declaration to a vertex shader. In some cases, they have a special interpretation. For example, an element that specifies D3DDECLUSAGE\_NORMAL or D3DDECLUSAGE\_POSITION is used by the N-patch tessellator to set up tessellation. See [**D3DDECLUSAGE**](./d3ddeclusage.md) for a list of the available semantics. D3DDECLUSAGE\_TEXCOORD can be used for user-defined fields (which don't have an existing usage defined).
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * Type: **[**BYTE**](../winprog/windows-data-types.md)**
     * 
     * 
     * Modifies the usage data to allow the user to specify multiple usage types.
     * @type {Integer}
     */
    UsageIndex {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }
}
