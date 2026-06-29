#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_AUTHENTICATED_QUERY_OUTPUT.ahk" { D3D11_AUTHENTICATED_QUERY_OUTPUT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D11_OMAC.ahk" { D3D11_OMAC }

/**
 * Contains the response to a D3D11_AUTHENTICATED_QUERY_OUTPUT_ID query.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_output
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_OUTPUT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3D11_AUTHENTICATED_QUERY_OUTPUT

    /**
     * A handle to the device.
     */
    DeviceHandle : HANDLE

    /**
     * A handle to the cryptographic session.
     */
    CryptoSessionHandle : HANDLE

    /**
     * The index of the output ID.
     */
    OutputIDIndex : UInt32

    /**
     * An output ID that is associated with the specified device and cryptographic session.
     */
    OutputID : Int64

}
