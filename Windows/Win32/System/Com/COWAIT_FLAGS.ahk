#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the behavior of the CoWaitForMultipleHandles function.
 * @see https://docs.microsoft.com/windows/win32/api//combaseapi/ne-combaseapi-cowait_flags
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class COWAIT_FLAGS{

    /**
     * Dispatch calls needed for marshaling without dispatching arbitrary calls.
     * @type {Integer (Int32)}
     */
    static COWAIT_DEFAULT => 0

    /**
     * If set, the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> will return S_OK only when all handles associated with the synchronization object have been signaled and an input event has been received, all at the same time.  In this case, the behavior of <b>CoWaitForMultipleHandles</b> corresponds to  the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjectsex">MsgWaitForMultipleObjectsEx</a> function with the <i>dwFlags</i> parameter set to <b>MWMO_WAITALL</b>. If <b>COWAIT_WAITALL</b> is not set, the call to <b>CoWaitForMultipleHandles</b> will return S_OK as soon as any handle associated with the synchronization object has been signaled, regardless of whether an input event is received.
     * @type {Integer (Int32)}
     */
    static COWAIT_WAITALL => 1

    /**
     * If set, the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> will return S_OK if an asynchronous procedure call (APC) has been queued to the calling thread with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a> function, even if no handle has been signaled.
     * @type {Integer (Int32)}
     */
    static COWAIT_ALERTABLE => 2

    /**
     * If set, the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> will return S_OK  if input exists for the queue, even if the input has been seen (but not removed) using a call to another function, such as <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a>.
     * @type {Integer (Int32)}
     */
    static COWAIT_INPUTAVAILABLE => 4

    /**
     * Dispatch calls from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> in an ASTA. Default is no call dispatch. This value has no meaning in other apartment types and is ignored.
     * @type {Integer (Int32)}
     */
    static COWAIT_DISPATCH_CALLS => 8

    /**
     * Enables dispatch of window messages from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> in an ASTA or STA. Default in ASTA is no window messages dispatched, default in STA is only a small set of special-cased messages dispatched. The value has no meaning in MTA and is ignored.
     * @type {Integer (Int32)}
     */
    static COWAIT_DISPATCH_WINDOW_MESSAGES => 16
}
