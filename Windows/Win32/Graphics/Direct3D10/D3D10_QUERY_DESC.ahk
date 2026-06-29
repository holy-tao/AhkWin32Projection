#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_QUERY.ahk" { D3D10_QUERY }

/**
 * Describes a query. (D3D10_QUERY_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_query_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_QUERY_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_query">D3D10_QUERY</a></b>
     * 
     * Type of query (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_query">D3D10_QUERY</a>).
     */
    Query : D3D10_QUERY

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Miscellaneous flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_query_misc_flag">D3D10_QUERY_MISC_FLAG</a>).
     */
    MiscFlags : UInt32

}
