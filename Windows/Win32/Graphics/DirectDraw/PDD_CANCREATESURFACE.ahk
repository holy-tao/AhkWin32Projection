#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_CANCREATESURFACEDATA.ahk" { DD_CANCREATESURFACEDATA }

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
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_cancreatesurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_CANCREATESURFACE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_CANCREATESURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_CANCREATESURFACEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_cancreatesurfacedata">DD_CANCREATESURFACEDATA</a> structure. This structure contains the information required for the driver to determine whether a command or vertex buffer can be created.
     * @returns {Integer} <b>CanCreateD3DBuffer</b> returns a callback code.
     */
    Call(param0) {
        result := DllCall(this.value, DD_CANCREATESURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_CANCREATESURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_CANCREATESURFACE {
        /**
         * Creates a PDD_CANCREATESURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DD_CANCREATESURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_CANCREATESURFACEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
