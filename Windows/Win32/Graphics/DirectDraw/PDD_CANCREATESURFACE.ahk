#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The CanCreateD3DBuffer callback function determines whether the driver can create a driver-level command or vertex buffer of the specified description.
 * @remarks
 * This callback is used only if the driver manages driver-level command and vertex buffers.
 * 
 * <b>CanCreateD3DBuffer</b> should check the surface description that the <b>lpDDSurfaceDesc</b> member of the DD_CANCREATESURFACEDATA structure at <b>lpCanCreateD3DBuffer</b> points to in order to determine whether the driver can support the format and capabilities of the requested buffer for the mode that the driver is currently in. The driver should return DD_OK in the <b>ddRVal</b> member of the same structure if it supports that type of buffer. Otherwise, it should return the DDERR_<i>Xxx</i> error code that best describes why it does not support the buffer.
 * 
 * This call has the same prototype as <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549213(v=vs.85)">DdCanCreateSurface</a>. The <b>CanCreateD3DBuffer</b> callback is used, however, when the surface in question has the DDSCAPS_EXECUTEBUFFER flag set in the <b>ddsCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure.
 * 
 * The driver determines the type of buffer being requested by checking the <b>ddsCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure for the following flags:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>
 * DDSCAPS2_COMMANDBUFFER
 * 
 * </td>
 * <td>
 * The driver should allocate a command buffer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * DDSCAPS2_VERTEXBUFFER
 * 
 * </td>
 * <td>
 * The driver should allocate an explicit vertex buffer.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>    If neither flag is set, the driver should allocate an implicit vertex buffer. Implicit vertex buffers should not be placed in video memory since they are expected to be read/write. Only explicit vertex buffers with the DDSCAPS_WRITEONLY flag set can be safely placed in video memory.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_cancreatesurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_CANCREATESURFACE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<DD_CANCREATESURFACEDATA>} param0 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "uint")
        return result
    }
}
