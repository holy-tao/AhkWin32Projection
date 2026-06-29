#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDEVICEDESC_V3 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dcmColorModel : UInt32

    dwDevCaps : UInt32

    dtcTransformCaps : IntPtr

    bClipping : BOOL

    dlcLightingCaps : IntPtr

    dpcLineCaps : IntPtr

    dpcTriCaps : IntPtr

    dwDeviceRenderBitDepth : UInt32

    dwDeviceZBufferBitDepth : UInt32

    dwMaxBufferSize : UInt32

    dwMaxVertexCount : UInt32

    dwMinTextureWidth : UInt32

    dwMinTextureHeight : UInt32

    dwMaxTextureWidth : UInt32

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

}
