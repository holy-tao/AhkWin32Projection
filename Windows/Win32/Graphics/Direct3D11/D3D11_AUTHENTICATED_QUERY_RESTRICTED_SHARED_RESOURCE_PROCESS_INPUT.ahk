#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_AUTHENTICATED_QUERY_INPUT.ahk

/**
 * Contains input data for a D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS query.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_INPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_input">D3D11_AUTHENTICATED_QUERY_INPUT</a> structure that contains the GUID for the query and other data.
     * @type {D3D11_AUTHENTICATED_QUERY_INPUT}
     */
    Input{
        get {
            if(!this.HasProp("__Input"))
                this.__Input := D3D11_AUTHENTICATED_QUERY_INPUT(this.ptr + 0)
            return this.__Input
        }
    }

    /**
     * The index of the process.
     * @type {Integer}
     */
    ProcessIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
