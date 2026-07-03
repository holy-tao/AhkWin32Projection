#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * The FaxInitializeEventQueue function creates a fax event queue for the calling fax client application. The queue enables the application to receive notifications of asynchronous events from the fax server.
 * @remarks
 * An application can specify how the fax server should inform the client application of events. The application can request that the fax server queue I/O completion packets to an I/O completion port, or it can specify notification messages.
 * 
 * A fax client application must call the <b>FaxInitializeEventQueue</b> function before calling <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> to retrieve the value to specify in the <i>CompletionKey</i> parameter. This value is useful to a message loop that retrieves I/O completion packets from multiple I/O completion ports, using calls to the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjects">WaitForMultipleObjects</a> function. If you specify a different completion key for each I/O completion port, you can identify the completion port associated with the completion packet.
 * 
 * An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function to retrieve the queued I/O completion packet for a completed I/O operation. A call to GetQueuedCompletionStatus also returns a pointer to a variable that the function sets to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_eventa">FAX_EVENT</a> structure. The structure is associated with the I/O completion packet of interest. Call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the memory allocated for the <b>FAX_EVENT</b> structure.
 * 
 * After a fax client application receives the <b>FEI_FAXSVC_ENDED</b> message, it will no longer receive fax events from the fax service. To resume receiving fax events, the application must call the <b>FaxInitializeEventQueue</b> function again when the fax service restarts. The application can determine if the fax service is running by using the service control manager. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxclose">FaxClose</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-enabling-an-application-to-receive-notifications-of-fax-events">Enabling an Application to Receive Notifications of Fax Events</a>.
 * 
 * For a list of the asynchronous events that can occur within the fax server, see the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_eventa">FAX_EVENT</a> topic.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfaxinitializeeventqueue
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXINITIALIZEEVENTQUEUE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXINITIALIZEEVENTQUEUE) {
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
     * @param {HANDLE} CompletionPort Type: <b>HANDLE</b>
     * 
     * Specifies a valid handle to an I/O completion port returned by a call to the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function. This parameter is required for notification using I/O completion packets. This parameter must be <b>NULL</b> if you specify notification messages. 
     * 
     *                     
     * 
     * For information about I/O completion ports, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/i-o-completion-ports">I/O Completion Ports</a>.
     * @param {Pointer} CompletionKey Type: <b>ULONG_PTR</b>
     * 
     * Specifies a variable that contains a completion key value the fax server includes in each I/O completion packet. This parameter is required for notification using I/O completion packets. This parameter must be <b>NULL</b> if you specify notification messages. For more information, see the following Remarks section.
     * @param {HWND} _hWnd Type: <b>HWND</b>
     * 
     * Handle to a window of the fax client application to notify when an asynchronous event occurs. This parameter is required for notification messages. This parameter must be <b>NULL</b> if you specify notification using I/O completion packets.
     * @param {Integer} MessageStart Type: <b>UINT</b>
     * 
     * Specifies an unsigned integer that identifies the application's base window message. The application can use this number to determine whether to process the message as a fax server event. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_eventa">FAX_EVENT</a> topic. 
     * 
     *                     
     * 
     * This parameter is required for notification messages. This parameter must be equal to zero if you specify notification using I/O completion packets.
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
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Both the <i>hWnd</i> and <i>CompletionPort</i> parameters are <b>NULL</b>, or both parameters are specified.
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
     * The <i>FaxHandle</i> parameter is <b>NULL</b>; or the <i>hWnd</i> parameter is specified but the <i>FaxHandle</i> parameter does not specify a connection with a local fax server; or the <i>MessageStart</i> parameter specifies a message in the range below <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-user">WM_USER</a>.
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
     * The application called the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxinitializeeventqueue">FaxInitializeEventQueue</a> function more than once during a fax service session in Windows 2000. More than one call is supported in Windows XP and Windows Server 2003.
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
     * </table>
     */
    Call(FaxHandle, CompletionPort, CompletionKey, _hWnd, MessageStart) {
        result := DllCall(this.value, HANDLE, FaxHandle, HANDLE, CompletionPort, IntPtr, CompletionKey, HWND, _hWnd, UInt32, MessageStart, BOOL)
        return result
    }

    /**
     * A PFAXINITIALIZEEVENTQUEUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXINITIALIZEEVENTQUEUE {
        /**
         * Creates a PFAXINITIALIZEEVENTQUEUE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, IntPtr, HWND, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, IntPtr, HWND, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
