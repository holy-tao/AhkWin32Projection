#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GET_MULTIPLANE_OVERLAY_CAPS {
    #StructPack 8

    hAdapter : UInt32

    VidPnSourceId : UInt32

    MaxPlanes : UInt32

    MaxRGBPlanes : UInt32

    MaxYUVPlanes : UInt32

    OverlayCaps : IntPtr

    MaxStretchFactor : Float32

    MaxShrinkFactor : Float32

}
