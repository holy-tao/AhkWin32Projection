#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDCORECAPS structure specifies the core capabilities of the Microsoft DirectDraw driver and its device, which are exposed to an application through the DirectDraw object.
 * @remarks
 * This section contains the DirectDraw driver structure whose name has the form DDCORECAPS, which is the form used on Windows 98/Me. This structure is identical to that whose name has the form DDNTCORECAPS which is the form used on Windows 2000 and later versions. The include file <i>dx95type.h</i> contains a type define from DDNTCORECAPS to DDCORECAPS.
  * 
  * This structure mirrors the first entries of the DDCAPS structure, but is of a fixed size and does not grow as DDCAPS does.
  * 
  * The driver initializes DDCORECAPS when it is initializing the other members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_halinfo">DD_HALINFO</a> structure in its <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> structure. The DirectDraw runtime might update some members.
  * 
  * DirectDraw requests additional driver capabilities by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function that is also returned in the DD_HALINFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawi/ns-ddrawi-ddcorecaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDCORECAPS extends Win32Struct
{
    static sizeof => 316

    static packingSize => 4

    /**
     * Specifies the size in bytes of this DDCORECAPS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates a flag that specifies the driver's capabilities. The driver should set the appropriate DDCAPS_<i>Xxx</i> bit for every capability that it supports. 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_3D
     * 
     * </td>
     * <td>
     * The display hardware has 3D acceleration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ALIGNBOUNDARYDEST
     * 
     * </td>
     * <td>
     * DirectDraw supports only those source rectangles with the x-axis aligned to the <b>dwAlignBoundaryDest</b> boundaries of the surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ALIGNBOUNDARYSRC
     * 
     * </td>
     * <td>
     * DirectDraw supports only those source rectangles with the x-axis aligned to the <b>dwAlignBoundarySrc</b> boundaries of the surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ALIGNSIZEDEST
     * 
     * </td>
     * <td>
     * DirectDraw supports only those source rectangles whose x-axis sizes, in bytes, are <b>dwAlignSizeDest</b> multiples.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ALIGNSIZESRC
     * 
     * </td>
     * <td>
     * DirectDraw supports only those source rectangles whose x-axis sizes, in bytes, are <b>dwAlignSizeSrc</b> multiples.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ALIGNSTRIDE
     * 
     * </td>
     * <td>
     * DirectDraw creates display memory surfaces that have a stride alignment equal to the <b>dwAlignStrideAlign</b> value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ALPHA
     * 
     * </td>
     * <td>
     * The display hardware supports an alpha channel during blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_BANKSWITCHED
     * 
     * </td>
     * <td>
     * The display hardware is bank-switched and is potentially very slow at random access to display memory. If this capability bit is set by the Microsoft Windows 2000 or later driver, DirectDraw is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_BLT
     * 
     * </td>
     * <td>
     * The display hardware is capable of blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_BLTCOLORFILL
     * 
     * </td>
     * <td>
     * The display hardware is capable of color filling with a blitter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_BLTDEPTHFILL
     * 
     * </td>
     * <td>
     * The display hardware is capable of depth filling z-buffers with a blitter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_BLTFOURCC
     * 
     * </td>
     * <td>
     * The display hardware is capable of color-space conversions during blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_BLTQUEUE
     * 
     * </td>
     * <td>
     * The display hardware is capable of asynchronous blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_BLTSTRETCH
     * 
     * </td>
     * <td>
     * The display hardware is capable of stretching during blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_CANBLTSYSMEM
     * 
     * </td>
     * <td>
     * The display hardware is capable of blitting to or from system memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_CANCLIP
     * 
     * </td>
     * <td>
     * The display hardware is capable of clipping with blitting.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_CANCLIPSTRETCHED
     * 
     * </td>
     * <td>
     * The display hardware is capable of clipping while stretch-blitting.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_COLORKEY
     * 
     * </td>
     * <td>
     * Some form of color key in either overlay or blit operations is supported. More specific color key capability information can be found in the <b>dwCKeyCaps</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_COLORKEYHWASSIST
     * 
     * </td>
     * <td>
     * The color key is hardware assisted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_GDI
     * 
     * </td>
     * <td>
     * The display hardware is shared with GDI. If this capability bit is set by the Windows 2000 or later driver, DirectDraw is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_NOHARDWARE
     * 
     * </td>
     * <td>
     * No hardware support exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_OVERLAY
     * 
     * </td>
     * <td>
     * The display hardware supports overlays.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_OVERLAYCANTCLIP
     * 
     * </td>
     * <td>
     * The display hardware supports overlays but cannot clip them.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_OVERLAYFOURCC
     * 
     * </td>
     * <td>
     * The overlay hardware is capable of color-space conversions during overlay operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_OVERLAYSTRETCH
     * 
     * </td>
     * <td>
     * The overlay hardware is capable of stretching.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_PALETTE
     * 
     * </td>
     * <td>
     * DirectDraw is capable of creating and supporting DirectDrawPalette objects for more than just  the primary surface. If this capability bit is set by the Windows 2000 or later driver, DirectDraw is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_PALETTEVSYNC
     * 
     * </td>
     * <td>
     * DirectDraw is capable of updating a palette synchronized with the vertical refresh.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_READSCANLINE
     * 
     * </td>
     * <td>
     * The display hardware is capable of returning the current scan line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_STEREOVIEW
     * 
     * </td>
     * <td>
     * The display hardware has stereo vision capabilities.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_VBI
     * 
     * </td>
     * <td>
     * The display hardware is capable of generating a vertical-blank interrupt.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ZBLTS
     * 
     * </td>
     * <td>
     * Supports the use of z-buffers with blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS_ZOVERLAYS
     * 
     * </td>
     * <td>
     * Supports the use of the application's <b>UpdateOverlayZOrder</b> method as a z-value for overlays to control their layering. If this capability bit is set by the Windows 2000 or later driver, DirectDraw is disabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specify more of the driver's capabilities. The driver should set the appropriate DDCAPS2_<i>Xxx</i> bit for every capability that it supports. 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_AUTOFLIPOVERLAY
     * 
     * </td>
     * <td>
     * The overlay can be automatically flipped to the next surface in the flip chain each time a hardware video port V-sync occurs, allowing the <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object and the overlay to double buffer the video without CPU overhead. This option is only valid when the surface is receiving data from hardware video port. If the hardware video port data is noninterlaced or noninterleaved, it flips on every V-sync. If the data is being interleaved in memory, it flips on every other V-sync.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANAUTOGENMIPMAP
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt><b>DirectX 9.0 and later versions only.</b></dt>
     * <dt>The driver and its device support automatically regenerating the sublevels of mipmap textures.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANBOBHARDWARE
     * 
     * </td>
     * <td>
     * The overlay hardware can display each field of an interlaced video stream individually.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANBOBINTERLEAVED
     * 
     * </td>
     * <td>
     * The overlay hardware can display each field of an interlaced video stream individually while it is interleaved in memory without causing any artifacts that might normally occur without special hardware support. This option is only valid when the surface is receiving data from a VPE object and is only valid when the video is zoomed at least 200 percent in the vertical direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANBOBNONINTERLEAVED
     * 
     * </td>
     * <td>
     * The overlay hardware can display each field of an interlaced video stream individually while it is not interleaved in memory without causing any artifacts that might normally occur without special hardware support. This option is only valid when the surface is receiving data from a VPE object and is only valid when the video is zoomed at least 200 percent in the vertical direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANCALIBRATEGAMMA
     * 
     * </td>
     * <td>
     * A calibrator is available to adjust the gamma ramp according to the physical display properties so that the result is identical on all calibrated systems.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANDROPZ16BIT
     * 
     * </td>
     * <td>
     * Sixteen-bit RGBZ values can be converted into 16-bit RGB values. (The system does not support eight-bit conversions.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANFLIPODDEVEN 
     * 
     * </td>
     * <td>
     * The driver supports bob using software without using a VPE object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANMANAGERESOURCE
     * 
     * </td>
     * <td>
     * The driver supports managing resources. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANMANAGETEXTURE
     * 
     * </td>
     * <td>
     * The driver supports managing textures. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CANRENDERWINDOWED
     * 
     * </td>
     * <td>
     * The driver can render in windowed mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_CERTIFIED
     * 
     * </td>
     * <td>
     * The display hardware is certified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_COLORCONTROLOVERLAY
     * 
     * </td>
     * <td>
     * The overlay surface contains color controls (brightness, sharpness, and so on).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_COLORCONTROLPRIMARY
     * 
     * </td>
     * <td>
     * The primary surface contains color controls (gamma, and so on).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_COPYFOURCC
     * 
     * </td>
     * <td>
     * The driver supports blitting any <a href="https://docs.microsoft.com/windows-hardware/drivers/">FOURCC</a> surface to another surface of the same FOURCC.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_FLIPINTERVAL
     * 
     * </td>
     * <td>
     * The driver responds to the DDFLIP_INTERVAL2, DDFLIP_INTERVAL3, and DDFLIP_INTERVAL4 flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_FLIPNOVSYNC
     * 
     * </td>
     * <td>
     * The driver responds to DDFLIP_FLIPNOVSYNC.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_NO2DDURING3DSCENE
     * 
     * </td>
     * <td>
     * The driver cannot interleave 2D operations such as <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_blt">DdBlt</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a> on any surfaces that Microsoft Direct3D is using between calls to the <b>IDirect3DDevice::BeginScene</b> and <b>IDirect3DDevice::EndScene</b> methods.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_NONLOCALVIDMEM
     * 
     * </td>
     * <td>
     * The driver supports nonlocal display memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_NONLOCALVIDMEMCAPS
     * 
     * </td>
     * <td>
     * Blit capabilities for nonlocal display memory surfaces differ from local display memory surfaces. If this flag is present, the DDCAPS2_NONLOCALVIDMEM flag is also present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_NOPAGELOCKREQUIRED
     * 
     * </td>
     * <td>
     * The driver should be called for blits involving system memory surfaces even if the system memory surfaces are not pagelocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_PRIMARYGAMMA
     * 
     * </td>
     * <td>
     * The driver supports loadable gamma ramps for the primary surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_VIDEOPORT
     * 
     * </td>
     * <td>
     * The display hardware contains a hardware video port.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCAPS2_WIDESURFACES
     * 
     * </td>
     * <td>
     * The display driver can create surfaces wider than the primary surface. Drivers that set this bit should expect to receive <b>CreateSurface</b> requests from applications for surfaces wider than the primary surface.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCaps2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specify the color key capabilities of surfaces. The driver should set the appropriate DDCKEYCAPS_<i>Xxx</i> bit for every capability that it supports. 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTBLT
     * 
     * </td>
     * <td>
     * Supports transparent blitting with a color key that identifies the replaceable bits of the destination surface for RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTBLTCLRSPACE
     * 
     * </td>
     * <td>
     * Supports transparent blitting with a color space that identifies the replaceable bits of the destination surface for RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTBLTCLRSPACEYUV
     * 
     * </td>
     * <td>
     * Supports transparent blitting with a color space that identifies the replaceable bits of the destination surface for YUV colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTBLTYUV
     * 
     * </td>
     * <td>
     * Supports transparent blitting with a color key that identifies the replaceable bits of the destination surface for YUV colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTOVERLAY
     * 
     * </td>
     * <td>
     * Supports overlaying with color keying of the replaceable bits of the destination surface being overlaid for RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTOVERLAYCLRSPACE
     * 
     * </td>
     * <td>
     * Supports a color space as the color key for the destination of RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTOVERLAYCLRSPACEYUV
     * 
     * </td>
     * <td>
     * Supports a color space as the color key for the destination of YUV colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTOVERLAYONEACTIVE
     * 
     * </td>
     * <td>
     * Supports only one active destination color key value for visible overlay surfaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_DESTOVERLAYYUV
     * 
     * </td>
     * <td>
     * Supports overlaying using color keying of the replaceable bits of the destination surface being overlaid for YUV colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_NOCOSTOVERLAY
     * 
     * </td>
     * <td>
     * Indicates that there are no bandwidth tradeoffs for using the color key with an overlay.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCBLT
     * 
     * </td>
     * <td>
     * Supports transparent blitting using the color key for the source with this surface for RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCBLTCLRSPACE
     * 
     * </td>
     * <td>
     * Supports transparent blitting using a color space for the source with this surface for RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCBLTCLRSPACEYUV
     * 
     * </td>
     * <td>
     * Supports transparent blitting using a color space for the source with this surface for YUV colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCBLTYUV
     * 
     * </td>
     * <td>
     * Supports transparent blitting using the color key for the source with this surface for YUV colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCOVERLAY
     * 
     * </td>
     * <td>
     * Supports overlaying using the color key for the source with this overlay surface for RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCOVERLAYCLRSPACE
     * 
     * </td>
     * <td>
     * Supports overlaying using a color space as the source color key for the overlay surface for RGB colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCOVERLAYCLRSPACEYUV
     * 
     * </td>
     * <td>
     * Supports overlaying using a color space as the source color key for the overlay surface for YUV colors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCOVERLAYONEACTIVE
     * 
     * </td>
     * <td>
     * Supports only one active source color key value for visible overlay surfaces.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDCKEYCAPS_SRCOVERLAYYUV
     * 
     * </td>
     * <td>
     * Supports overlaying using the color key for the source with this overlay surface for YUV colors.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCKeyCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specify the driver's stretching and effects capabilities. The driver should set the appropriate DDFXCAPS_<i>Xxx</i> bit for every capability that it supports. 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTARITHSTRETCHY
     * 
     * </td>
     * <td>
     * Uses arithmetic operations, rather than pixel-doubling techniques, to stretch and shrink surfaces during a blit operation. Occurs along the y-axis (vertically).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTARITHSTRETCHYN
     * 
     * </td>
     * <td>
     * Uses arithmetic operations, rather than pixel-doubling techniques, to stretch and shrink surfaces during a blit operation. Occurs along the y-axis (vertically), and works only for integer stretching (x1, x2, and so on).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTMIRRORLEFTRIGHT
     * 
     * </td>
     * <td>
     * Supports mirroring left to right in a blit operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTMIRRORUPDOWN
     * 
     * </td>
     * <td>
     * Supports mirroring top to bottom in a blit operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTROTATION
     * 
     * </td>
     * <td>
     * Supports arbitrary rotation in a blit operation. If this capability bit is set by the Windows 2000 or later driver, DirectDraw is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTROTATION90
     * 
     * </td>
     * <td>
     * Supports 90-degree rotations in a blit operation. If this capability bit is set by the Windows 2000 or later driver, DirectDraw is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSHRINKX
     * 
     * </td>
     * <td>
     * Supports arbitrary shrinking of a surface along the x-axis (horizontally). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSHRINKXN
     * 
     * </td>
     * <td>
     * Supports integer shrinking (x1, x2, and so on) of a surface along the x-axis (horizontally). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSHRINKY
     * 
     * </td>
     * <td>
     * Supports arbitrary shrinking of a surface along the y-axis (vertically). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSHRINKYN
     * 
     * </td>
     * <td>
     * Supports integer shrinking (x1, x2, and so on) of a surface along the y-axis (vertically). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSTRETCHX
     * 
     * </td>
     * <td>
     * Supports arbitrary stretching of a surface along the x-axis (horizontally). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSTRETCHXN
     * 
     * </td>
     * <td>
     * Supports integer stretching (x1, x2, and so on) of a surface along the x-axis (horizontally). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSTRETCHY
     * 
     * </td>
     * <td>
     * Supports arbitrary stretching of a surface along the y-axis (vertically). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_BLTSTRETCHYN
     * 
     * </td>
     * <td>
     * Supports integer stretching (x1, x2, and so on) of a surface along the y-axis (vertically). This flag is valid only for blit operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYARITHSTRETCHY
     * 
     * </td>
     * <td>
     * Uses arithmetic operations, rather than pixel-doubling techniques, to stretch and shrink surfaces during an overlay operation. Occurs along the y-axis (vertically).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYARITHSTRETCHYN
     * 
     * </td>
     * <td>
     * Uses arithmetic operations, rather than pixel-doubling techniques, to stretch and shrink surfaces during an overlay operation. Occurs along the y-axis (vertically), and works only for integer stretching (x1, x2, and so on).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYMIRRORLEFTRIGHT
     * 
     * </td>
     * <td>
     * Supports mirroring of overlays around the vertical axis.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYMIRRORUPDOWN
     * 
     * </td>
     * <td>
     * Supports mirroring of overlays across the horizontal axis.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSHRINKX
     * 
     * </td>
     * <td>
     * Supports arbitrary shrinking of a surface along the x-axis (horizontally). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that shrinking is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSHRINKXN
     * 
     * </td>
     * <td>
     * Supports integer shrinking (x1, x2, and so on) of a surface along the x-axis (horizontally). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that shrinking is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSHRINKY
     * 
     * </td>
     * <td>
     * Supports arbitrary shrinking of a surface along the y-axis (vertically). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that shrinking is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSHRINKYN
     * 
     * </td>
     * <td>
     * Supports integer shrinking (x1, x2, and so on) of a surface along the y-axis (vertically). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that shrinking is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSTRETCHX
     * 
     * </td>
     * <td>
     * Supports arbitrary stretching of a surface along the x-axis (horizontally). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that stretching is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSTRETCHXN
     * 
     * </td>
     * <td>
     * Supports integer stretching (x1, x2, and so on) of a surface along the x-axis (horizontally). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that stretching is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSTRETCHY
     * 
     * </td>
     * <td>
     * Supports arbitrary stretching of a surface along the y-axis (vertically). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that stretching is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFXCAPS_OVERLAYSTRETCHYN
     * 
     * </td>
     * <td>
     * Supports integer stretching (x1, x2, and so on) of a surface along the y-axis (vertically). This flag is valid only for DDSCAPS_OVERLAY surfaces. This flag indicates only the capabilities of a surface; it does not indicate that stretching is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFXCaps {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * This member and its flags are obsolete and should not be used by the driver.
     * @type {Integer}
     */
    dwFXAlphaCaps {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specify the driver's palette capabilities. The driver should set the appropriate DDPCAPS_<i>Xxx</i> bit for every capability that it supports. The DDPCAPS_<i>Xxx</i> flags are defined in <i>ddraw.h</i>. The DirectDraw runtime currently ignores these capabilities.
     * @type {Integer}
     */
    dwPalCaps {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specify the driver's stereo vision capabilities. The driver should set the appropriate DDSVCAPS_<i>Xxx</i> bit for every capability that it supports. 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDSVCAPS_ENIGMA
     * 
     * </td>
     * <td>
     * The stereo view is accomplished using Enigma encoding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDSVCAPS_FLICKER
     * 
     * </td>
     * <td>
     * The stereo view is accomplished using high-frequency flickering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDSVCAPS_REDBLUE
     * 
     * </td>
     * <td>
     * The stereo view is accomplished when the viewer looks at the image through red and blue filters placed over the left and right eyes. All images must adapt their color spaces for this process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDSVCAPS_SPLIT
     * 
     * </td>
     * <td>
     * The stereo view is accomplished with split-screen technology.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSVCaps {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwAlphaBltConstBitDepths {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwAlphaBltPixelBitDepths {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwAlphaBltSurfaceBitDepths {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwAlphaOverlayConstBitDepths {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwAlphaOverlayPixelBitDepths {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwAlphaOverlaySurfaceBitDepths {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    dwZBufferBitDepths {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the total amount of display memory, in bytes.
     * @type {Integer}
     */
    dwVidMemTotal {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies the number of bytes of free display memory. The driver sets this member once during initialization to the same value it returns in the <b>dwVidMemTotal</b> member. DirectDraw updates it every time the application does a memory allocation.
     * @type {Integer}
     */
    dwVidMemFree {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies the maximum number of visible overlays.
     * @type {Integer}
     */
    dwMaxVisibleOverlays {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies the current number of visible overlays.
     * @type {Integer}
     */
    dwCurrVisibleOverlays {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Specifies the number of <a href="https://docs.microsoft.com/windows-hardware/drivers/">FOURCC</a> codes that the driver supports.
     * @type {Integer}
     */
    dwNumFourCCCodes {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Specifies the source rectangle alignment. This member can be optionally set by the driver. If the driver sets this member, then the overlay source rectangle's top left coordinate value must be a multiple of <b>dwAlignBoundarySrc</b>.
     * @type {Integer}
     */
    dwAlignBoundarySrc {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Specifies the size of the source rectangle, in bytes. This member can be optionally set by the driver. If the driver sets this member, then the overlay source rectangle's width must be a multiple of <b>dwAlignSizeSrc</b>.
     * @type {Integer}
     */
    dwAlignSizeSrc {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Specifies the destination rectangle alignment. This member can be optionally set by the driver. If the driver sets this member, then the overlay destination rectangle's top left coordinate value must be a multiple of <b>dwAlignBoundaryDest</b>.
     * @type {Integer}
     */
    dwAlignBoundaryDest {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Specifies the destination rectangle byte size. This member can be optionally set by the driver. If the driver sets this member, then the overlay destination rectangle's width must be a multiple of <b>dwAlignSizeDest</b>.
     * @type {Integer}
     */
    dwAlignSizeDest {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    dwAlignStrideAlign {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Specifies an array of DD_ROP_SPACE DWORDs that together can hold flags to indicate the ROPs that the driver supports. The driver should set the bitfield for every corresponding ROP that it supports. See the Microsoft Windows SDK documentation for information about ROPs.
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
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that describes the types of surfaces the driver supports.
     * @type {Integer}
     */
    ddsCaps {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Specifies the minimum overlay stretch factor multiplied by 1000. For example, a factor of 1.3 should be stored as 1300. The display driver must set the minimum factor to the actual minimum to which the graphics hardware can shrink the overlay. If the graphics hardware has no minimum limitation, set to 1.
     * @type {Integer}
     */
    dwMinOverlayStretch {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Specifies the maximum overlay stretch factor multiplied by 1000. For example, a factor of 1.3 should be stored as 1300. The display driver must set the maximum factor to the actual maximum to which the graphics hardware can stretch the overlay. If the graphics hardware has no maximum limitation, set to 32000.
     * @type {Integer}
     */
    dwMaxOverlayStretch {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Specifies the minimum live video stretch factor multiplied by 1000. For example, a factor of 1.3 should be stored as 1300.
     * @type {Integer}
     */
    dwMinLiveVideoStretch {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Specifies the maximum live video stretch factor multiplied by 1000. For example, a factor of 1.3 should be stored as 1300.
     * @type {Integer}
     */
    dwMaxLiveVideoStretch {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Specifies the minimum hardware codec stretch factor multiplied by 1000. For example, a factor of 1.3 should be stored as 1300.
     * @type {Integer}
     */
    dwMinHwCodecStretch {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Specifies the maximum hardware codec stretch factor multiplied by 1000. For example, a factor of 1.3 should be stored as 1300.
     * @type {Integer}
     */
    dwMaxHwCodecStretch {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Reserved for system use. The driver should ignore this member.
     * @type {Integer}
     */
    dwReserved3 {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Indicates a set of flags that specify the driver-specific capabilities for system-memory-to-display-memory blits. The driver should bitwise OR the appropriate DDCAPS_<i>Xxx</i> flags (see the <b>dwCaps</b> member) to indicate the types of blit operations it supports when blitting from system memory to display memory.
     * @type {Integer}
     */
    dwSVBCaps {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * Indicates a set of flags that specify driver color-key capabilities for system-memory-to-display-memory blits. The driver should bitwise OR the appropriate DDCKEYCAPS_<i>Xxx</i> flags (see the <b>dwCKeyCaps</b> member) to indicate the types of color key operations it supports when blitting from system memory to display memory.
     * @type {Integer}
     */
    dwSVBCKeyCaps {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * Indicates a set of flags that specify driver FX capabilities for system-memory-to-display-memory blits. The driver should bitwise OR the appropriate DDFXCAPS_<i>Xxx</i> flags (see the <b>dwFXCaps</b> member) to indicate the types of effects it supports when blitting from system memory to display memory.
     * @type {Integer}
     */
    dwSVBFXCaps {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * Specifies an array of DD_ROP_SPACE DWORDs that together can hold flags to indicate the ROPs that the driver supports when performing system-memory-to-display-memory blits. The driver should set the bitfield for every corresponding ROP that it supports. See the Microsoft Windows SDK documentation for information about ROPs.
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
     * Indicates a set of flags that specify driver-specific capabilities for display-memory-to-system-memory blits. The driver should bitwise OR the appropriate DDCAPS_<i>Xxx</i> flags (see the <b>dwCaps</b> member) to indicate the types of blit operations it supports when blitting from display memory to system memory.
     * @type {Integer}
     */
    dwVSBCaps {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * Indicates a set of flags that specify driver color-key capabilities for display-memory-to-system-memory blits. The driver should bitwise OR the appropriate DDCKEYCAPS_<i>Xxx</i> flags (see the <b>dwCKeyCaps</b> member) to indicate the types of color key operations it supports when blitting from display memory to system memory.
     * @type {Integer}
     */
    dwVSBCKeyCaps {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * Indicates a set of flags that specify driver FX capabilities for display-memory-to-system-memory blits. The driver should bitwise OR the appropriate DDFXCAPS_<i>Xxx</i> flags (see the <b>dwFXCaps</b> member) to indicate the types of effects it supports when blitting from display memory to system memory.
     * @type {Integer}
     */
    dwVSBFXCaps {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * Specifies an array of DD_ROP_SPACE DWORDs that together can hold flags to indicate the ROPs that the driver supports when performing display-memory-to-system-memory blits. The driver should set the bitfield for every corresponding ROP that it supports. See the Windows SDK documentation for information about ROPs.
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
     * Indicates a set of flags that specify driver-specific capabilities for system-memory-to-system-memory blits. The driver should bitwise OR the appropriate DDCAPS_<i>Xxx</i> flags (see the <b>dwCaps</b> member) to indicate the types of blit operations it supports when blitting from system memory to system memory.
     * @type {Integer}
     */
    dwSSBCaps {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * Indicates a set of flags that specify driver color-key capabilities for system-memory-to-system-memory blits. The driver should bitwise OR the appropriate DDCKEYCAPS_<i>Xxx</i> flags (see the <b>dwCKeyCaps</b> member) to indicate the types of color key operations it supports when blitting from system memory to system memory.
     * @type {Integer}
     */
    dwSSBCKeyCaps {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * Indicates a set of flags that specify driver FX capabilities for system-memory-to-system-memory blits. The driver should bitwise OR the appropriate DDFXCAPS_<i>Xxx</i> flags (see the <b>dwFXCaps</b> member) to indicate the types of effects it supports when blitting from system memory to system memory.
     * @type {Integer}
     */
    dwSSBFXCaps {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * Specifies an array of DD_ROP_SPACE DWORDs that together can hold flags to indicate the ROPs that the driver supports when performing system-memory-to-system-memory blits. The driver should set the bitfield for every corresponding ROP that it supports. See the Windows SDK documentation for information about ROPs.
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
     * Specifies the maximum number of usable VPE objects.
     * @type {Integer}
     */
    dwMaxVideoPorts {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * Specifies the current number of VPE objects used. The driver does not need to fill in this member because it is set by DirectDraw.
     * @type {Integer}
     */
    dwCurrVideoPorts {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }

    /**
     * Specifies additional driver-specific capabilities for system-memory-to-display-memory blits. Valid flags are identical to the blit-related flags used with the <b>dwCaps2</b> member.
     * @type {Integer}
     */
    dwSVBCaps2 {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }
}
