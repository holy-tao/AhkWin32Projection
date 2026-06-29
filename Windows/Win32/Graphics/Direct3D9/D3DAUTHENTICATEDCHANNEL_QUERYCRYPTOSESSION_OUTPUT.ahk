#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_CRYPTOSESSION query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-querycryptosession-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYCRYPTOSESSION_OUTPUT {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT

    /**
     * A handle to a DirectX Video Acceleration 2 (DXVA-2) decoder device.
     */
    DXVA2DecodeHandle : HANDLE

    /**
     * A handle to the cryptographic session that is associated with the decoder device.
     */
    CryptoSessionHandle : HANDLE

    /**
     * A handle to the Direct3D device that is associated with the decoder device.
     */
    DeviceHandle : HANDLE

}
