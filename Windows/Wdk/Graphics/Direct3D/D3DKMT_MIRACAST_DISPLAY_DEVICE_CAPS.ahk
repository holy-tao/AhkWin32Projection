#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MIRACAST_DISPLAY_DEVICE_CAPS {
    #StructPack 4

    HdcpSupported : BOOLEAN

    DefaultControlPort : UInt32

    UsesIhvSolution : BOOLEAN

}
