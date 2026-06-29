#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D11_AUTHENTICATED_CONFIGURE_INPUT.ahk" { D3D11_AUTHENTICATED_CONFIGURE_INPUT }
#Import ".\D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE.ahk" { D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }

/**
 * Contains input data for a D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_shared_resource_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE_INPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a> structure that contains the command GUID and other data.
     */
    Parameters : D3D11_AUTHENTICATED_CONFIGURE_INPUT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_authenticated_process_identifier_type">D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE</a> value that specifies the type of process.
     * 
     * To specify the Desktop Window Manager (DWM) process, set this member to <b>D3D11_PROCESSIDTYPE_DWM</b>. Otherwise, set this member to <b>D3D11_PROCESSIDTYPE_HANDLE</b> and set the <b>ProcessHandle</b> member to a valid handle.
     */
    ProcessType : D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE

    /**
     * A process handle. If the <b>ProcessType</b> member equals <b>D3D11_PROCESSIDTYPE_HANDLE</b>, the <b>ProcessHandle</b> member specifies a handle to a process. Otherwise, the value is ignored.
     */
    ProcessHandle : HANDLE

    /**
     * If <b>TRUE</b>, the specified process has access to restricted shared resources.
     */
    AllowAccess : BOOL

}
