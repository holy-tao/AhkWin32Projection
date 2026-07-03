#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The FaxGetPageData function returns to a fax client application the first page of data for a fax job.
 * @remarks
 * A fax client application can call the <b>FaxGetPageData</b> function for administrative purposes, to display a thumbnail sketch of the fax documents in the fax queue.
 * 
 * The fax service creates fax documents as TIFF Class F files based on the Tagged Image File Format (TIFF) 6.0 specification. The <b>FaxGetPageData</b> function returns a TIFF data stream that has a Modified Modified READ (MMR) two-dimensional encoding data compression format. The calling application must decode the data stream. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-image-format">Fax Image Format</a>.
 * 
 * The <b>FaxGetPageData</b> function allocates the memory required for the <i>Buffer</i> parameter. An application must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxfreebuffer">FaxFreeBuffer</a> function to deallocate the resources associated with this parameter.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-displaying-documents-in-the-fax-job-queue">Displaying Documents in the Fax Job Queue</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-freeing-fax-resources">Freeing Fax Resources</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfaxgetpagedata
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXGETPAGEDATA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETPAGEDATA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} JobId Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the fax job associated with the page of data.
     * @param {Pointer<Pointer<Integer>>} _Buffer Type: <b>LPBYTE*</b>
     * 
     * Pointer to the address of a buffer to receive the first page of data in the fax document. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} BufferSize Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the size of the buffer, in bytes, pointed to by the <i>Buffer</i> parameter.
     * @param {Pointer<Integer>} ImageWidth Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the width, in pixels, of the fax image.
     * @param {Pointer<Integer>} ImageHeight Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the height, in pixels, of the fax image.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_QUERY</a> access is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or all of the <i>Buffer</i>, <i>BufferSize</i>, <i>ImageWidth</i>, <i>ImageHeight</i>, or <i>FaxHandle</i> parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid-data error occurred. For example, the fax job identified by the <i>JobId</i> parameter is not an outgoing fax transmission; the job must be specified with the JT_SEND job type.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(FaxHandle, JobId, _Buffer, BufferSize, ImageWidth, ImageHeight) {
        _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        ImageWidthMarshal := ImageWidth is VarRef ? "uint*" : "ptr"
        ImageHeightMarshal := ImageHeight is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, JobId, _BufferMarshal, _Buffer, BufferSizeMarshal, BufferSize, ImageWidthMarshal, ImageWidth, ImageHeightMarshal, ImageHeight, BOOL)
        return result
    }

    /**
     * A PFAXGETPAGEDATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETPAGEDATA {
        /**
         * Creates a PFAXGETPAGEDATA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, "ptr*", "uint*", "uint*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, "ptr*", "uint*", "uint*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
