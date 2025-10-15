#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3D11_AUTHENTICATED_CONFIGURE_INPUT.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains input data for a D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE command.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_authenticated_configure_shared_resource_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE_INPUT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a> structure that contains the command GUID and other data.
     * @type {D3D11_AUTHENTICATED_CONFIGURE_INPUT}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3D11_AUTHENTICATED_CONFIGURE_INPUT(this.ptr + 0)
            return this.__Parameters
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_authenticated_process_identifier_type">D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE</a> value that specifies the type of process.
     * 
     * To specify the Desktop Window Manager (DWM) process, set this member to <b>D3D11_PROCESSIDTYPE_DWM</b>. Otherwise, set this member to <b>D3D11_PROCESSIDTYPE_HANDLE</b> and set the <b>ProcessHandle</b> member to a valid handle.
     * @type {Integer}
     */
    ProcessType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * A process handle. If the <b>ProcessType</b> member equals <b>D3D11_PROCESSIDTYPE_HANDLE</b>, the <b>ProcessHandle</b> member specifies a handle to a process. Otherwise, the value is ignored.
     * @type {HANDLE}
     */
    ProcessHandle{
        get {
            if(!this.HasProp("__ProcessHandle"))
                this.__ProcessHandle := HANDLE(this.ptr + 48)
            return this.__ProcessHandle
        }
    }

    /**
     * If <b>TRUE</b>, the specified process has access to restricted shared resources.
     * @type {BOOL}
     */
    AllowAccess{
        get {
            if(!this.HasProp("__AllowAccess"))
                this.__AllowAccess := BOOL(this.ptr + 56)
            return this.__AllowAccess
        }
    }
}
