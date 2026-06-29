#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WSMAN_OPERATION_INFO.ahk" { WSMAN_OPERATION_INFO }
#Import ".\WSMAN_SENDER_DETAILS.ahk" { WSMAN_SENDER_DETAILS }

/**
 * Specifies information for a plug-in request.
 * @remarks
 * Operations must signal the callback for the operation to indicate it has been shut down. Operations are canceled in a hierarchical way to ensure that all follow-on operations are canceled before the top-level operations. A plug-in has two ways of handling the cancellation of an operation.   First, the plug-in can check the <b>shutdownNotification</b> Boolean value
 * if it iterates through a set of results.  Second, if the plug-in is more 
 * asynchronous in nature, the <b>shutdownNotificationHandle</b> can be used when queuing asynchronous notification threads.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_plugin_request
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_PLUGIN_REQUEST {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that specifies details about the client that initiated the request.
     */
    senderDetails : WSMAN_SENDER_DETAILS.Ptr

    /**
     * Specifies the locale that the user requested results to be in.  If the requested locale is not available, the following options are available:
     * 
     * <ul>
     * <li>The system locale is used.</li>
     * <li>The request is rejected with an invalid locale error.</li>
     * </ul>
     * Any call into the plug-in will have the locale on the thread set to the  locale that is specified in this member.  If the plug-in has other threads working on the request, the plug-in will need to set the locale accordingly on each thread that it uses.
     */
    locale : PWSTR

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">resource URI</a> for this operation.
     */
    resourceUri : PWSTR

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_operation_info">WSMAN_OPERATION_INFO</a> structure that contains extra information about the operation.  Some of the information in this structure will be <b>NULL</b> because not all of the parameters are relevant to all operations.
     */
    operationInfo : WSMAN_OPERATION_INFO.Ptr

    /**
     * If the operation is canceled, the <b>shutdownNotification</b> member is set to <b>TRUE</b>.
     */
    shutdownNotification : BOOL

    /**
     * If the operation is canceled, <b>shutdownNotification</b> is signaled.
     */
    shutdownNotificationHandle : HANDLE

    dataLocale : PWSTR

}
