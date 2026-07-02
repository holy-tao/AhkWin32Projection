#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COPYFILE2_MESSAGE.ahk" { COPYFILE2_MESSAGE }
#Import ".\COPYFILE2_MESSAGE_ACTION.ahk" { COPYFILE2_MESSAGE_ACTION }

/**
 * An application-defined callback function used with the CopyFile2 function.
 * @remarks
 * The <b>COPYFILE2_CALLBACK_STREAM_FINISHED</b> message is the last message for a paused 
 *     copy. If <b>COPYFILE2_PROGRESS_PAUSE</b> is returned in response to a 
 *     <b>COPYFILE2_CALLBACK_STREAM_FINISHED</b> message then no further callbacks will be sent.
 * 
 * To compile an application that uses the <b>PCOPYFILE2_PROGRESS_ROUTINE</b> 
 *     function pointer type, define the <b>_WIN32_WINNT</b> macro as 0x0601 or later. For more 
 *     information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
 * 
 * <table>
 * <tr>
 * <th>Technology</th>
 * <th>Supported</th>
 * </tr>
 * <tr>
 * <td>
 * Server Message Block (SMB) 3.0 protocol
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SMB 3.0 Transparent Failover (TFO)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SMB 3.0 with Scale-out File Shares (SO)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Cluster Shared Volume File System (CsvFS)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Resilient File System (ReFS)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pcopyfile2_progress_routine
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct PCOPYFILE2_PROGRESS_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PCOPYFILE2_PROGRESS_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<COPYFILE2_MESSAGE>} pMessage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-copyfile2_message">COPYFILE2_MESSAGE</a> structure.
     * @param {Pointer<Void>} pvCallbackContext Copy of value passed in the <b>pvCallbackContext</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-copyfile2_extended_parameters">COPYFILE2_EXTENDED_PARAMETERS</a> structure 
     *       passed to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfile2">CopyFile2</a>.
     * @returns {COPYFILE2_MESSAGE_ACTION} Value from the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ne-winbase-copyfile2_message_action">COPYFILE2_MESSAGE_ACTION</a> 
     *       enumeration indicating what action should be taken.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYFILE2_PROGRESS_CONTINUE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Continue the copy operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYFILE2_PROGRESS_CANCEL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cancel the copy operation. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfile2">CopyFile2</a> function 
     *         will fail, return 
     *         <c>HRESULT_FROM_WIN32(ERROR_REQUEST_ABORTED)</c> and any 
     *         partially copied fragments will be deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYFILE2_PROGRESS_STOP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stop the copy operation. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfile2">CopyFile2</a> function will 
     *         fail, return <c>HRESULT_FROM_WIN32(ERROR_REQUEST_ABORTED)</c> 
     *         and any partially copied fragments will be left intact. The operation can be restarted using the 
     *         <b>COPY_FILE_RESUME_FROM_PAUSE</b> flag only if 
     *         <b>COPY_FILE_RESTARTABLE</b> was set in the <b>dwCopyFlags</b> member 
     *         of the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-copyfile2_extended_parameters">COPYFILE2_EXTENDED_PARAMETERS</a> 
     *         structure passed to the <b>CopyFile2</b> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYFILE2_PROGRESS_QUIET</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Continue the copy operation but do not call the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nc-winbase-pcopyfile2_progress_routine">CopyFile2ProgressRoutine</a> callback function 
     *         again for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COPYFILE2_PROGRESS_PAUSE</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pause the copy operation. In most cases the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfile2">CopyFile2</a> 
     *         function will fail and return 
     *         <c>HRESULT_FROM_WIN32(ERROR_REQUEST_PAUSED)</c> and any 
     *         partially copied fragments will be left intact (except for the header written that is used to resume the copy 
     *         operation later.) In case the copy operation was complete at the time the pause request is processed the 
     *         <b>CopyFile2</b> call will complete successfully and no resume 
     *         header will be written.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pMessage, pvCallbackContext) {
        pvCallbackContextMarshal := pvCallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, COPYFILE2_MESSAGE.Ptr, pMessage, pvCallbackContextMarshal, pvCallbackContext, COPYFILE2_MESSAGE_ACTION)
        return result
    }

    /**
     * A PCOPYFILE2_PROGRESS_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCOPYFILE2_PROGRESS_ROUTINE {
        /**
         * Creates a PCOPYFILE2_PROGRESS_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(COPYFILE2_MESSAGE, "ptr") => COPYFILE2_MESSAGE_ACTION} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [COPYFILE2_MESSAGE.Ptr, "ptr", COPYFILE2_MESSAGE_ACTION])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
