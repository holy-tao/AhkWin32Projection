#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_BUS_TYPE.ahk" { D3D11_BUS_TYPE }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }
#Import ".\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk" { D3D11_AUTHENTICATED_QUERY_OUTPUT }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ATTRIBUTES query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_OUTPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3D11_AUTHENTICATED_QUERY_OUTPUT

    /**
     * A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bus_type">D3D11_BUS_TYPE</a> enumeration.
     */
    BusType : D3D11_BUS_TYPE

    /**
     * If <b>TRUE</b>, contiguous blocks of video memory may be accessible to the CPU or the bus.
     */
    AccessibleInContiguousBlocks : BOOL

    /**
     * If <b>TRUE</b>, non-contiguous blocks of video memory may be accessible to the CPU or the bus.
     */
    AccessibleInNonContiguousBlocks : BOOL

}
