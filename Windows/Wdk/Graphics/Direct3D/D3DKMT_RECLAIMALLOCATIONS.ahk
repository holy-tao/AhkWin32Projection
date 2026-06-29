#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_RECLAIMALLOCATIONS {
    #StructPack 8

    hDevice : UInt32

    pResources : IntPtr

    HandleList : IntPtr

    pDiscarded : BOOL.Ptr

    NumAllocations : UInt32

}
