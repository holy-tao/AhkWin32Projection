#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDTRANSFERININFO structure contains the transfer information for the surface
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddtransferininfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDTRANSFERININFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that represents the surface that contains the information to be transferred. The information in this structure is supplied by DirectDraw.
     * @type {Pointer<DDSURFACEDATA>}
     */
    lpSurfaceData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates the first line in the surface from which data is transferred.
     * @type {Integer}
     */
    dwStartLine {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Indicates the last line in the surface from which data is transferred, inclusive.
     * @type {Integer}
     */
    dwEndLine {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies an identification for the transfer supplied by DirectDraw. This transfer ID is used by the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgettransferstatusoutinfo">DDGETTRANSFERSTATUSOUTINFO</a> structure.
     * @type {Pointer}
     */
    dwTransferID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates the type of transfer. One of the following: 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDTRANSFER_CANCEL
     * 
     * </td>
     * <td>
     * DirectDraw previously requested a transfer, but is now canceling that request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDTRANSFER_HALFLINES
     * 
     * </td>
     * <td>
     * Due to half line issues, the odd field contains an extra line of useless data at the top that the driver must account for.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDTRANSFER_INVERT
     * 
     * </td>
     * <td>
     * During bus mastering, the capture driver is requesting an inversion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDTRANSFER_NONLOCALVIDMEM
     * 
     * </td>
     * <td>
     * The transfer is from display memory to AGP memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDTRANSFER_SYSTEMMEMORY
     * 
     * </td>
     * <td>
     * The transfer is from display memory to system memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwTransferFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Points to a destination <a href="https://docs.microsoft.com/windows-hardware/drivers/">memory descriptor list (MDL)</a> structure.
     * @type {Pointer<DDMDL>}
     */
    lpDestMDL {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
