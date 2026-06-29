#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME {
    #StructPack 8

    DeviceName : WCHAR[32]

    hAdapter : UInt32

    AdapterLuid : IntPtr

    VidPnSourceId : UInt32

}
