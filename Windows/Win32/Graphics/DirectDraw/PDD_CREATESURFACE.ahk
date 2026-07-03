#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_CREATESURFACEDATA.ahk" { DD_CREATESURFACEDATA }

/**
 * The CreateD3DBuffer callback function is used to create a driver-level command or vertex buffer of the specified description.
 * @remarks
 * This callback is used only if the driver manages driver-level command and vertex buffers.
 * 
 * By default, the driver is not notified when a primary surface is created on Windows 2000 and later versions. However, if the driver supports the GUID_NTPrivateDriverCaps GUID in a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> call and the DDHAL_PRIVATECAP_NOTIFYPRIMARYCREATION flag is set in the <b>dwPrivateCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_ntprivatedrivercaps">DD_NTPRIVATEDRIVERCAPS</a> structure, then the driver is notified.
 * 
 * The pitch must be returned in the <b>lPitch</b> member of both the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_global">DD_SURFACE_GLOBAL</a> and <a href="https://docs.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc">DDSURFACEDESC</a> structures. For linear memory, the driver should set <b>dwBlockSizeX</b> to the size, in bytes, of the memory region and set <b>dwBlockSizeY</b> to 1. Both are members of the DD_SURFACE_GLOBAL structure.
 * 
 * This call has the same prototype as <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549263(v=vs.85)">DdCreateSurface</a>. The <i>CreateD3DBuffer</i> callback is used instead when the surface in question has the DDSCAPS_EXECUTEBUFFER flag set in the <b>ddsCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure. The buffer creation flags are DDSCAPS_WRITEONLY, DDSCAPS2_VERTEXBUFFER and DDSCAPS2_COMMANDBUFFER. 
 * 
 * The driver determines the type of buffer being requested by checking the <b>ddsCaps</b> member of the DD_SURFACE_LOCAL structure for the following flags:
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
 * <div class="alert"><b>Note</b>    If neither flag is set, the driver should allocate an implicit vertex buffer. Implicit vertex buffers should not be placed in video memory because they are expected to be read/write. Only explicit vertex buffers with the DDSCAPS_WRITEONLY flag set can be safely placed in video memory.</div>
 * <div> </div>
 * The driver can allocate the buffer memory itself or it can request that Microsoft DirectDraw perform the memory management. If the driver performs the allocation, it must write a valid pointer to the memory in the <b>fpVidMem</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_global">DD_SURFACE_GLOBAL</a>  structure.
 * 
 * Alternatively, the driver can request that DirectDraw allocate the buffer by returning one of the following values in <b>fpVidMem</b>:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>
 * DDHAL_PLEASEALLOC_BLOCKSIZE
 * 
 * </td>
 * <td>
 * DirectDraw should allocate the buffer memory from offscreen memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * DDHAL_PLEASEALLOC_USERMEM
 * 
 * </td>
 * <td>
 * DirectDraw should allocate the buffer memory from user memory. The driver must also return the size, in bytes, of the memory region in <b>dwUserMemSize</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_createsurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_CREATESURFACE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_CREATESURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_CREATESURFACEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_createsurfacedata">DD_CREATESURFACEDATA</a> structure that contains the information required to create the buffer.
     * @returns {Integer} <i>CreateD3DBuffer</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_CREATESURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_CREATESURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_CREATESURFACE {
        /**
         * Creates a PDD_CREATESURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DD_CREATESURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_CREATESURFACEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
