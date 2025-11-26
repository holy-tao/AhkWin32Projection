#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides COM servers and applications with the ability to selectively handle incoming and outgoing COM messages while waiting for responses from synchronous calls.
 * @remarks
 * 
 * Synchronous calls require the caller to wait for a reply before continuing. COM enters a modal loop while waiting for the reply. During this time, the caller is still able to receive and dispatch incoming messages. 
 * 
 * 
 * 
 * Asynchronous calls allow the caller to proceed without waiting for a response from the called object. Today, in COM, the only asynchronous calls are to an object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface. While the object is processing an asynchronous call, it is prohibited from making any synchronous calls back to the calling object.
 * 
 * To enable behaviors such as focus management and type-ahead to function correctly, input-synchronized calls require the called object to complete the call before relinquishing control. 
 * 
 * <h3><a id="Application_Shutdown_with_WM_QUERYENDSESSION_and_WM_ENDSESSION_"></a><a id="application_shutdown_with_wm_queryendsession_and_wm_endsession_"></a><a id="APPLICATION_SHUTDOWN_WITH_WM_QUERYENDSESSION_AND_WM_ENDSESSION_"></a>Application Shutdown with WM_QUERYENDSESSION and WM_ENDSESSION
 * </h3>
 * When a user exits Windows, each open application receives a <a href="https://docs.microsoft.com/windows/desktop/Shutdown/wm-queryendsession">WM_QUERYENDSESSION</a> message followed by a <a href="https://docs.microsoft.com/windows/desktop/Shutdown/wm-endsession">WM_ENDSESSION</a> message, provided the exit is not canceled. These messages are invoked with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-ihttpmailtransport-sendmessage">SendMessage</a> function, which unfortunately restricts the initiation of all outgoing LRPC calls. This is a problem for container applications that have open embedded objects when they receive the shutdown request because LRPC is needed to close those objects.
 * 
 * Container and container/server applications with open documents typically display a message box on receipt of the <a href="https://docs.microsoft.com/windows/desktop/Shutdown/wm-queryendsession">WM_QUERYENDSESSION</a> message that asks if the user wants to save changes before exiting. A positive response is usually the default. The recommendation for dealing with the situation described above is for the application to display an alternate message box asking if the user wants to discard changes; a negative response should be the default. If the user chooses to discard the changes, <b>TRUE</b> should be returned for <b>WM_QUERYENDSESSION</b>, which signals to Windows that it can terminate. If the user does not want to discard the changes, <b>FALSE</b> should be returned. No attempt should be made to close or release running embeddings.
 * 
 * Server applications should return <b>TRUE</b> for <a href="https://docs.microsoft.com/windows/desktop/Shutdown/wm-queryendsession">WM_QUERYENDSESSION</a> without prompting the user. On receipt of a <a href="https://docs.microsoft.com/windows/desktop/Shutdown/wm-endsession">WM_ENDSESSION</a> message, all COM applications should execute the normal close sequence for each application's documents and objects. At the same time, you should ignore any errors resulting from any cross-process calls or calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>. All storage pointers (<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface pointers) must be released to properly flush any temporary files maintained by the compound file implementation of structured storage.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-imessagefilter
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMessageFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageFilter
     * @type {Guid}
     */
    static IID => Guid("{00000016-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleInComingCall", "RetryRejectedCall", "MessagePending"]

    /**
     * Provides a single entry point for incoming calls.
     * @param {Integer} dwCallType The type of incoming call that has been received. Possible values are from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-calltype">CALLTYPE</a>.
     * @param {HTASK} htaskCaller The thread id of the caller.
     * @param {Integer} dwTickCount The elapsed tick count since the outgoing call was made, if <i>dwCallType</i> is not CALLTYPE_TOPLEVEL. If <i>dwCallType</i> is CALLTYPE_TOPLEVEL, <i>dwTickCount</i> should be ignored.
     * @param {Pointer<INTERFACEINFO>} lpInterfaceInfo A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-interfaceinfo">INTERFACEINFO</a> structure that identifies the object, interface, and method being called. In the case of DDE calls, <i>lpInterfaceInfo</i> can be <b>NULL</b> because the DDE layer does not return interface information.
     * @returns {Integer} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SERVERCALL_ISHANDLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application might be able to process the call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SERVERCALL_REJECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application cannot handle the call due to an unforeseen problem, such as network unavailability, or if it is in the process of terminating.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SERVERCALL_RETRYLATER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application cannot handle the call at this time. An application might return this value when it is in a user-controlled modal state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imessagefilter-handleincomingcall
     */
    HandleInComingCall(dwCallType, htaskCaller, dwTickCount, lpInterfaceInfo) {
        htaskCaller := htaskCaller is Win32Handle ? NumGet(htaskCaller, "ptr") : htaskCaller

        result := ComCall(3, this, "uint", dwCallType, "ptr", htaskCaller, "uint", dwTickCount, "ptr", lpInterfaceInfo, "uint")
        return result
    }

    /**
     * Provides applications with an opportunity to display a dialog box offering retry, cancel, or task-switching options.
     * @param {HTASK} htaskCallee The thread id of the called application.
     * @param {Integer} dwTickCount The number of elapsed ticks since the call was made.
     * @param {Integer} dwRejectType Specifies either SERVERCALL_REJECTED or SERVERCALL_RETRYLATER, as returned by the object application.
     * @returns {Integer} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call should be canceled. COM then returns RPC_E_CALL_REJECTED from the original method call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0 ≤ <i>value</i> &lt; 100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call is to be retried immediately.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>100 ≤ <i>value</i> </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM will wait for this many milliseconds and then retry the call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imessagefilter-retryrejectedcall
     */
    RetryRejectedCall(htaskCallee, dwTickCount, dwRejectType) {
        htaskCallee := htaskCallee is Win32Handle ? NumGet(htaskCallee, "ptr") : htaskCallee

        result := ComCall(4, this, "ptr", htaskCallee, "uint", dwTickCount, "uint", dwRejectType, "uint")
        return result
    }

    /**
     * Indicates that a message has arrived while COM is waiting to respond to a remote call.
     * @param {HTASK} htaskCallee The thread id of the called application.
     * @param {Integer} dwTickCount The number of ticks since the call was made. It is calculated from the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-gettickcount">GetTickCount</a> function.
     * @param {Integer} dwPendingType The type of call made during which a message or event was received. Possible values are from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-pendingtype">PENDINGTYPE</a>, where PENDINGTYPE_TOPLEVEL means the outgoing call was not nested within a call from another application and PENDINTGYPE_NESTED means the outgoing call was nested within a call from another application.
     * @returns {Integer} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PENDINGMSG_CANCELCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cancel the outgoing call. This should be returned only under extreme conditions. Canceling a call that has not replied or been rejected can create orphan transactions and lose resources. COM fails the original call and returns RPC_E_CALL_CANCELLED.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PENDINGMSG_WAITNOPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PENDINGMSG_WAITDEFPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keyboard and mouse messages are no longer dispatched. However there are some cases where mouse and keyboard messages could cause the system to deadlock, and in these cases, mouse and keyboard messages are discarded. WM_PAINT messages are dispatched. Task-switching and activation messages are handled as before.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imessagefilter-messagepending
     */
    MessagePending(htaskCallee, dwTickCount, dwPendingType) {
        htaskCallee := htaskCallee is Win32Handle ? NumGet(htaskCallee, "ptr") : htaskCallee

        result := ComCall(5, this, "ptr", htaskCallee, "uint", dwTickCount, "uint", dwPendingType, "uint")
        return result
    }
}
