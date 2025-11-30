#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of completion queue notifications to use with the RIONotify function when sending or receiving data using the Winsock registered I/O extensions.
 * @remarks
 * 
 * The <b>RIO_NOTIFICATION_COMPLETION_TYPE</b> enumeration is used with the Winsock registered I/O extensions to specify the type of I/O completion to use with a <a href="https://docs.microsoft.com/windows/desktop/WinSock/riocqueue">RIO_CQ</a>. An enumeration value is set in the <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ns-mswsock-rio_notification_completion">RIO_NOTIFICATION_COMPLETION</a> structure passed to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function when the <b>RIO_CQ</b> is created. 
 * 
 * When creating a <a href="https://docs.microsoft.com/windows/desktop/WinSock/riocqueue">RIO_CQ</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ns-mswsock-rio_notification_completion">RIO_NOTIFICATION_COMPLETION</a> structure determines how the application will receive completion queue notifications.  If the <b>RIO_NOTIFICATION_COMPLETION</b> structure is provided when creating the completion queue, the application may call the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function to request a completion queue notification.  Normally this notification occurs when the completion queue is not empty.  This may happen immediately or when the next completion entry is inserted into the completion queue.  Once a completion queue notification is issued, the application must call <b>RIONotify</b> in order to receive another completion queue notification.
 * 
 * Two options are available for completion queue notification. <ul>
 * <li>Event handles.</li>
 * <li>I/O completion ports</li>
 * </ul>
 * 
 * 
 * If the <b>Type</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ns-mswsock-rio_notification_completion">RIO_NOTIFICATION_COMPLETION</a> structure is set to <b>RIO_EVENT_COMPLETION</b>, an event handle is used to signal completion queue notifications. An event handle is provided as the <b>EventNotify.EventHandle</b> member in the <b>RIO_NOTIFICATION_COMPLETION</b> structure passed to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function. 
 * 
 * If the <b>Type</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ns-mswsock-rio_notification_completion">RIO_NOTIFICATION_COMPLETION</a> structure is set to <b>RIO_IOCP_COMPLETION</b>,  an I/O completion port is used to signal completion queue notifications. An I/O completion port handle is provided as the <b>Iocp.IocpHandle</b> member in the <b>RIO_NOTIFICATION_COMPLETION</b> structure passed to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function. The completion of the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function for this <a href="https://docs.microsoft.com/windows/desktop/WinSock/riocqueue">RIO_CQ</a> will queue an entry to the I/O completion port which can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> or <a href="https://docs.microsoft.com/windows/desktop/FileIO/getqueuedcompletionstatusex-func">GetQueuedCompletionStatusEx</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mswsock/ne-mswsock-rio_notification_completion_type
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RIO_NOTIFICATION_COMPLETION_TYPE extends Win32Enum{

    /**
     * An event handle is used to signal completion queue notifications. 
     * 
     * An event handle is provided as the <b>EventNotify.EventHandle</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ns-mswsock-rio_notification_completion">RIO_NOTIFICATION_COMPLETION</a> structure passed to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function when the <a href="https://docs.microsoft.com/windows/desktop/WinSock/riocqueue">RIO_CQ</a> is created. The completion of the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function for this <b>RIO_CQ</b> will signal the event.  The  <b>Event.NotifyReset</b> member in the <b>RIO_NOTIFICATION_COMPLETION</b> structure passed to the <b>RIOCreateCompletionQueue</b> function when the <b>RIO_CQ</b> is created indicates whether or not the event should be reset as part of a call to the <b>RIONotify</b> function.
     * @type {Integer (Int32)}
     */
    static RIO_EVENT_COMPLETION => 1

    /**
     * An I/O completion port handle is used to signal completion queue notifications.
     * 
     * An I/O completion port handle is provided as the <b>Iocp.IocpHandle</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ns-mswsock-rio_notification_completion">RIO_NOTIFICATION_COMPLETION</a> structure passed to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function when the <a href="https://docs.microsoft.com/windows/desktop/WinSock/riocqueue">RIO_CQ</a> is created. The completion of the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function for this <b>RIO_CQ</b> will queue an entry to the I/O completion port which can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> or <a href="https://docs.microsoft.com/windows/desktop/FileIO/getqueuedcompletionstatusex-func">GetQueuedCompletionStatusEx</a> function.  The queued entry will have the returned <i>lpCompletionKey</i> parameter value set to the value specified in the <b>Iocp.CompletionKey</b> member of the <b>RIO_NOTIFICATION_COMPLETION</b> and the returned <i>lpOverlapped</i> parameter value set to the value specified in the <b>Iocp.Overlapped</b> member in <b>RIO_NOTIFICATION_COMPLETION</b> structure.  The <b>Iocp.Overlapped</b> member in the <b>RIO_NOTIFICATION_COMPLETION</b> will be a non-NULL value.
     * @type {Integer (Int32)}
     */
    static RIO_IOCP_COMPLETION => 2
}
