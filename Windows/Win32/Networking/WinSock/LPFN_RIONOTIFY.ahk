#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers the method to use for notification behavior with an I/O completion queue for use with the Winsock registered I/O extensions.
 * @remarks
 * The **RIONotify** function registers the method to be used for notification behavior for sending or receiving network data with the Winsock registered I/O extensions.
 * 
 * The **RIONotify** function is the mechanism by which an application finds out that requests are completed and are awaiting a call to the [**RIODequeueCompletion**](./nc-mswsock-lpfn_riodequeuecompletion.md) function. The **RIONotify** function sets the method to be used for notification behavior when an I/O completion queue is not empty and contains the completion of a result.
 * 
 * The notification behavior for a completion queue is set when the [**RIO\_CQ**](/windows/win32/winsock/riocqueue) is created. The [**RIO\_NOTIFICATION\_COMPLETION**](./ns-mswsock-rio_notification_completion.md) structure is passed to the [**RIOCreateCompletionQueue**](./nc-mswsock-lpfn_riocreatecompletionqueue.md) function when a **RIO\_CQ** is created.
 * 
 * For a completion queue that uses an event, the **Type** member of the [**RIO\_NOTIFICATION\_COMPLETION**](./ns-mswsock-rio_notification_completion.md) structure is set to **RIO\_EVENT\_COMPLETION**. The **Event.EventHandle** member should contain the handle for an event created by the [**WSACreateEvent**](../winsock2/nf-winsock2-wsacreateevent.md) or [**CreateEvent**](../synchapi/nf-synchapi-createeventa.md) function. To receive the **RIONotify** completion, the application should wait on the specified event handle using [**WSAWaitForMultipleEvents**](../winsock2/nf-winsock2-wsawaitformultipleevents.md) or a similar wait routine. If the application plans to reset and reuse the event, the application can reduce overhead by setting the **Event.NotifyReset** member to a non-zero value. This causes the event to be automatically reset by the **RIONotify** function when the notification occurs. This mitigates the need to call the [**WSAResetEvent**](../winsock2/nf-winsock2-wsaresetevent.md) function to reset the event between calls to the **RIONotify** function.
 * 
 * When the **RIONotify** function is called used event completion and the specified completion queue is already not empty, the event is set either synchronously or asynchronously. In both cases, additional entries do not need to enter the completion queue before the event is set. Until the completion queue contains the completion of a request that did not have the **RIO\_MSG\_DONT\_NOTIFY** flag set, the completion queue is considered empty for the purposes of the **RIONotify** function and the event is not set. Any completed requests can still be retrieved using the [**RIODequeueCompletion**](./nc-mswsock-lpfn_riodequeuecompletion.md) function. When the event is set, the application typically calls the **RIODequeueCompletion** function to dequeue the completed send and receive requests.
 * 
 * For a completion queue that uses an I/O completion port, the **Type** member of the [**RIO\_NOTIFICATION\_COMPLETION**](./ns-mswsock-rio_notification_completion.md) structure is set to **RIO\_IOCP\_COMPLETION**. The **Iocp.IocpHandle** member should contain the handle for an I/O completion port created by the [**CreateIoCompletionPort**](/windows/win32/fileio/createiocompletionport) function. To receive the **RIONotify** completion, the application should call the [**GetQueuedCompletionStatus**](../ioapiset/nf-ioapiset-getqueuedcompletionstatus.md) or [**GetQueuedCompletionStatusEx**](../ioapiset/nf-ioapiset-getqueuedcompletionstatusex.md) function. The application should provide a dedicated [**OVERLAPPED**](../minwinbase/ns-minwinbase-overlapped.md) object for the completion queue, and it may also use the **Iocp.CompletionKey** member to distinguish **RIONotify** requests on the completion queue from other I/O completions including **RIONotify** completions for other completion queues.
 * 
 * An application using thread pools can use thread pool wait objects to get **RIONotify** completions via its thread pool. In that case, the call to the [**SetThreadpoolWait**](../threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait.md) function should immediately follow the call to **RIONotify**. If the **SetThreadpoolWait** function is called before **RIONotify** and the application relies on **RIONotify** to clear the event object, this may result in spurious executions of the wait object callback.
 * 
 * > [!Note]  
 * > The function pointer to the **RIONotify** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_rionotify
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIONOTIFY extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {RIO_CQ} CQ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CQ) {
        CQ := CQ is Win32Handle ? NumGet(CQ, "ptr") : CQ

        result := ComCall(3, this, "ptr", CQ, "int")
        return result
    }
}
