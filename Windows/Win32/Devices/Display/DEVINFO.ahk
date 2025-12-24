#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\LOGFONTW.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk

/**
 * The DEVINFO structure provides information about the driver and its private PDEV to the graphics engine.
 * @remarks
 * The driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenablepdev">DrvEnablePDEV</a> function fills in a DEVINFO structure; the driver should set only the members that are relevant to it. This structure is zero-initialized by GDI before <b>DrvEnablePDEV</b> is called. Applications do not have direct access to this structure.
 * 
 * If a driver sets GCAPS2_JPEGSRC or GCAPS2_PNGSRC in <b>flGraphicsCaps2</b>, the following rules apply:
 * 
 * <ul>
 * <li>
 * The driver must provide a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvquerydevicesupport">DrvQueryDeviceSupport</a> function.
 * 
 * </li>
 * <li>
 * Every driver-defined graphics DDI function that receives a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure as input must be able to either support the compressed format or return an error code. In the case of printer drivers, to support the compressed format, the driver must be able to perform either one of the following tasks:
 * 
 * 
 * <ul>
 * <li>If the print device can process the JPEG/PNG compressed format, the printer driver should pass the compressed format through to its page description language (PDL) output.</li>
 * <li>If the print device cannot process the JPEG/PNG compressed format, the printer driver must first convert the compressed JPEG/PNG format into another image format that the print device can process. The printer driver can then make the image information available in the driver's PDL output.
 * <div class="alert"><b>Note</b>  In the case of converting from JPEG/PNG to the bitmap format, the printer driver must not use GDI functions. For example, the driver can use the Windows Imaging Component (WIC)  APIs instead to do the conversion.</div>
 * <div> </div>
 * 
 * 
 * </li>
 * </ul>
 * 
 * 
 * </li>
 * <li>
 * The driver must be able to handle complex clip regions for images that use the compressed format.
 * 
 * </li>
 * <li>
 * For driver-defined graphics DDI functions that receive a ROP4 input argument, only 0xCCCC is used with JPEG and PNG formats.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-devinfo
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DEVINFO extends Win32Struct
{
    static sizeof => 312

    static packingSize => 8

    /**
     * Is a set of flags that describe graphics capabilities of the graphics driver and/or its hardware. These flags are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_ALTERNATEFILL
     * 
     * </td>
     * <td>
     * Handles alternating fills.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_ARBRUSHOPAQUE
     * 
     * </td>
     * <td>
     * Supports an arbitrary brush for text opaque rectangle (background color).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_ARBRUSHTEXT
     * 
     * </td>
     * <td>
     * Supports an arbitrary brush for the text foreground color.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_ASYNCCHANGE
     * 
     * </td>
     * <td>
     * This flag is obsolete. In legacy drivers, this flag indicates that the driver can change the pointer shape in hardware while other drawing is occurring on the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_ASYNCMOVE
     * 
     * </td>
     * <td>
     * The driver can move the pointer in hardware while other drawing is occurring on the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_BEZIERS
     * 
     * </td>
     * <td>
     * Handles Bezier curves.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_CMYKCOLOR
     * 
     * </td>
     * <td>
     * The driver supports the CYMK color space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_COLOR_DITHER
     * 
     * </td>
     * <td>
     * Handles color dithering to a PDEV-compatible surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_DIRECTDRAW
     * 
     * </td>
     * <td>
     * This flag is obsolete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_DITHERONREALIZE
     * 
     * </td>
     * <td>
     * Specifies that GDI can call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvrealizebrush">DrvRealizeBrush</a> with the RGB to be dithered directly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_DONTJOURNAL
     * 
     * </td>
     * <td>
     * Disallows metafile printing to this printer driver. This is valid only for printer DCs and will generally result in slower return-to-application time when printing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_FONT_RASTERIZER
     * 
     * </td>
     * <td>
     * Device hardware can rasterize TrueType fonts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_FORCEDITHER
     * 
     * </td>
     * <td>
     * Allows dithering on all geometric pens.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_GEOMETRICWIDE
     * 
     * </td>
     * <td>
     * Handles geometric widening.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_GRAY16
     * 
     * </td>
     * <td>
     * Handles antialiased text natively.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_HALFTONE
     * 
     * </td>
     * <td>
     * Handles halftoning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_HIGHRESTEXT
     * 
     * </td>
     * <td>
     * This flag is obsolete. In legacy drivers, this flag indicates that the driver is requesting glyph positions as returned by the STROBJ in FIX point coordinates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_HORIZSTRIKE
     * 
     * </td>
     * <td>
     * This flag is obsolete. In legacy drivers, this flag indicates that the driver handles horizontal strikeouts in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_ICM
     * 
     * </td>
     * <td>
     * Indicates that color management operations can be performed by the driver or printer hardware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_LAYERED
     * 
     * </td>
     * <td>
     * Indicates that this is a layer or <a href="https://docs.microsoft.com/windows-hardware/drivers/">mirror driver</a> for remoting. Printer drivers cannot be layer drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_MONO_DITHER
     * 
     * </td>
     * <td>
     * Handles monochrome dithering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_NO64BITMEMACCESS
     * 
     * </td>
     * <td>
     * This flag is obsolete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_NUP
     * 
     * </td>
     * <td>
     * Indicates that "N-up" printing is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_OPAQUERECT
     * 
     * </td>
     * <td>
     * Handles opaque rectangles in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_PALMANAGED
     * 
     * </td>
     * <td>
     * Supports palette management.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_PANNING
     * 
     * </td>
     * <td>
     * When GDI is simulating the pointer, it should call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvmovepointer">DrvMovePointer</a> to notify the driver of the current cursor position. This allows the driver to handle panning virtual displays.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_SCREENPRECISION
     * 
     * </td>
     * <td>
     * The rasterizer (font engine) should choose a screen (soft) font over a device font when choosing a font for which there is no exact match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_VECTORFONT
     * 
     * </td>
     * <td>
     * Handles stroking of vector fonts in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_VERTSTRIKE
     * 
     * </td>
     * <td>
     * This flag is obsolete. In legacy drivers, this flag indicated that the driver handled vertical strikeouts in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS_WINDINGFILL
     * 
     * </td>
     * <td>
     * Handles winding mode fills. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/path-fill-modes">Path Fill Modes</a> for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_REMOTEDRIVER
     * 
     * </td>
     * <td>
     * Indicates that the display driver is used to support a remote user session.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flGraphicsCaps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Is an Extended Logical Font structure that specifies the default font for a device. For more information about this structure, see EXTLOGFONT in the Microsoft Windows SDK documentation.
     * @type {LOGFONTW}
     */
    lfDefaultFont{
        get {
            if(!this.HasProp("__lfDefaultFont"))
                this.__lfDefaultFont := LOGFONTW(4, this)
            return this.__lfDefaultFont
        }
    }

    /**
     * Is an Extended Logical Font structure that specifies the default variable-pitch font for a device. For more information about this structure, see EXTLOGFONT in the Windows SDK documentation.
     * @type {LOGFONTW}
     */
    lfAnsiVarFont{
        get {
            if(!this.HasProp("__lfAnsiVarFont"))
                this.__lfAnsiVarFont := LOGFONTW(96, this)
            return this.__lfAnsiVarFont
        }
    }

    /**
     * Is an Extended Logical Font structure that specifies the default fixed-pitch (monospaced) font for a device. For more information about this structure, see EXTLOGFONT in the Windows SDK documentation.
     * @type {LOGFONTW}
     */
    lfAnsiFixFont{
        get {
            if(!this.HasProp("__lfAnsiFixFont"))
                this.__lfAnsiFixFont := LOGFONTW(188, this)
            return this.__lfAnsiFixFont
        }
    }

    /**
     * Specifies the number of device fonts. GDI assumes that the device can draw text with this number of fonts on its own surfaces and that the driver can provide metrics information about the fonts. If the driver sets <b>cFonts</b> to -1, GDI will wait until fonts are needed to query the driver for the actual number of fonts it supports in a call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvqueryfont">DrvQueryFont</a>.
     * @type {Integer}
     */
    cFonts {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * 
     * @type {Integer}
     */
    iDitherFormat {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * 
     * @type {Integer}
     */
    cxDither {
        get => NumGet(this, 288, "ushort")
        set => NumPut("ushort", value, this, 288)
    }

    /**
     * Specify the dimensions of a dithered brush. If these members are nonzero, then the device can create a dithered brush for a given RGB color.
     * @type {Integer}
     */
    cyDither {
        get => NumGet(this, 290, "ushort")
        set => NumPut("ushort", value, this, 290)
    }

    /**
     * Handle to the default palette for the device. The driver should create the palette by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatepalette">EngCreatePalette</a>. The driver associates a palette with a device by returning this handle to GDI.
     * @type {HPALETTE}
     */
    hpalDefault{
        get {
            if(!this.HasProp("__hpalDefault"))
                this.__hpalDefault := HPALETTE(296, this)
            return this.__hpalDefault
        }
    }

    /**
     * Is a set of flags that describe additional graphics capabilities of the device driver. These flags are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_ALPHACURSOR
     * 
     * </td>
     * <td>
     * Handles pointers with per-pixel alpha values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_CHANGEGAMMARAMP
     * 
     * </td>
     * <td>
     * The display device has a loadable hardware <a href="https://docs.microsoft.com/windows-hardware/drivers/">gamma ramp</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_EXCLUDELAYERED
     * 
     * </td>
     * <td>
     * Indicates that this is an accessibility mirror driver. Mirror drivers that do not set this flag will still receive drawing primitives for layered HWNDs. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/mirror-drivers">Mirror Drivers</a> for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_ICD_MULTIMON
     * 
     * </td>
     * <td>
     * Informs GDI that the driver intends to handle <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvsetpixelformat">DrvSetPixelFormat</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvdescribepixelformat">DrvDescribePixelFormat</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvswapbuffers">DrvSwapBuffers</a> calls in a multimon environment, even when the rectangle in the operation also intersects another device. Only one device is ever given the opportunity to handle those calls. If the capability is not specified and the region involved intersects more than one device, no driver is called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_INCLUDEAPIBITMAPS
     * 
     * </td>
     * <td>
     * When drawing calls are made to a device-independent bitmap (DIB), an accessibility mirror driver will be called. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/mirror-drivers">Mirror Drivers</a> for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_JPEGSRC
     * 
     * </td>
     * <td>
     * Device can accept JPEG compressed images (that is, images for which BMF_JPEG is set in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_MOUSETRAILS
     * 
     * </td>
     * <td>
     * Indicates that the driver supports mouse trails (a succession of cursor images showing the mouse's location during a short period of time). The driver is capable of handling the values GDI sends in the <i>fl</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvsetpointershape">DrvSetPointerShape</a> function. The driver should use the SPS_LENGTHMASK and SPS_FREQMASK masks to obtain values for the length and frequency of the mouse trails. See <b>DrvSetPointerShape</b> for more information about these masks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_PNGSRC
     * 
     * </td>
     * <td>
     * Device can accept PNG compressed images (that is, images for which BMF_PNG is set in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_SYNCFLUSH
     * 
     * </td>
     * <td>
     * The driver supports a programmatic-based flush mechanism for batched graphics DDI calls. <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvsynchronizesurface">DrvSynchronizeSurface</a> will be called whenever GDI must flush any drawing that is being batched by the driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * GCAPS2_SYNCTIMER
     * 
     * </td>
     * <td>
     * The driver supports a timer-based flush mechanism for batched graphics DDI calls. <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvsynchronizesurface">DrvSynchronizeSurface</a> will be called periodically, based on a timer interval determined by GDI.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flGraphicsCaps2 {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }
}
