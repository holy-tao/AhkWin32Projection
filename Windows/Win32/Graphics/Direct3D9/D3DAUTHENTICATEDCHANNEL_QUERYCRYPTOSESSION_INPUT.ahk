#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_INPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_INPUT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for a D3DAUTHENTICATEDQUERY\_CRYPTOSESSION query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-querycryptosession-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYCRYPTOSESSION_INPUT {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_INPUT**](d3dauthenticatedchannel-query-input.md) structure that contains the GUID for the query and other data.
     */
    Input : D3DAUTHENTICATEDCHANNEL_QUERY_INPUT

    /**
     * A handle to a DirectX Video Acceleration 2 (DXVA-2) decoder device.
     */
    DXVA2DecodeHandle : HANDLE

}
