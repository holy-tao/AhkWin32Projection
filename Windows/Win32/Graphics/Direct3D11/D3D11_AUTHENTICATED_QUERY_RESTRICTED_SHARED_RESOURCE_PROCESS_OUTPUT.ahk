#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE.ahk" { D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk" { D3D11_AUTHENTICATED_QUERY_OUTPUT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS query.
 * @remarks
 * The Desktop Window Manager (DWM) process is identified by setting <b>ProcessIdentifier</b> equal to <b>D3D11_PROCESSIDTYPE_DWM</b>. Other processes are identified by setting the process handle in <b>ProcessHandle</b> and setting <b>ProcessIdentifier</b> equal to <b>D3D11_PROCESSIDTYPE_HANDLE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_OUTPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3D11_AUTHENTICATED_QUERY_OUTPUT

    /**
     * The index of the process in the list of processes.
     */
    ProcessIndex : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_authenticated_process_identifier_type">D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE</a> value that specifies the type of process.
     */
    ProcessIdentifier : D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE

    /**
     * A process handle. If the <b>ProcessIdentifier</b> member equals <b>D3D11_PROCESSIDTYPE_HANDLE</b>, the <b>ProcessHandle</b> member contains a valid handle to a process. Otherwise, this member is ignored.
     */
    ProcessHandle : HANDLE

}
