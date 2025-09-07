#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_AUTHENTICATED_QUERY_INPUT.ahk

/**
 * Contains input data for a D3D11_AUTHENTICATED_QUERY_OUTPUT_ID query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_input
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_INPUT extends Win32Struct
{
    static sizeof => 48

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
     * A handle to the device.
     * @type {Pointer<Ptr>}
     */
    DeviceHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A handle to the cryptographic session.
     * @type {Pointer<Ptr>}
     */
    CryptoSessionHandle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The index of the output ID.
     * @type {Integer}
     */
    OutputIDIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
