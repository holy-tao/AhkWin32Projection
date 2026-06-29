#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENADAPTERFROMDEVICENAME {
    #StructPack 8

    pDeviceName : PWSTR

    hAdapter : UInt32

    AdapterLuid : IntPtr

}
