#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETPROCESSDEVICEREMOVALSUPPORT {
    #StructPack 8

    hProcess : HANDLE

    AdapterLuid : IntPtr

    Support : BOOLEAN

}
