#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDVIDEOPORTDATA structure is used by DirectDraw to represent a video port extensions (VPE) object to the kernel-mode video miniport driver.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddvideoportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDVIDEOPORTDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Specifies the ID of this hardware video port, an integer in the range (0 - (maximum number of hardware video ports - 1)).
     * @type {Integer}
     */
    dwVideoPortId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates a set of flags that specify the current user mode DDVP_<i>Xxx</i> flags set by <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a>. This member can be a bitwise OR of any of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDVP_AUTOFLIP
     * 
     * </td>
     * <td>
     * Perform automatic flipping. Autoflipping is performed between the overlay surface that was attached to the hardware video port using the application's <b>AttachSurface</b> method, and the overlay surfaces that are attached to the surface using the application's <b>AttachSurface</b> method. The flip order is the order in which the overlay surfaces were attached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_CONVERT
     * 
     * </td>
     * <td>
     * Perform the conversion using the target surface format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_CROP
     * 
     * </td>
     * <td>
     * Perform cropping using the specified rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_HARDWAREDEINTERLACE
     * 
     * </td>
     * <td>
     * The hardware video port should use the deinterlacing hardware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_IGNOREVBIXCROP
     * 
     * </td>
     * <td>
     * The video data should ignore the left and right cropping coordinates when cropping the <a href="https://docs.microsoft.com/windows-hardware/drivers/">vertical blanking interval (VBI)</a> data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_INTERLEAVE
     * 
     * </td>
     * <td>
     * Interlaced fields should be interleaved in memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_MIRRORLEFTRIGHT
     * 
     * </td>
     * <td>
     * The data should be mirrored left to right as it is written into the frame buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_MIRRORUPDOWN
     * 
     * </td>
     * <td>
     * The data should be mirrored top to bottom as it is written into the frame buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_OVERRIDEBOBWEAVE
     * 
     * </td>
     * <td>
     * These bob and weave decisions should not be overridden by other interfaces. If this flag is set, DirectDraw does not allow a kernel-mode driver to use the kernel-mode video transport functionality to switch the hardware between bob and weave modes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_PRESCALE
     * 
     * </td>
     * <td>
     * Perform prescaling/zooming based on the prescale parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_SKIPEVENFIELDS
     * 
     * </td>
     * <td>
     * Ignore input of even fields.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_SKIPODDFIELDS
     * 
     * </td>
     * <td>
     * Ignore input of odd fields.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_SYNCMASTER
     * 
     * </td>
     * <td>
     * Drive the graphics V-syncs using the hardware video port V-syncs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_VBICONVERT
     * 
     * </td>
     * <td>
     * The <b>lpddpfVBIOutputFormat</b> member contains data that should be used to convert the data within the vertical blanking interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_VBINOINTERLEAVE
     * 
     * </td>
     * <td>
     * Interleaving can be disabled for data within the vertical blanking interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVP_VBINOSCALE
     * 
     * </td>
     * <td>
     * Data within the vertical blanking interval should not be scaled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwVPFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the byte offset of the VPE object relative to the start of the surface. This value is used only by the miniport driver.
     * @type {Integer}
     */
    dwOriginOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the height in pixels of the VPE object data. This value is used only by the miniport driver.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the height in scan lines of the VBI data. This value is used only by the miniport driver.
     * @type {Integer}
     */
    dwVBIHeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved for use by the miniport driver.
     * @type {Integer}
     */
    dwDriverReserved1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved for use by the miniport driver.
     * @type {Integer}
     */
    dwDriverReserved2 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for use by the miniport driver.
     * @type {Integer}
     */
    dwDriverReserved3 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
