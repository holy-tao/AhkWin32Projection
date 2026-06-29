#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DDDI_FLIPINTERVAL_TYPE.ahk" { D3DDDI_FLIPINTERVAL_TYPE }
#Import ".\D3DDDI_HDR_METADATA_TYPE.ahk" { D3DDDI_HDR_METADATA_TYPE }
#Import ".\D3DDDI_ROTATION.ahk" { D3DDDI_ROTATION }
#Import ".\D3DDDI_COLOR_SPACE_TYPE.ahk" { D3DDDI_COLOR_SPACE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_FLIPMODEL_PRESENTHISTORYTOKEN {
    #StructPack 8

    FenceValue : Int64

    hLogicalSurface : Int64

    dxgContext : IntPtr

    VidPnSourceId : UInt32

    SwapChainIndex : UInt32

    PresentLimitSemaphoreId : Int64

    FlipInterval : D3DDDI_FLIPINTERVAL_TYPE

    Flags : IntPtr

    hCompSurf : Int64

    compSurfLuid : IntPtr

    confirmationCookie : Int64

    CompositionSyncKey : Int64

    RemainingTokens : UInt32

    ScrollRect : IntPtr

    ScrollOffset : IntPtr

    PresentCount : UInt32

    RevealColor : Float32[4]

    Rotation : D3DDDI_ROTATION

    ScatterBlts : IntPtr

    HDRMetaDataType : D3DDDI_HDR_METADATA_TYPE

    HDRMetaDataHDR10 : IntPtr

    InkCookie : UInt32

    SourceRect : IntPtr

    DestWidth : UInt32

    DestHeight : UInt32

    TargetRect : IntPtr

    Transform : Float32[6]

    CustomDuration : UInt32

    CustomDurationFlipInterval : D3DDDI_FLIPINTERVAL_TYPE

    PlaneIndex : UInt32

    ColorSpace : D3DDDI_COLOR_SPACE_TYPE

    DirtyRegions : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'hSyncObject', { type: HANDLE, offset: 136 })
        DefineProp(this.Prototype, 'HDRMetaDataHDR10Plus', { type: IntPtr, offset: 152 })
        this.DeleteProp("__New")
    }
}
