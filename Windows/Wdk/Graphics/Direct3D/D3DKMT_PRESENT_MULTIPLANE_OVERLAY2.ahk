#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_FLIPINTERVAL_TYPE.ahk" { D3DDDI_FLIPINTERVAL_TYPE }
#Import ".\D3DKMT_MULTIPLANE_OVERLAY2.ahk" { D3DKMT_MULTIPLANE_OVERLAY2 }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENT_MULTIPLANE_OVERLAY2 {
    #StructPack 8

    hAdapter : UInt32

    hDevice : UInt32

    BroadcastContextCount : UInt32

    BroadcastContext : UInt32[64]

    VidPnSourceId : UInt32

    PresentCount : UInt32

    FlipInterval : D3DDDI_FLIPINTERVAL_TYPE

    Flags : IntPtr

    PresentPlaneCount : UInt32

    pPresentPlanes : D3DKMT_MULTIPLANE_OVERLAY2.Ptr

    Duration : UInt32

    static __New() {
        DefineProp(this.Prototype, 'hContext', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
