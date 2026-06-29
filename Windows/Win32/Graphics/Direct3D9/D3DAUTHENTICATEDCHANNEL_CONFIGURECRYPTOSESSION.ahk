#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk" { D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_CRYPTOSESSION command.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configurecryptosession
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_CONFIGURECRYPTOSESSION {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
     */
    Parameters : D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT

    /**
     * A handle to the DirectX Video Acceleration 2 (DXVA-2) decoder device.
     */
    DXVA2DecodeHandle : HANDLE

    /**
     * A handle to the cryptographic session.
     */
    CryptoSessionHandle : HANDLE

    /**
     * A handle to the Direct3D device.
     */
    DeviceHandle : HANDLE

}
