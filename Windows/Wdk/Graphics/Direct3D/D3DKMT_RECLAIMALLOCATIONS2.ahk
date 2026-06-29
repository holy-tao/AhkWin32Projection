#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DDDI_RECLAIM_RESULT.ahk" { D3DDDI_RECLAIM_RESULT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_RECLAIMALLOCATIONS2 {
    #StructPack 8

    hPagingQueue : UInt32

    NumAllocations : UInt32

    pResources : IntPtr

    HandleList : IntPtr

    pDiscarded : BOOL.Ptr

    PagingFenceValue : Int64

    static __New() {
        DefineProp(this.Prototype, 'pResults', { type: D3DDDI_RECLAIM_RESULT.Ptr, offset: 24 })
        this.DeleteProp("__New")
    }
}
