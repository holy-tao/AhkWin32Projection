#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A fax client application calls the FaxAbort function to terminate a fax job.
 * @remarks
 * An application typically calls the <b>FaxAbort</b> function to terminate a fax transmission that is in progress. To manage a queued fax job, an application typically calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetjoba">FaxSetJob</a> function. <b>FaxSetJob</b> can cancel an active job; the function can also pause, resume, cancel, or restart a queued fax job.
 * 
 * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumjobsa">FaxEnumJobs</a> function to retrieve a valid value to use in the <i>JobId</i> parameter.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-modifying-a-fax-job">Modifying a Fax Job</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-terminating-a-fax-job">Terminating a Fax Job</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfaxabort
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXABORT {
    value : IntPtr

    __value {
        set {
            if (value is PFAXABORT) {
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
     * Specifies a unique number that identifies the fax job to terminate.
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
     * Access is denied. You must own the job, or have <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_MANAGE</a> access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FaxHandle</i> parameter is invalid.
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
     * The <i>JobId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(FaxHandle, JobId) {
        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, JobId, BOOL)
        return result
    }

    /**
     * A PFAXABORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXABORT {
        /**
         * Creates a PFAXABORT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
