#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE.ahk
#Include .\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\D3D11_OMAC.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS query.
 * @remarks
 * The Desktop Window Manager (DWM) process is identified by setting <b>ProcessIdentifier</b> equal to <b>D3D11_PROCESSIDTYPE_DWM</b>. Other processes are identified by setting the process handle in <b>ProcessHandle</b> and setting <b>ProcessIdentifier</b> equal to <b>D3D11_PROCESSIDTYPE_HANDLE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_OUTPUT extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3D11_AUTHENTICATED_QUERY_OUTPUT}
     */
    Output {
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3D11_AUTHENTICATED_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * The index of the process in the list of processes.
     * @type {Integer}
     */
    ProcessIndex {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_authenticated_process_identifier_type">D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE</a> value that specifies the type of process.
     * @type {D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE}
     */
    ProcessIdentifier {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * A process handle. If the <b>ProcessIdentifier</b> member equals <b>D3D11_PROCESSIDTYPE_HANDLE</b>, the <b>ProcessHandle</b> member contains a valid handle to a process. Otherwise, this member is ignored.
     * @type {HANDLE}
     */
    ProcessHandle {
        get {
            if(!this.HasProp("__ProcessHandle"))
                this.__ProcessHandle := HANDLE(56, this)
            return this.__ProcessHandle
        }
    }
}
