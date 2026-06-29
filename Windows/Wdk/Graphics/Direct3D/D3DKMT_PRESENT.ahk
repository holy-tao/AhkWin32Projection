#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DDDI_FLIPINTERVAL_TYPE.ahk" { D3DDDI_FLIPINTERVAL_TYPE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Win32\Foundation\RECT.ahk" { RECT }
#Import ".\D3DKMT_PRESENT_RGNS.ahk" { D3DKMT_PRESENT_RGNS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENT {
    #StructPack 8

    hDevice : UInt32

    hWindow : HWND

    VidPnSourceId : UInt32

    hSource : UInt32

    hDestination : UInt32

    Color : UInt32

    DstRect : IntPtr

    SrcRect : IntPtr

    SubRectCnt : UInt32

    pSrcSubRects : RECT.Ptr

    PresentCount : UInt32

    FlipInterval : D3DDDI_FLIPINTERVAL_TYPE

    Flags : IntPtr

    BroadcastContextCount : UInt32

    BroadcastContext : UInt32[64]

    PresentLimitSemaphore : HANDLE

    PresentHistoryToken : IntPtr

    pPresentRegions : D3DKMT_PRESENT_RGNS.Ptr

    hAdapter : UInt32

    Duration : UInt32

    BroadcastSrcAllocation : IntPtr

    BroadcastDstAllocation : IntPtr

    PrivateDriverDataSize : UInt32

    pPrivateDriverData : IntPtr

    bOptimizeForComposition : BOOLEAN

    static __New() {
        DefineProp(this.Prototype, 'hContext', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'hIndirectContext', { type: UInt32, offset: 368 })
        this.DeleteProp("__New")
    }
}
