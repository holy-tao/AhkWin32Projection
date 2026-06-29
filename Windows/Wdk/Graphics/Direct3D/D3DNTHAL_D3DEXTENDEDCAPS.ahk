#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_D3DEXTENDEDCAPS {
    #StructPack 4

    dwSize : UInt32

    dwMinTextureWidth : UInt32

    dwMaxTextureWidth : UInt32

    dwMinTextureHeight : UInt32

    dwMaxTextureHeight : UInt32

    dwMinStippleWidth : UInt32

    dwMaxStippleWidth : UInt32

    dwMinStippleHeight : UInt32

    dwMaxStippleHeight : UInt32

    dwMaxTextureRepeat : UInt32

    dwMaxTextureAspectRatio : UInt32

    dwMaxAnisotropy : UInt32

    dvGuardBandLeft : Float32

    dvGuardBandTop : Float32

    dvGuardBandRight : Float32

    dvGuardBandBottom : Float32

    dvExtentsAdjust : Float32

    dwStencilCaps : UInt32

    dwFVFCaps : UInt32

    dwTextureOpCaps : UInt32

    wMaxTextureBlendStages : UInt16

    wMaxSimultaneousTextures : UInt16

    dwMaxActiveLights : UInt32

    dvMaxVertexW : Float32

    wMaxUserClipPlanes : UInt16

    wMaxVertexBlendMatrices : UInt16

    dwVertexProcessingCaps : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dwReserved3 : UInt32

    dwReserved4 : UInt32

}
