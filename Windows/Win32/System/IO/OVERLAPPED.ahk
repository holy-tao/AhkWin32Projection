#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information used in asynchronous (or overlapped) input and output (I/O).
 * @remarks
 * 
  * Any unused members of this structure should always be initialized to zero before the structure is used in a function call.  Otherwise, the function may fail and return <b>ERROR_INVALID_PARAMETER</b>.
  * 
  * The <b>Offset</b> and <b>OffsetHigh</b> members together represent a 64-bit file position. It is a byte offset from the start of the file or file-like device, and it is specified by the user; the system will not modify these values. The calling process must set this member before passing the <b>OVERLAPPED</b> structure to functions that use an offset, such as the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> or 
  * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a> (and related) functions.  
  * 
  * You can use the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-hasoverlappediocompleted">HasOverlappedIoCompleted</a> macro to check whether an asynchronous I/O operation has completed if <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> is too cumbersome for your application. 
  * 
  * You can use the 
  * <a href="https://docs.microsoft.com/windows/desktop/FileIO/cancelio">CancelIo</a> function to cancel an asynchronous I/O operation.
  * 
  * A common mistake is to reuse an <b>OVERLAPPED</b> structure before the previous asynchronous operation has been completed. You should use a separate structure for each request. You should also create an event object for each thread that processes data. If you store the event handles in an array, you could easily wait for all events to be signaled using the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjects">WaitForMultipleObjects</a> function.
  * 
  * For additional information and potential pitfalls of asynchronous I/O usage, see  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a>, and related functions.
  * 
  * For a general synchronization overview and conceptual <b>OVERLAPPED</b> usage information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a> and related topics.
  * 
  * For a file I/O–oriented overview of synchronous and asynchronous I/O, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/synchronous-and-asynchronous-i-o">Synchronous and Asynchronous I/O</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ns-minwinbase-overlapped
 * @namespace Windows.Win32.System.IO
 * @version v4.0.30319
 */
class OVERLAPPED extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The status code for the I/O request. When the request is issued, the system sets this member to <b>STATUS_PENDING</b> to indicate that the operation has not yet started.  When the request is completed, the system sets this member to the status code for the completed request. 
     * 
     * The <b>Internal</b> member was originally reserved for system use and its behavior may change.
     * @type {Pointer}
     */
    Internal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of bytes transferred for the I/O request. The system sets this member if the request is completed without errors. 
     * 
     * The <b>InternalHigh</b> member was originally reserved for system use and its behavior may change.
     * @type {Pointer}
     */
    InternalHigh {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    OffsetHigh {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Void>}
     */
    Pointer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A handle to the event that will be set to a signaled state by the system when the operation has completed. The user must initialize this member either to zero or a valid event handle using the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function before passing this structure to any overlapped functions. This event can then be used to synchronize simultaneous I/O requests for a device. For additional information, see Remarks.
     * 
     * Functions such as <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefile">WriteFile</a> set this handle to the nonsignaled state before they begin an I/O operation. When the operation has completed, the handle is set to the signaled state.
     * 
     *  
     * 
     * 
     * Functions such as <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> and the synchronization <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a> reset auto-reset events to the nonsignaled state. Therefore, you should use a manual reset event; if you use an auto-reset event, your application can stop responding if you wait for the operation to complete and then call <b>GetOverlappedResult</b> with the <i>bWait</i> parameter set to <b>TRUE</b>.
     * @type {HANDLE}
     */
    hEvent{
        get {
            if(!this.HasProp("__hEvent"))
                this.__hEvent := HANDLE(24, this)
            return this.__hEvent
        }
    }
}
