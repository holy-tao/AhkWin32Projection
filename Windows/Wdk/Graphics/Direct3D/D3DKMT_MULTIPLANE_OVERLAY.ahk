#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY {
    #StructPack 8

    LayerIndex : UInt32

    Enabled : BOOL

    hAllocation : UInt32

    PlaneAttributes : IntPtr

}
