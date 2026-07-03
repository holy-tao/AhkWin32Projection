#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_OUTPUTIDCOUNT query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryoutputidcount-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYOUTPUTIDCOUNT_OUTPUT {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT

    /**
     * A handle to the device.
     */
    DeviceHandle : HANDLE

    /**
     * A handle to the cryptographic session.
     */
    CryptoSessionHandle : HANDLE

    /**
     * The number of output IDs associated with the specified device and cryptographic session.
     */
    NumOutputIDs : UInt32

}
