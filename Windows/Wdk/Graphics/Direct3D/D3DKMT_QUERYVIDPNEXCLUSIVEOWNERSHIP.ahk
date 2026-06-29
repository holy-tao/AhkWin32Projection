#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\HWND.ahk" { HWND }
#Import ".\D3DKMT_VIDPNSOURCEOWNER_TYPE.ahk" { D3DKMT_VIDPNSOURCEOWNER_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYVIDPNEXCLUSIVEOWNERSHIP {
    #StructPack 8

    hProcess : HANDLE

    hWindow : HWND

    VidPnSourceId : UInt32

    AdapterLuid : IntPtr

    OwnerType : D3DKMT_VIDPNSOURCEOWNER_TYPE

}
