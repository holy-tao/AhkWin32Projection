#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDMDL.ahk" { DDMDL }
#Import ".\DDSURFACEDATA.ahk" { DDSURFACEDATA }

/**
 * The DDTRANSFERININFO structure contains the transfer information for the surface
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddtransferininfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDTRANSFERININFO {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that represents the surface that contains the information to be transferred. The information in this structure is supplied by DirectDraw.
     */
    lpSurfaceData : DDSURFACEDATA.Ptr

    /**
     * Indicates the first line in the surface from which data is transferred.
     */
    dwStartLine : UInt32

    /**
     * Indicates the last line in the surface from which data is transferred, inclusive.
     */
    dwEndLine : UInt32

    /**
     * Specifies an identification for the transfer supplied by DirectDraw. This transfer ID is used by the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddgettransferstatusoutinfo">DDGETTRANSFERSTATUSOUTINFO</a> structure.
     */
    dwTransferID : IntPtr

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
     */
    dwTransferFlags : UInt32

    /**
     * Points to a destination <a href="https://docs.microsoft.com/windows-hardware/drivers/">memory descriptor list (MDL)</a> structure.
     */
    lpDestMDL : DDMDL.Ptr

}
