#Requires AutoHotkey v2.0.0 64-bit

/**
 * Returned by the CopyFile2ProgressRoutine callback function to indicate what action should be taken for the pending copy operation.
 * @remarks
 * 
 * To compile an application that uses this enumeration, define the <b>_WIN32_WINNT</b> 
 *     macro as 0x0601 or later. For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ne-winbase-copyfile2_message_action
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class COPYFILE2_MESSAGE_ACTION{

    /**
     * Continue the copy operation.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_PROGRESS_CONTINUE => 0

    /**
     * Cancel the copy operation. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfile2">CopyFile2</a> call will fail 
     *       and return <c>HRESULT_FROM_WIN32(ERROR_REQUEST_ABORTED)</c> and 
     *       any partially copied fragments will be deleted.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_PROGRESS_CANCEL => 1

    /**
     * Stop the copy operation. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfile2">CopyFile2</a> call will fail 
     *       and return <c>HRESULT_FROM_WIN32(ERROR_REQUEST_ABORTED)</c> and 
     *       any partially copied fragments will be left intact. The operation can be restarted using the 
     *       <b>COPY_FILE_RESUME_FROM_PAUSE</b> flag only if the 
     *       <b>COPY_FILE_RESTARTABLE</b> flag was set in the <b>dwCopyFlags</b> 
     *       member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-copyfile2_extended_parameters">COPYFILE2_EXTENDED_PARAMETERS</a> structure 
     *       passed to the <b>CopyFile2</b> function.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_PROGRESS_STOP => 2

    /**
     * Continue the copy operation but do not call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nc-winbase-pcopyfile2_progress_routine">CopyFile2ProgressRoutine</a> callback function 
     *       again for this operation.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_PROGRESS_QUIET => 3

    /**
     * Pause the copy operation and write a restart header. This value is not compatible with the 
     *       <b>COPY_FILE_RESTARTABLE</b> flag  for the <b>dwCopyFlags</b> member of 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-copyfile2_extended_parameters">COPYFILE2_EXTENDED_PARAMETERS</a> 
     *       structure. In most cases the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-copyfile2">CopyFile2</a> call will fail and 
     *       return <c>HRESULT_FROM_WIN32(ERROR_REQUEST_PAUSED)</c> and any 
     *       partially copied fragments will be left intact (except for the header written that is used to resume the copy 
     *       operation later.) In case the copy operation was complete at the time the pause request is processed the 
     *       <b>CopyFile2</b> call will complete successfully and no resume 
     *       header will be written. After this value is processed one more callback will be made to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nc-winbase-pcopyfile2_progress_routine">CopyFile2ProgressRoutine</a> with the message 
     *       specifying a <b>COPYFILE2_CALLBACK_STREAM_FINISHED</b> (4) value in the 
     *       <b>Type</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-copyfile2_message">COPYFILE2_MESSAGE</a> structure. After the callback has 
     *       returned CopyFile2 will fail with 
     *       <c>HRESULT_FROM_WIN32(ERROR_REQUEST_PAUSED)</c>.
     * @type {Integer (Int32)}
     */
    static COPYFILE2_PROGRESS_PAUSE => 4
}
