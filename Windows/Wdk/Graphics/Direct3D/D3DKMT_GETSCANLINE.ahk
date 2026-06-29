#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETSCANLINE {
    #StructPack 4

    hAdapter : UInt32

    VidPnSourceId : UInt32

    InVerticalBlank : BOOLEAN

    ScanLine : UInt32

}
