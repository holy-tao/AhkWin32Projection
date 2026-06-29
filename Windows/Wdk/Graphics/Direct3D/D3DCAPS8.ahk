#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DDEVTYPE.ahk" { D3DDEVTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DCAPS8 {
    #StructPack 4

    DeviceType : D3DDEVTYPE

    AdapterOrdinal : UInt32

    Caps : UInt32

    Caps2 : UInt32

    Caps3 : UInt32

    PresentationIntervals : UInt32

    CursorCaps : UInt32

    DevCaps : UInt32

    PrimitiveMiscCaps : UInt32

    RasterCaps : UInt32

    ZCmpCaps : UInt32

    SrcBlendCaps : UInt32

    DestBlendCaps : UInt32

    AlphaCmpCaps : UInt32

    ShadeCaps : UInt32

    TextureCaps : UInt32

    TextureFilterCaps : UInt32

    CubeTextureFilterCaps : UInt32

    VolumeTextureFilterCaps : UInt32

    TextureAddressCaps : UInt32

    VolumeTextureAddressCaps : UInt32

    LineCaps : UInt32

    MaxTextureWidth : UInt32

    MaxTextureHeight : UInt32

    MaxVolumeExtent : UInt32

    MaxTextureRepeat : UInt32

    MaxTextureAspectRatio : UInt32

    MaxAnisotropy : UInt32

    MaxVertexW : Float32

    GuardBandLeft : Float32

    GuardBandTop : Float32

    GuardBandRight : Float32

    GuardBandBottom : Float32

    ExtentsAdjust : Float32

    StencilCaps : UInt32

    FVFCaps : UInt32

    TextureOpCaps : UInt32

    MaxTextureBlendStages : UInt32

    MaxSimultaneousTextures : UInt32

    VertexProcessingCaps : UInt32

    MaxActiveLights : UInt32

    MaxUserClipPlanes : UInt32

    MaxVertexBlendMatrices : UInt32

    MaxVertexBlendMatrixIndex : UInt32

    MaxPointSize : Float32

    MaxPrimitiveCount : UInt32

    MaxVertexIndex : UInt32

    MaxStreams : UInt32

    MaxStreamStride : UInt32

    VertexShaderVersion : UInt32

    MaxVertexShaderConst : UInt32

    PixelShaderVersion : UInt32

    MaxPixelShaderValue : Float32

}
