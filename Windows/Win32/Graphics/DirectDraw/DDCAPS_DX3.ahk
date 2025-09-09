#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDCAPS_DX3 structure (ddraw.h) represents the capabilities of the hardware exposed through the DirectDraw object.
 * @remarks
 * For backward compatibility, the Ddraw.h header file contains multiple definitions of the DDCAPS structure. The version that passes the preprocessor is determined by the value of the DIRECTDRAW_VERSION constant.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddcaps_dx3
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDCAPS_DX3 extends Win32Struct
{
    static sizeof => 316

    static packingSize => 4

    /**
     * Size of the structure, in bytes. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This value consists of one or more of the following flags that specify hardware and driver capabilities.
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This value consists of one or more of the following flags that specify more hardware and driver capabilities.
     * @type {Integer}
     */
    dwCaps2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This value consists of one or more of the following flags that specify color-key capabilities.
     * @type {Integer}
     */
    dwCKeyCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * This value consists of one or more of the following flags that specify driver stretching and effects capabilities.
     * @type {Integer}
     */
    dwFXCaps {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * This value consists of one or more of the following flags that specify driver alpha capabilities.
     * @type {Integer}
     */
    dwFXAlphaCaps {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This value consists of one or more of the following flags that specify palette capabilities.
     * @type {Integer}
     */
    dwPalCaps {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * This value consists of one or more of the following flags that specify stereo-vision capabilities.
     * @type {Integer}
     */
    dwSVCaps {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * DDBD_2, DDBD_4, or DDBD_8. (Indicate 2, 4, or 8 bits per pixel.)
     * @type {Integer}
     */
    dwAlphaBltConstBitDepths {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     * @type {Integer}
     */
    dwAlphaBltPixelBitDepths {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     * @type {Integer}
     */
    dwAlphaBltSurfaceBitDepths {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * DDBD_2, DDBD_4, or DDBD_8. (Indicate 2, 4, or 8 bits per pixel.)
     * @type {Integer}
     */
    dwAlphaOverlayConstBitDepths {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     * @type {Integer}
     */
    dwAlphaOverlayPixelBitDepths {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * DDBD_1, DDBD_2, DDBD_4, or DDBD_8. (Indicate 1, 2, 4, or 8 bits per pixel.)
     * @type {Integer}
     */
    dwAlphaOverlaySurfaceBitDepths {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * DDBD_8, DDBD_16, DDBD_24, or DDBD_32. (Indicate 8, 16, 24, or 32 bits per pixel.) This member is obsolete for DirectX 6.0 and later. Use the <b>IDirect3D7::EnumZBufferFormats</b> to retrieve information about supported depth buffer formats.
     * @type {Integer}
     */
    dwZBufferBitDepths {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Total amount of display memory on the device, in bytes, minus memory reserved for the primary surface and any private data structures reserved by the driver. (This value is the same as the total video memory reported by the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getavailablevidmem">IDirectDraw7::GetAvailableVidMem</a> method.)
     * @type {Integer}
     */
    dwVidMemTotal {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Free display memory. This value equals the value in <b>dwVidMemTotal</b>, minus any memory currently allocated by the application for surfaces. Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getavailablevidmem">IDirectDraw7::GetAvailableVidMem</a> method, which reports the memory available for a particular type of surface (such as a texture), this value reflects the memory available for any type of surface.
     * @type {Integer}
     */
    dwVidMemFree {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Maximum number of visible overlays or overlay sprites.
     * @type {Integer}
     */
    dwMaxVisibleOverlays {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Current number of visible overlays or overlay sprites.
     * @type {Integer}
     */
    dwCurrVisibleOverlays {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Number of FourCC codes.
     * @type {Integer}
     */
    dwNumFourCCCodes {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Source-rectangle alignment for an overlay surface, in pixels.
     * @type {Integer}
     */
    dwAlignBoundarySrc {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Source-rectangle size alignment for an overlay surface, in pixels. Overlay source rectangles must have a pixel width that is a multiple of this value.
     * @type {Integer}
     */
    dwAlignSizeSrc {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Destination-rectangle alignment for an overlay surface, in pixels.
     * @type {Integer}
     */
    dwAlignBoundaryDest {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Destination-rectangle size alignment for an overlay surface, in pixels. Overlay destination rectangles must have a pixel width that is a multiple of this value.
     * @type {Integer}
     */
    dwAlignSizeDest {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Stride alignment.
     * @type {Integer}
     */
    dwAlignStrideAlign {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Raster operations supported.
     * @type {Array<UInt32>}
     */
    dwRops{
        get {
            if(!this.HasProp("__dwRopsProxyArray"))
                this.__dwRopsProxyArray := Win32FixedArray(this.ptr + 100, 8, Primitive, "uint")
            return this.__dwRopsProxyArray
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure that contains general surface capabilities.
     * @type {Integer}
     */
    ddsCaps {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Minimum overlay stretch factor, multiplied by 1000. For example, 1.3 = 1300.
     * @type {Integer}
     */
    dwMinOverlayStretch {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Maximum overlay stretch factor, multiplied by 1000. For example, 1.3 = 1300.
     * @type {Integer}
     */
    dwMaxOverlayStretch {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Obsolete; do not use.
     * @type {Integer}
     */
    dwMinLiveVideoStretch {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Obsolete; do not use.
     * @type {Integer}
     */
    dwMaxLiveVideoStretch {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Obsolete; do not use.
     * @type {Integer}
     */
    dwMinHwCodecStretch {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Obsolete; do not use.
     * @type {Integer}
     */
    dwMaxHwCodecStretch {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved3 {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Driver-specific capabilities for bitblts from system memory to display memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCaps</b> member.
     * @type {Integer}
     */
    dwSVBCaps {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * Driver color-key capabilities for bitblts from system memory to display memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCKeyCaps</b> member.
     * @type {Integer}
     */
    dwSVBCKeyCaps {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * Driver FX capabilities for bitblts from system memory to display memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwFXCaps</b> member.
     * @type {Integer}
     */
    dwSVBFXCaps {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * Raster operations supported for bitblts from system memory to display memory.
     * @type {Array<UInt32>}
     */
    dwSVBRops{
        get {
            if(!this.HasProp("__dwSVBRopsProxyArray"))
                this.__dwSVBRopsProxyArray := Win32FixedArray(this.ptr + 184, 8, Primitive, "uint")
            return this.__dwSVBRopsProxyArray
        }
    }

    /**
     * Driver-specific capabilities for bitblts from display memory to system memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCaps</b> member.
     * @type {Integer}
     */
    dwVSBCaps {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * Driver color-key capabilities for bitblts from display memory to system memory. Valid flags are identical to the bitblt-related flags that are used with the <b>dwCKeyCaps</b> member.
     * @type {Integer}
     */
    dwVSBCKeyCaps {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * Driver FX capabilities for bitblts from display memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwFXCaps</b> member.
     * @type {Integer}
     */
    dwVSBFXCaps {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * Raster operations supported for bitblts from display memory to system memory.
     * @type {Array<UInt32>}
     */
    dwVSBRops{
        get {
            if(!this.HasProp("__dwVSBRopsProxyArray"))
                this.__dwVSBRopsProxyArray := Win32FixedArray(this.ptr + 228, 8, Primitive, "uint")
            return this.__dwVSBRopsProxyArray
        }
    }

    /**
     * Driver-specific capabilities for bitblts from system memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwCaps</b> member.
     * @type {Integer}
     */
    dwSSBCaps {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * Driver color-key capabilities for bitblts from system memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwCKeyCaps</b> member.
     * @type {Integer}
     */
    dwSSBCKeyCaps {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * Driver FX capabilities for bitblts from system memory to system memory. Valid flags are identical to the bitblt-related flags used with the <b>dwFXCaps</b> member.
     * @type {Integer}
     */
    dwSSBFXCaps {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * Raster operations supported for bitblts from system memory to system memory.
     * @type {Array<UInt32>}
     */
    dwSSBRops{
        get {
            if(!this.HasProp("__dwSSBRopsProxyArray"))
                this.__dwSSBRopsProxyArray := Win32FixedArray(this.ptr + 272, 8, Primitive, "uint")
            return this.__dwSSBRopsProxyArray
        }
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved4 {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved5 {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved6 {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }
}
