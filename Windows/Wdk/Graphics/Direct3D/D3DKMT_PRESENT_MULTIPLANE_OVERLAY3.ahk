#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_HDR_METADATA_TYPE.ahk" { D3DDDI_HDR_METADATA_TYPE }
#Import ".\D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION.ahk" { D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION }
#Import ".\D3DKMT_MULTIPLANE_OVERLAY3.ahk" { D3DKMT_MULTIPLANE_OVERLAY3 }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENT_MULTIPLANE_OVERLAY3 {
    #StructPack 8

    hAdapter : UInt32

    ContextCount : UInt32

    pContextList : IntPtr

    VidPnSourceId : UInt32

    PresentCount : UInt32

    Flags : IntPtr

    PresentPlaneCount : UInt32

    ppPresentPlanes : IntPtr

    pPostComposition : D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION.Ptr

    Duration : UInt32

    HDRMetaDataType : D3DDDI_HDR_METADATA_TYPE

    HDRMetaDataSize : UInt32

    pHDRMetaData : IntPtr

    BoostRefreshRateMultiplier : UInt32

}
