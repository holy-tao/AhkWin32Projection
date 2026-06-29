#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS.ahk" { DDSCAPS }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDCAPS_DX1 {
    #StructPack 4

    dwSize : UInt32

    dwCaps : UInt32

    dwCaps2 : UInt32

    dwCKeyCaps : UInt32

    dwFXCaps : UInt32

    dwFXAlphaCaps : UInt32

    dwPalCaps : UInt32

    dwSVCaps : UInt32

    dwAlphaBltConstBitDepths : UInt32

    dwAlphaBltPixelBitDepths : UInt32

    dwAlphaBltSurfaceBitDepths : UInt32

    dwAlphaOverlayConstBitDepths : UInt32

    dwAlphaOverlayPixelBitDepths : UInt32

    dwAlphaOverlaySurfaceBitDepths : UInt32

    dwZBufferBitDepths : UInt32

    dwVidMemTotal : UInt32

    dwVidMemFree : UInt32

    dwMaxVisibleOverlays : UInt32

    dwCurrVisibleOverlays : UInt32

    dwNumFourCCCodes : UInt32

    dwAlignBoundarySrc : UInt32

    dwAlignSizeSrc : UInt32

    dwAlignBoundaryDest : UInt32

    dwAlignSizeDest : UInt32

    dwAlignStrideAlign : UInt32

    dwRops : UInt32[8]

    ddsCaps : DDSCAPS

    dwMinOverlayStretch : UInt32

    dwMaxOverlayStretch : UInt32

    dwMinLiveVideoStretch : UInt32

    dwMaxLiveVideoStretch : UInt32

    dwMinHwCodecStretch : UInt32

    dwMaxHwCodecStretch : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dwReserved3 : UInt32

}
