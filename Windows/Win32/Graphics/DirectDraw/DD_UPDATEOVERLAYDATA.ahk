#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\DDCOLORKEY.ahk
#Include .\DDOVERLAYFX.ahk

/**
 * The DD_UPDATEOVERLAYDATA structure contains information necessary for updating an overlay surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_updateoverlaydata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_UPDATEOVERLAYDATA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that represents the Microsoft DirectDraw surface to be overlaid. This value can be <b>NULL</b> if DDOVER_HIDE is specified in <b>dwFlags</b>.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDDestSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that contains the x, y, width, and height of the region on the destination surface to be overlaid.
     * @type {RECTL}
     */
    rDest{
        get {
            if(!this.HasProp("__rDest"))
                this.__rDest := RECTL(this.ptr + 16)
            return this.__rDest
        }
    }

    /**
     * Points to a DD_SURFACE_LOCAL structure that describes the overlay surface.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDSrcSurface {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies a RECTL structure that contains the x, y, width, and height of the region on the source surface to be used for the overlay.
     * @type {RECTL}
     */
    rSrc{
        get {
            if(!this.HasProp("__rSrc"))
                this.__rSrc := RECTL(this.ptr + 40)
            return this.__rSrc
        }
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies a DDOVERLAYFX structure (described in the DirectDraw SDK documentation) that describes additional effects that the driver should use to update the overlay. The driver should use this structure only if one of DDOVER_DDFX, DDOVER_KEYDESTOVERRIDE, or DDOVER_KEYSRCOVERRIDE are set in the <b>dwFlags</b> member.
     * @type {DDOVERLAYFX}
     */
    overlayFX{
        get {
            if(!this.HasProp("__overlayFX"))
                this.__overlayFX := DDOVERLAYFX(this.ptr + 64)
            return this.__overlayFX
        }
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_updateoverlay">DdUpdateOverlay</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    UpdateOverlay {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
