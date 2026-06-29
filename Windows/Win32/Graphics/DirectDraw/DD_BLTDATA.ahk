#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDBLTFX.ahk" { DDBLTFX }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DDARGB.ahk" { DDARGB }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_BLTDATA structure contains the information relevant to the driver for doing bit block transfers.
 * @remarks
 * For more information about the DDBLT_PRESENTATION and DDBLT_LAST_PRESENTATION flags, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/presentation">Presentation</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_bltdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_BLTDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that describes the surface on which to blit.
     */
    lpDDDestSurface : DD_SURFACE_LOCAL.Ptr

    rDest : RECTL

    /**
     * Points to a DD_SURFACE_LOCAL structure that describes the source surface.
     */
    lpDDSrcSurface : DD_SURFACE_LOCAL.Ptr

    rSrc : RECTL

    /**
     * Indicates a set of flags that specify the type of blit operation to perform and what associated structure members have valid data that the driver should use. This member is a bitwise OR of any of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_ASYNC
     * 
     * </td>
     * <td>
     * Perform this blit asynchronously through the FIFO in the order received. If no room exists in the hardware FIFO, the driver should fail the call and return immediately.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_COLORFILL
     * 
     * </td>
     * <td>
     * Use the <b>dwFillColor</b> member in the DDBLTFX structure (defined in the Microsoft DirectDraw SDK documentation) as the RGB color with which to fill the destination rectangle on the destination surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_DDFX
     * 
     * </td>
     * <td>
     * Use the <b>dwDDFX</b> member in the DDBLTFX structure (defined in the DirectDraw SDK documentation) to determine the effects to use for the blit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_DDROPS
     * 
     * </td>
     * <td>
     * This flag is reserved for system use and should be ignored by the driver. The driver should also ignore the <b>dwDDROPS</b> member of the DDBLTFX structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_EXTENDED_FLAGS
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt><b>Microsoft DirectX 9.0 and later versions only.</b></dt>
     * <dt>Set by the runtime to direct the driver to reinterpret certain flags in <b>dwFlags</b> from their meanings in DirectX 8.1 and earlier versions. The runtime combines DDBLT_EXTENDED_FLAGS with DDBLT_<i>Xxx</i> flags using a bitwise OR to create DDBLT_EXTENDED_<i>Xxx</i> flags.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_EXTENDED_LINEAR_CONTENT
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt><b>Microsoft DirectX 9.0 and later versions only.</b></dt>
     * <dt>Created through the bitwise OR combination of DDBLT_EXTENDED_FLAGS and the 0x00000004 bit.</dt>
     * <dt>Indicates that the source surface contains content in a linear color space. The driver can then perform gamma 2.2 correction (sRGB) to the desktop color space as part of the blt.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_EXTENDED_PRESENTATION_STRETCHFACTOR
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt><b>Microsoft DirectX 9.0 and later versions only.</b></dt>
     * <dt><b>NT-based operating systems only.</b></dt>
     * <dt>Created through the bitwise OR combination of DDBLT_EXTENDED_FLAGS and the 0x00000010 bit. </dt>
     * <dt>Set if the runtime subsequently uses the DDBLT_PRESENTATION and DDBLT_LAST_PRESENTATION flags to request a series of stretch-blit operations because of a <b>Present</b> call by an application.</dt>
     * <dt>Notifies the driver about the entire unclipped source and destination rectangular areas before the driver receives actual sub-rectangular areas for blits. In this way, the driver can calculate and record the stretch factor for all subsequent blits up to and including the blit with the DDBLT_LAST_PRESENTATION flag set. However, when the driver receives a blit with the DDBLT_EXTENDED_PRESENTATION_STRETCHFACTOR flag set, the driver must not use these unclipped rectangular areas to do any actual blitting.</dt>
     * <dt>After the driver finishes the final blit with the DDBLT_LAST_PRESENTATION flag set, the driver should clear the stretch-factor record to prevent interference with any subsequent blits</dt>
     * </dl> .
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_KEYDESTOVERRIDE
     * 
     * </td>
     * <td>
     * Use the <b>dckDestColorkey</b> member in the DDBLTFX structure (defined in the DirectDraw SDK documentation) as the color key for the destination surface. If an override is not being set, then <b>dckDestColorkey</b> does not contain the color key. The driver should test the surface itself.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_KEYSRCOVERRIDE
     * 
     * </td>
     * <td>
     * Use the <b>dckSrcColorkey</b> member in the DDBLTFX structure (defined in the DirectDraw SDK documentation) as the color key for the source surface. If an override is not being set, then <b>dckDestColorkey</b> does not contain the color key. The driver should test the surface itself.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_LAST_PRESENTATION
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt><b>DirectX 8.0 and later versions only.</b></dt>
     * <dt>Set if the runtime requests a final blit operation because of a <b>Present</b> call by an application.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_PRESENTATION
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt><b>DirectX 8.0 and later versions only.</b></dt>
     * <dt>Set if the runtime requests a blit operation because of a <b>Present</b> call by an application.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_ROP
     * 
     * </td>
     * <td>
     * Use the <b>dwROP</b> member in the DDBLTFX structure (defined in the DirectDraw SDK documentation) for the raster operation for this blit. Currently, the only <a href="https://docs.microsoft.com/windows-hardware/drivers/">ROP</a> passed to the driver is SRCCOPY. This ROP is the same as that defined in the Win32 API. See the Microsoft Windows SDK documentation for details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_ROTATIONANGLE
     * 
     * </td>
     * <td>
     * This flag is not supported on Windows 2000 and later and should be ignored by the driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDBLT_WAIT
     * 
     * </td>
     * <td>
     * Do not return immediately with the DDERR_WASSTILLDRAWING message if the blitter is busy--wait until the blit can be set up or another error occurs.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Unused on Windows 2000 and later and should be ignored by the driver.
     */
    dwROPFlags : UInt32

    bltFX : DDBLTFX

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_blt">DdBlt</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    Blt : IntPtr

    /**
     * Indicates whether this is a clipped blit. On Windows 2000 and later, this member is always <b>FALSE</b>, indicating that the blit is unclipped.
     */
    IsClipped : BOOL

    /**
     * <b>Unused for Windows 2000 and later.</b> Specifies a RECTL structure that defines the unclipped destination rectangle. This member is valid only if <b>IsClipped</b> is <b>TRUE</b>.
     */
    rOrigDest : RECTL

    /**
     * <b>Unused for Windows 2000 and later.</b> Specifies a RECTL structure that defines the unclipped source rectangle. This member is valid only if <b>IsClipped</b> is <b>TRUE</b>.
     */
    rOrigSrc : RECTL

    /**
     * <b>Unused for Windows 2000 and later.</b>Specifies the number of destination rectangles to which <b>prDestRects</b> points. This member is valid only if <b>IsClipped</b> is <b>TRUE</b>.
     */
    dwRectCnt : UInt32

    /**
     * <b>Unused for Windows 2000 and later.</b> Points to an array of RECTL structures that describe of destination rectangles. This member is valid only if <b>IsClipped</b> is <b>TRUE</b>.
     */
    prDestRects : RECT.Ptr

    /**
     * Unused and should be ignored by the driver.
     */
    dwAFlags : UInt32

    /**
     * ARGB scaling factors (AlphaBlt)
     */
    ddargbScaleFactors : DDARGB

}
