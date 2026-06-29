#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GET_PTE {
    #StructPack 8

    PhysicalAdapterIndex : UInt32

    PageTableLevel : UInt32

    PageTableIndex : UInt32[6]

    b64KBPte : BOOLEAN

    NumPtes : UInt32

    Pte : IntPtr[64]

    NumValidEntries : UInt32

}
