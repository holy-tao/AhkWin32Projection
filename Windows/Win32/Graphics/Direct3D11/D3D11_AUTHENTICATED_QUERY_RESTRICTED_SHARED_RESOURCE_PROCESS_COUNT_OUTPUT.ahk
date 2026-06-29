#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk" { D3D11_AUTHENTICATED_QUERY_OUTPUT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_count_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT_OUTPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3D11_AUTHENTICATED_QUERY_OUTPUT

    /**
     * The number of processes that are allowed to open shared resources that have restricted access. A process cannot open such a resource unless the process has been granted access.
     */
    RestrictedSharedResourceProcessCount : UInt32

}
