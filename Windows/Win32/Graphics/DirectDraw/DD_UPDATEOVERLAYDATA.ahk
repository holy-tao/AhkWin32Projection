#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDOVERLAYFX.ahk" { DDOVERLAYFX }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_UPDATEOVERLAYDATA structure contains information necessary for updating an overlay surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_updateoverlaydata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_UPDATEOVERLAYDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that represents the Microsoft DirectDraw surface to be overlaid. This value can be <b>NULL</b> if DDOVER_HIDE is specified in <b>dwFlags</b>.
     */
    lpDDDestSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that contains the x, y, width, and height of the region on the destination surface to be overlaid.
     */
    rDest : RECTL

    /**
     * Points to a DD_SURFACE_LOCAL structure that describes the overlay surface.
     */
    lpDDSrcSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies a RECTL structure that contains the x, y, width, and height of the region on the source surface to be used for the overlay.
     */
    rSrc : RECTL

    /**
     * Specifies how the driver should handle the overlay. This member can be a combination of any of the following flags: 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_ADDDIRTYRECT
     * 
     * </td>
     * <td>
     * Should be ignored by the driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_AUTOFLIP
     * 
     * </td>
     * <td>
     * The driver should autoflip the overlay whenever the hardware video port autoflips. Drivers that support <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> need only check this flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_BOB
     * 
     * </td>
     * <td>
     * The driver should display each field of VPE object data individually without causing any jittery artifacts. This flag pertains to both VPE and decoders that want to do their own flipping in kernel mode using the kernel-mode video transport functionality.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_BOBHARDWARE
     * 
     * </td>
     * <td>
     * Indicates that bob is performed by hardware rather than by software or emulation. Drivers that support VPE need only check this flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_DDFX
     * 
     * </td>
     * <td>
     * The driver should show the overlay surface using the attributes specified by the <b>overlayFX</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_HIDE
     * 
     * </td>
     * <td>
     * The driver should hide the overlay; that is, the driver should turn this overlay off.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_INTERLEAVED
     * 
     * </td>
     * <td>
     * The overlay surface is composed of interleaved fields. Drivers that support VPE need only check this flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_KEYDEST
     * 
     * </td>
     * <td>
     * The driver should use the color key associated with the destination surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_KEYDESTOVERRIDE
     * 
     * </td>
     * <td>
     * The driver should use the <b>dckDestColorKey</b> member of the DDOVERLAYFX structure (described in the DirectDraw SDK documentation) as the destination color key instead of the color key associated with the destination surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_KEYSRC
     * 
     * </td>
     * <td>
     * The driver should use the color key associated with the destination surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_KEYSRCOVERRIDE
     * 
     * </td>
     * <td>
     * The driver should use the <b>dckSrcColorKey</b> member of the DDOVERLAYFX structure (described in the DirectDraw SDK documentation) as the source color key instead of the color key associated with the destination surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_OVERRIDEBOBWEAVE
     * 
     * </td>
     * <td>
     * Bob/weave decisions should not be overridden by other interfaces. If the overlay mixer sets this flag, DirectDraw does not allow a kernel-mode driver to use the kernel-mode video transport functionality to switch the hardware between bob and weave mode. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_REFRESHALL
     * 
     * </td>
     * <td>
     * Should be ignored by the driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_REFRESHDIRTYRECTS
     * 
     * </td>
     * <td>
     * Should be ignored by the driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDOVER_SHOW
     * 
     * </td>
     * <td>
     * The driver should show the overlay; that is, the driver should turn this overlay on.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Specifies a DDOVERLAYFX structure (described in the DirectDraw SDK documentation) that describes additional effects that the driver should use to update the overlay. The driver should use this structure only if one of DDOVER_DDFX, DDOVER_KEYDESTOVERRIDE, or DDOVER_KEYSRCOVERRIDE are set in the <b>dwFlags</b> member.
     */
    overlayFX : DDOVERLAYFX

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_updateoverlay">DdUpdateOverlay</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    UpdateOverlay : IntPtr

}
