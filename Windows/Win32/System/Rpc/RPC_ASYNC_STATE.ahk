#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RPC_ASYNC_EVENT.ahk" { RPC_ASYNC_EVENT }
#Import "..\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\RPC_NOTIFICATION_TYPES.ahk" { RPC_NOTIFICATION_TYPES }
#Import ".\RPC_ASYNC_NOTIFICATION_INFO.ahk" { RPC_ASYNC_NOTIFICATION_INFO }

/**
 * The RPC_ASYNC_STATE structure holds the state of an asynchronous remote procedure call. RPC_ASYNC_STATE is a handle to this structure, used to wait for, query, reply to, or cancel asynchronous calls.
 * @remarks
 * The client allocates space for the 
 * <b>RPC_ASYNC_STATE</b> structure and an associated handle, and calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcasyncinitializehandle">RpcAsyncInitializeHandle</a> to initialize the structure. After the run-time environment has successfully initialized the structure, the client initializes the <b>NotificationType</b>, and exactly one of the following structures in the <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_notification_info">RPC_ASYNC_NOTIFICATION_INFO</a> union: <b>APC</b> for a Windows asynchronous procedure call, <b>IOC</b> for an I/O completion port, <b>HWND</b> for a Windows system message, or <b>hEvent</b> for a Windows event. If the chosen notification method is <b>RpcNotificationTypeNone</b>, no field of the union needs to be initialized. The RPC client may optionally initialize the <b>UserInfo</b> field as well.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_async_state
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_ASYNC_STATE {
    #StructPack 8

    /**
     * Size of this structure, in bytes. The environment sets this member when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcasyncinitializehandle">RpcAsyncInitializeHandle</a> is called. Do not modify this member.
     */
    Size : UInt32

    /**
     * The run-time environment sets this member when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcasyncinitializehandle">RpcAsyncInitializeHandle</a> is called. Do not modify this member.
     */
    Signature : UInt32

    /**
     * The run-time environment sets this member when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/nf-rpcasync-rpcasyncinitializehandle">RpcAsyncInitializeHandle</a> is called. Do not modify this member.
     */
    Lock : Int32

    /**
     * The <b>flags</b> member can be set to the following values. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_NOTIFY_ON_SEND_COMPLETE"></a><a id="rpc_c_notify_on_send_complete"></a><dl>
     * <dt><b>RPC_C_NOTIFY_ON_SEND_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Posts a notification message when the asynchronous operation is complete.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * These flags are used with DCE pipes, which allow applications to send or receive data in multiple blocks. Programs can either send a continuous stream of data or wait for each block to be transmitted before it sends the next block. If it does not wait, the RPC run-time library will buffer the output until it can be sent. When the data transmission is complete, the RPC library sends the application a notification. If an application specifies the RPC_C_NOTIFY_ON_SEND_COMPLETE flag, the RPC library sends it a member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ne-rpcasync-rpc_notification_types">RPC_NOTIFICATION_TYPES</a> enumeration after it completes each send operation.
     */
    Flags : UInt32

    /**
     * Reserved for use by the stubs. Do not use this member.
     */
    StubInfo : IntPtr

    /**
     * Use this member for any application-specific information that you want to keep track of in this structure.
     */
    UserInfo : IntPtr

    /**
     * Reserved for use by the RPC run-time environment. Do not use this member.
     */
    RuntimeInfo : IntPtr

    /**
     * Type of event that occurred. The RPC run-time environment sets this field to a member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ne-rpcasync-rpc_async_event">RPC_ASYNC_EVENT</a> enumeration.
     */
    Event : RPC_ASYNC_EVENT

    /**
     * Type of notification the RPC run time should use to notify the client for the occurrence of an event, such as completion of the call or completion of the event.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcNotificationTypeNone"></a><a id="rpcnotificationtypenone"></a><a id="RPCNOTIFICATIONTYPENONE"></a><dl>
     * <dt><b>RpcNotificationTypeNone</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No notification is specified; <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_notification_info">RPC_ASYNC_NOTIFICATION_INFO</a> is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcNotificationTypeEvent"></a><a id="rpcnotificationtypeevent"></a><a id="RPCNOTIFICATIONTYPEEVENT"></a><dl>
     * <dt><b>RpcNotificationTypeEvent</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification mechanism is a Windows event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcNotificationTypeApc"></a><a id="rpcnotificationtypeapc"></a><a id="RPCNOTIFICATIONTYPEAPC"></a><dl>
     * <dt><b>RpcNotificationTypeApc</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification mechanism is a Windows asynchronous procedure call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcNotificationTypeIoc"></a><a id="rpcnotificationtypeioc"></a><a id="RPCNOTIFICATIONTYPEIOC"></a><dl>
     * <dt><b>RpcNotificationTypeIoc</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification mechanism is an I/O completion port.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcNotificationTypeHwnd"></a><a id="rpcnotificationtypehwnd"></a><a id="RPCNOTIFICATIONTYPEHWND"></a><dl>
     * <dt><b>RpcNotificationTypeHwnd</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification mechanism is a Windows system message.
     * 
     * <b>Windows Server 2003 or later:  </b>Notification via the HWND is deprecated. Do not use this value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RpcNotificationTypeCallback"></a><a id="rpcnotificationtypecallback"></a><a id="RPCNOTIFICATIONTYPECALLBACK"></a><dl>
     * <dt><b>RpcNotificationTypeCallback</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification mechanism is a function callback.
     * 
     * </td>
     * </tr>
     * </table>
     */
    NotificationType : RPC_NOTIFICATION_TYPES

    /**
     * Contains asynchronous notification information formatted for the mechanism type specified in <b>NotificationType</b>. 
     * 
     * <div class="alert"><b>Note</b>  Previous to Windows Vista, this member contained the specific syntax of the union currently specified by the <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_notification_info">RPC_ASYNC_NOTIFICATION_INFO</a> union.</div>
     * <div> </div>
     */
    u : RPC_ASYNC_NOTIFICATION_INFO

    /**
     * Reserved for compatibility with future versions, if any. Do not use this member.
     */
    Reserved : IntPtr[4]

}
