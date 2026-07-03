#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\COPYPROGRESSROUTINE_PROGRESS.ahk" { COPYPROGRESSROUTINE_PROGRESS }
#Import ".\LPPROGRESS_ROUTINE_CALLBACK_REASON.ahk" { LPPROGRESS_ROUTINE_CALLBACK_REASON }

/**
 * An application-defined callback function used with the CopyFileEx, MoveFileTransacted, and MoveFileWithProgress functions.
 * @remarks
 * An application can use this information to display a progress bar that shows the total number of bytes copied 
 *     as a percent of the total file size.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-lpprogress_routine
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct LPPROGRESS_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is LPPROGRESS_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} TotalFileSize The total size of the file, in bytes.
     * @param {Integer} TotalBytesTransferred The total number of bytes transferred from the source file to the destination file since the copy operation 
     *       began.
     * @param {Integer} StreamSize The total size of the current file stream, in bytes.
     * @param {Integer} StreamBytesTransferred The total number of bytes in the current stream that have been transferred from the source file to the 
     *       destination file since the copy operation began.
     * @param {Integer} dwStreamNumber A handle to the current stream. The first time 
     *       <b>CopyProgressRoutine</b> is called, the stream number 
     *       is 1.
     * @param {LPPROGRESS_ROUTINE_CALLBACK_REASON} dwCallbackReason The reason that <b>CopyProgressRoutine</b> was
     * @param {HANDLE} hSourceFile A handle to the source file.
     * @param {HANDLE} hDestinationFile A handle to the destination file
     * @param {Pointer<Void>} lpData Argument passed to <b>CopyProgressRoutine</b> by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfileexa">CopyFileEx</a>, 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-movefiletransacteda">MoveFileTransacted</a>, or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-movefilewithprogressa">MoveFileWithProgress</a>.
     * @returns {COPYPROGRESSROUTINE_PROGRESS} The <b>CopyProgressRoutine</b> function should return 
     *        one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PROGRESS_CANCEL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cancel the copy operation and delete the destination file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PROGRESS_CONTINUE</b></dt>
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
     * <dt><b>PROGRESS_QUIET</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Continue the copy operation, but stop invoking 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nc-winbase-lpprogress_routine">CopyProgressRoutine</a> to report progress.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PROGRESS_STOP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stop the copy operation. It can be restarted at a later time.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(TotalFileSize, TotalBytesTransferred, StreamSize, StreamBytesTransferred, dwStreamNumber, dwCallbackReason, hSourceFile, hDestinationFile, lpData) {
        lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int64, TotalFileSize, Int64, TotalBytesTransferred, Int64, StreamSize, Int64, StreamBytesTransferred, UInt32, dwStreamNumber, LPPROGRESS_ROUTINE_CALLBACK_REASON, dwCallbackReason, HANDLE, hSourceFile, HANDLE, hDestinationFile, lpDataMarshal, lpData, COPYPROGRESSROUTINE_PROGRESS)
        return result
    }

    /**
     * A LPPROGRESS_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPPROGRESS_ROUTINE {
        /**
         * Creates a LPPROGRESS_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(Int64, Int64, Int64, Int64, UInt32, LPPROGRESS_ROUTINE_CALLBACK_REASON, HANDLE, HANDLE, "ptr") => COPYPROGRESSROUTINE_PROGRESS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, Int64, Int64, Int64, UInt32, LPPROGRESS_ROUTINE_CALLBACK_REASON, HANDLE, HANDLE, "ptr", COPYPROGRESSROUTINE_PROGRESS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
