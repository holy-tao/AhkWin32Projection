#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DPRIMCAPS.ahk" { D3DPRIMCAPS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DFINDDEVICESEARCH {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    bHardware : BOOL

    dcmColorModel : UInt32

    guid : Guid

    dwCaps : UInt32

    dpcPrimCaps : D3DPRIMCAPS

}
