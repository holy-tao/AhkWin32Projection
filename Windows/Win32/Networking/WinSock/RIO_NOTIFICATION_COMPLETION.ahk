#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Specifies the method for I/O completion to be used with a RIONotify function for sending or receiving network data with the Winsock registered I/O extensions.
 * @remarks
 * 
  * The <b>RIO_NOTIFICATION_COMPLETION</b> structure is used to specify the behavior of the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function used with the Winsock registered I/O extensions. 
  * 
  * The <b>RIO_NOTIFICATION_COMPLETION</b> structure is passed to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function when a  <a href="https://docs.microsoft.com/windows/desktop/WinSock/riocqueue">RIO_CQ</a> is created. If an application does not call the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function for a completion queue, the completion queue can be created without a <b>RIO_NOTIFICATION_COMPLETION</b> object.
  * 
  * For completion queues using an event, the <b>Type</b> member of the <b>RIO_NOTIFICATION_COMPLETION</b> structure is set to <b>RIO_EVENT_COMPLETION</b>. The <b>Event.EventHandle</b> member of the <b>RIO_NOTIFICATION_COMPLETION</b> structure should contain the handle for an event created by the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsacreateevent">WSACreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function.  To receive the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> completion, the application should wait on the specified event handle using <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsawaitformultipleevents">WSAWaitForMultipleEvents</a> or a similar wait routine.  If the application plans to reset and reuse the event, the application can reduce overhead by setting the <b>Event.NotifyReset</b> member of the <b>RIO_NOTIFICATION_COMPLETION</b> structure to a non-zero value. This causes the event to be reset by the <b>RIONotify</b> function when notification occurs. This mitigates the need to call the <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaresetevent">WSAResetEvent</a> function to reset the event between calls to the <b>RIONotify</b> function.  
  * 
  * For completion queues using an I/O completion port, the <b>Type</b> member  of the <b>RIO_NOTIFICATION_COMPLETION</b> structure is set to <b>RIO_IOCP_COMPLETION</b>. The <b>Iocp.IocpHandle</b> member  of the <b>RIO_NOTIFICATION_COMPLETION</b> structure should contain the handle for an I/O completion port created by the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function.  To receive the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> completion, the application should call the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> or <a href="https://docs.microsoft.com/windows/desktop/FileIO/getqueuedcompletionstatusex-func">GetQueuedCompletionStatusEx</a> function.  The application should provide a dedicated <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> object for the completion queue, and it may also use the <b>Iocp.CompletionKey</b> member to distinguish <b>RIONotify</b> requests on the completion queue from other I/O completions including <b>RIONotify</b> completions for other completion queues.
  * 
  * 
  * 
  * An application using thread pools can use thread pool wait objects to get <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> completions via its thread pool.  In that case, the call to the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait">SetThreadpoolWait</a> function should immediately follow the call to <b>RIONotify</b>.  If the <b>SetThreadpoolWait</b> function is called before <b>RIONotify</b> and the application relies on <b>RIONotify</b> to clear the event object, this may result in spurious executions of the wait object callback.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mswsock/ns-mswsock-rio_notification_completion
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RIO_NOTIFICATION_COMPLETION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The type of completion to use with the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function when sending or receiving data.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Event extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        EventHandle{
            get {
                if(!this.HasProp("__EventHandle"))
                    this.__EventHandle := HANDLE(this.ptr + 0)
                return this.__EventHandle
            }
        }
    
        /**
         * @type {BOOL}
         */
        NotifyReset{
            get {
                if(!this.HasProp("__NotifyReset"))
                    this.__NotifyReset := BOOL(this.ptr + 8)
                return this.__NotifyReset
            }
        }
    
    }

    class _Iocp extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        IocpHandle{
            get {
                if(!this.HasProp("__IocpHandle"))
                    this.__IocpHandle := HANDLE(this.ptr + 0)
                return this.__IocpHandle
            }
        }
    
        /**
         * @type {Pointer<Void>}
         */
        CompletionKey {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        Overlapped {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    /**
     * @type {_Event}
     */
    Event{
        get {
            if(!this.HasProp("__Event"))
                this.__Event := %this.__Class%._Event(this.ptr + 8)
            return this.__Event
        }
    }

    /**
     * @type {_Iocp}
     */
    Iocp{
        get {
            if(!this.HasProp("__Iocp"))
                this.__Iocp := %this.__Class%._Iocp(this.ptr + 8)
            return this.__Iocp
        }
    }
}
