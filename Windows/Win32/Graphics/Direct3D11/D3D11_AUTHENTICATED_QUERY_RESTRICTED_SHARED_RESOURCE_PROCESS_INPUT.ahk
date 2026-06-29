#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D11_AUTHENTICATED_QUERY_INPUT.ahk" { D3D11_AUTHENTICATED_QUERY_INPUT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for a D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_INPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_input">D3D11_AUTHENTICATED_QUERY_INPUT</a> structure that contains the GUID for the query and other data.
     */
    Input : D3D11_AUTHENTICATED_QUERY_INPUT

    /**
     * The index of the process.
     */
    ProcessIndex : UInt32

}
