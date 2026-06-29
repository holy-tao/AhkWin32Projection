#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DPRIMCAPS.ahk" { D3DPRIMCAPS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVICEDESC7 {
    #StructPack 4

    dwDevCaps : UInt32

    dpcLineCaps : D3DPRIMCAPS

    dpcTriCaps : D3DPRIMCAPS

    dwDeviceRenderBitDepth : UInt32

    dwDeviceZBufferBitDepth : UInt32

    dwMinTextureWidth : UInt32

    dwMinTextureHeight : UInt32

    dwMaxTextureWidth : UInt32

    dwMaxTextureHeight : UInt32

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

    deviceGUID : Guid

    wMaxUserClipPlanes : UInt16

    wMaxVertexBlendMatrices : UInt16

    dwVertexProcessingCaps : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dwReserved3 : UInt32

    dwReserved4 : UInt32

}
