#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_HDR_METADATA_HDR10 {
    #StructPack 4

    RedPrimary : UInt16[2]

    GreenPrimary : UInt16[2]

    BluePrimary : UInt16[2]

    WhitePoint : UInt16[2]

    MaxMasteringLuminance : UInt32

    MinMasteringLuminance : UInt32

    MaxContentLightLevel : UInt16

    MaxFrameAverageLightLevel : UInt16

}
