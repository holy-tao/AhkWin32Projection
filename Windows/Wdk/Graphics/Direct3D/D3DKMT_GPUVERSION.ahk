#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GPUVERSION {
    #StructPack 4

    PhysicalAdapterIndex : UInt32

    BiosVersion : WCHAR[32]

    GpuArchitecture : WCHAR[32]

}
