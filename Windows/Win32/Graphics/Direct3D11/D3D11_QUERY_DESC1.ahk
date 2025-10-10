#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a query.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/ns-d3d11_3-d3d11_query_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_QUERY_DESC1 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY</a>-typed value that specifies the type of query.
     * @type {Integer}
     */
    Query {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query_misc_flag">D3D11_QUERY_MISC_FLAG</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies query behavior.
     * @type {Integer}
     */
    MiscFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_context_type">D3D11_CONTEXT_TYPE</a>-typed value that specifies the context for the query.
     * @type {Integer}
     */
    ContextType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
