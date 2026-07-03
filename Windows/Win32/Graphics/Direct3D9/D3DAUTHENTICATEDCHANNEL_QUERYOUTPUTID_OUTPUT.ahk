#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @architecture X64, Arm64
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYOUTPUTID_OUTPUT {
    #StructPack 8

    Output : D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT

    DeviceHandle : HANDLE

    CryptoSessionHandle : HANDLE

    OutputIDIndex : UInt32

    OutputID : Int64

}
