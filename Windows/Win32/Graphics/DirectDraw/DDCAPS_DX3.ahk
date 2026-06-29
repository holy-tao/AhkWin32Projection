#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS.ahk" { DDSCAPS }

/**
 * The DDCAPS_DX3 structure (ddraw.h) represents the capabilities of the hardware exposed through the DirectDraw object.
 * @remarks
 * For backward compatibility, the Ddraw.h header file contains multiple definitions of the DDCAPS structure. The version that passes the preprocessor is determined by the value of the DIRECTDRAW_VERSION constant.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddcaps_dx3
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDCAPS_DX3 {
    #StructPack 4

    /**
     * Size of the structure, in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * This value consists of one or more of the following flags that specify hardware and driver capabilities.
     */
    dwCaps : UInt32

    /**
     * This value consists of one or more of the following flags that specify more hardware and driver capabilities.
     */
    dwCaps2 : UInt32

    /**
     * This value consists of one or more of the following flags that specify color-key capabilities.
     */
    dwCKeyCaps : UInt32

    /**
     * This value consists of one or more of the following flags that specify driver stretching and effects capabilities.
     */
    dwFXCaps : UInt32

    /**
     * This value consists of one or more of the following flags that specify driver alpha capabilities.
     */
    dwFXAlphaCaps : UInt32

    /**
     * This value consists of one or more of the following flags that specify palette capabilities.
     */
    dwPalCaps : UInt32

    /**
     * This value consists of one or more of the following flags that specify stereo-vision capabilities.
     */
    dwSVCaps : UInt32

    /**
     * DDBD_2, DDBD_4, or DDBD_8. (Indicate 2, 4, or 8 bits per pixel.)
     */
    dwAlphaBltConstBitDepths : UInt32

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     */
    dwAlphaBltPixelBitDepths : UInt32

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     */
    dwAlphaBltSurfaceBitDepths : UInt32

    /**
     * DDBD_2, DDBD_4, or DDBD_8. (Indicate 2, 4, or 8 bits per pixel.)
     */
    dwAlphaOverlayConstBitDepths : UInt32

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     */
    dwAlphaOverlayPixelBitDepths : UInt32

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     */
    dwAlphaOverlaySurfaceBitDepths : UInt32

    /**
     * DDBD_8, DDBD_16, DDBD_24, or DDBD_32. (Indicate 8, 16, 24, or 32 bits per pixel.) This member is obsolete for DirectX 6.0 and later. Use the <b>IDirect3D7::EnumZBufferFormats</b> to retrieve information about supported depth buffer formats.
     */
    dwZBufferBitDepths : UInt32

    /**
     * Total amount of display memory on the device, in bytes, minus memory reserved for the primary surface and any private data structures reserved by the driver. (This value is the same as the total video memory reported by the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getavailablevidmem">IDirectDraw7::GetAvailableVidMem</a> method.)
     */
    dwVidMemTotal : UInt32

    /**
     * Free display memory. This value equals the value in <b>dwVidMemTotal</b>, minus any memory currently allocated by the application for surfaces. Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getavailablevidmem">IDirectDraw7::GetAvailableVidMem</a> method, which reports the memory available for a particular type of surface (such as a texture), this value reflects the memory available for any type of surface.
     */
    dwVidMemFree : UInt32

    /**
     * Maximum number of visible overlays or overlay sprites.
     */
    dwMaxVisibleOverlays : UInt32

    /**
     * Current number of visible overlays or overlay sprites.
     */
    dwCurrVisibleOverlays : UInt32

    /**
     * Number of FourCC codes.
     */
    dwNumFourCCCodes : UInt32

    /**
     * Source-rectangle alignment for an overlay surface, in pixels.
     */
    dwAlignBoundarySrc : UInt32

    /**
     * Source-rectangle size alignment for an overlay surface, in pixels. Overlay source rectangles must have a pixel width that is a multiple of this value.
     */
    dwAlignSizeSrc : UInt32

    /**
     * Destination-rectangle alignment for an overlay surface, in pixels.
     */
    dwAlignBoundaryDest : UInt32

    /**
     * Destination-rectangle size alignment for an overlay surface, in pixels. Overlay destination rectangles must have a pixel width that is a multiple of this value.
     */
    dwAlignSizeDest : UInt32

    /**
     * Stride alignment.
     */
    dwAlignStrideAlign : UInt32

    /**
     * Raster operations supported.
     */
    dwRops : UInt32[8]

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure that contains general surface capabilities.
     */
    ddsCaps : DDSCAPS

    /**
     * Minimum overlay stretch factor, multiplied by 1000. For example, 1.3 = 1300.
     */
    dwMinOverlayStretch : UInt32

    /**
     * Maximum overlay stretch factor, multiplied by 1000. For example, 1.3 = 1300.
     */
    dwMaxOverlayStretch : UInt32

    /**
     * Obsolete; do not use.
     */
    dwMinLiveVideoStretch : UInt32

    /**
     * Obsolete; do not use.
     */
    dwMaxLiveVideoStretch : UInt32

    /**
     * Obsolete; do not use.
     */
    dwMinHwCodecStretch : UInt32

    /**
     * Obsolete; do not use.
     */
    dwMaxHwCodecStretch : UInt32

    /**
     * Reserved
     */
    dwReserved1 : UInt32

    /**
     * Reserved
     */
    dwReserved2 : UInt32

    /**
     * Reserved
     */
    dwReserved3 : UInt32

    /**
     * Driver-specific capabilities for bitblts from system memory to display memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCaps</b> member.
     */
    dwSVBCaps : UInt32

    /**
     * Driver color-key capabilities for bitblts from system memory to display memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCKeyCaps</b> member.
     */
    dwSVBCKeyCaps : UInt32

    /**
     * Driver FX capabilities for bitblts from system memory to display memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwFXCaps</b> member.
     */
    dwSVBFXCaps : UInt32

    /**
     * Raster operations supported for bitblts from system memory to display memory.
     */
    dwSVBRops : UInt32[8]

    /**
     * Driver-specific capabilities for bitblts from display memory to system memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCaps</b> member.
     */
    dwVSBCaps : UInt32

    /**
     * Driver color-key capabilities for bitblts from display memory to system memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCKeyCaps</b> member.
     */
    dwVSBCKeyCaps : UInt32

    /**
     * Driver FX capabilities for bitblts from display memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwFXCaps</b> member.
     */
    dwVSBFXCaps : UInt32

    /**
     * Raster operations supported for bitblts from display memory to system memory.
     */
    dwVSBRops : UInt32[8]

    /**
     * Driver-specific capabilities for bitblts from system memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwCaps</b> member.
     */
    dwSSBCaps : UInt32

    /**
     * Driver color-key capabilities for bitblts from system memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwCKeyCaps</b> member.
     */
    dwSSBCKeyCaps : UInt32

    /**
     * Driver FX capabilities for bitblts from system memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwFXCaps</b> member.
     */
    dwSSBFXCaps : UInt32

    /**
     * Raster operations supported for bitblts from system memory to system memory.
     */
    dwSSBRops : UInt32[8]

    /**
     * Reserved
     */
    dwReserved4 : UInt32

    /**
     * Reserved
     */
    dwReserved5 : UInt32

    /**
     * Reserved
     */
    dwReserved6 : UInt32

}
