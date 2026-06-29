#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_CONTEXT_TYPE.ahk" { D3D11_CONTEXT_TYPE }
#Import ".\D3D11_QUERY.ahk" { D3D11_QUERY }

/**
 * Describes a query. (D3D11_QUERY_DESC1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_query_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_QUERY_DESC1 {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY</a>-typed value that specifies the type of query.
     */
    Query : D3D11_QUERY

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query_misc_flag">D3D11_QUERY_MISC_FLAG</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies query behavior.
     */
    MiscFlags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_context_type">D3D11_CONTEXT_TYPE</a>-typed value that specifies the context for the query.
     */
    ContextType : D3D11_CONTEXT_TYPE

}
