#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_FLIPINTERVAL_TYPE.ahk" { D3DDDI_FLIPINTERVAL_TYPE }
#Import ".\D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3.ahk" { D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3 }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY3 {
    #StructPack 8

    LayerIndex : UInt32

    InputFlags : IntPtr

    FlipInterval : D3DDDI_FLIPINTERVAL_TYPE

    MaxImmediateFlipLine : UInt32

    AllocationCount : UInt32

    pAllocationList : IntPtr

    DriverPrivateDataSize : UInt32

    pDriverPrivateData : IntPtr

    pPlaneAttributes : D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3.Ptr

    hFlipToFence : UInt32

    hFlipAwayFence : UInt32

    FlipToFenceValue : Int64

    FlipAwayFenceValue : Int64

}
