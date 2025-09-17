#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_OMAC.ahk
#Include .\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_COUNT query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_count_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_COUNT_OUTPUT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     * @type {D3D11_AUTHENTICATED_QUERY_OUTPUT}
     */
    Output{
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3D11_AUTHENTICATED_QUERY_OUTPUT(this.ptr + 0)
            return this.__Output
        }
    }

    /**
     * A handle to the device.
     * @type {Pointer<Void>}
     */
    DeviceHandle {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A handle to the cryptographic session.
     * @type {Pointer<Void>}
     */
    CryptoSessionHandle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The number of output IDs associated with the specified device and cryptographic session.
     * @type {Integer}
     */
    OutputIDCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
