#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_FLIPDATA structure contains information needed to do a flip.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_flipdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_FLIPDATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure describing the current surface.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpSurfCurr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the DD_SURFACE_LOCAL structure describing the target surface; that is, the surface to which the driver should flip.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpSurfTarg {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates a set of flags that provide the driver with details for the flip. This member can be a bitwise OR of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_DONOTWAIT
     * 
     * </td>
     * <td>
     * Specifies to return DDERR_WASSTILLDRAWING if the accelerator is busy. The default is DDFLIP_WAIT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_EVEN
     * 
     * </td>
     * <td>
     * The surface to which the <b>lpSurfTarg</b> member points contains only the even field of video data. This flag is valid only when the surface is an overlay, and is mutually exclusive of DDFLIP_ODD.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_ODD
     * 
     * </td>
     * <td>
     * The surface to which the <b>lpSurfTarg</b> member points contains only the odd field of video data. This flag is valid only when the surface is an overlay, and is mutually exclusive of DDFLIP_EVEN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_NOVSYNC
     * 
     * </td>
     * <td>
     * The driver should perform the flip and return immediately. Typically, the current back buffer (which used to be the front buffer) is still visible until the next vertical retrace. Subsequent operations involving the surfaces to which the <b>lpSurfCurr</b> and <b>lpSurfTarg</b> members point do not check to see if the physical flip has finished. This allows an application to perform flips at a higher frequency than the monitor refresh rate, although it might introduce visible artifacts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_INTERVAL2
     * 
     * </td>
     * <td>
     * The driver should perform the flip on every other vertical sync. It should return DDERR_WASSTILLDRAWING until the second vertical retrace has occurred. This flag is mutually exclusive of DDFLIP_INTERVAL3 and DDFLIP_INTERVAL4.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_INTERVAL3
     * 
     * </td>
     * <td>
     * The driver should perform the flip on every third vertical sync. It should return DDERR_WASSTILLDRAWING until the third vertical retrace has occurred. This flag is mutually exclusive of DDFLIP_INTERVAL2 and DDFLIP_INTERVAL4.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_INTERVAL4
     * 
     * </td>
     * <td>
     * The driver should perform the flip on every fourth vertical sync. It should return DDERR_WASSTILLDRAWING until the fourth vertical retrace has occurred. This flag is mutually exclusive of DDFLIP_INTERVAL2 and DDFLIP_INTERVAL3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_STEREO
     * 
     * </td>
     * <td>
     * Specifies to enable stereo autoflipping (the hardware automatically flips between the left and right buffers during each screen refresh).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_WAIT
     * 
     * </td>
     * <td>
     * Specifies to not return until the flip or an error occurs.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    Flip {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure describing the current left surface.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpSurfCurrLeft {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to the DD_SURFACE_LOCAL structure describing the left target surface to flip to.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpSurfTargLeft {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
