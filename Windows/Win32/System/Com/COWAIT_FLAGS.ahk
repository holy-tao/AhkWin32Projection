#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the behavior of the CoWaitForMultipleHandles function.
 * @see https://learn.microsoft.com/windows/win32/api/combaseapi/ne-combaseapi-cowait_flags
 * @namespace Windows.Win32.System.Com
 */
class COWAIT_FLAGS extends Win32BitflagEnum {

    /**
     * Dispatch calls needed for marshaling without dispatching arbitrary calls.
     * Native name: COWAIT_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * If set, the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> will return S_OK only when all handles associated with the synchronization object have been signaled and an input event has been received, all at the same time.  In this case, the behavior of <b>CoWaitForMultipleHandles</b> corresponds to  the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjectsex">MsgWaitForMultipleObjectsEx</a> function with the <i>dwFlags</i> parameter set to <b>MWMO_WAITALL</b>. If <b>COWAIT_WAITALL</b> is not set, the call to <b>CoWaitForMultipleHandles</b> will return S_OK as soon as any handle associated with the synchronization object has been signaled, regardless of whether an input event is received.
     * Native name: COWAIT_WAITALL
     * @type {Integer (Int32)}
     */
    static WAITALL => 1

    /**
     * If set, the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> will return S_OK if an asynchronous procedure call (APC) has been queued to the calling thread with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a> function, even if no handle has been signaled.
     * Native name: COWAIT_ALERTABLE
     * @type {Integer (Int32)}
     */
    static ALERTABLE => 2

    /**
     * If set, the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> will return S_OK  if input exists for the queue, even if the input has been seen (but not removed) using a call to another function, such as <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a>.
     * Native name: COWAIT_INPUTAVAILABLE
     * @type {Integer (Int32)}
     */
    static INPUTAVAILABLE => 4

    /**
     * Dispatch calls from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> in an ASTA. Default is no call dispatch. This value has no meaning in other apartment types and is ignored.
     * Native name: COWAIT_DISPATCH_CALLS
     * @type {Integer (Int32)}
     */
    static DISPATCH_CALLS => 8

    /**
     * Enables dispatch of window messages from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a> in an ASTA or STA. Default in ASTA is no window messages dispatched, default in STA is only a small set of special-cased messages dispatched. The value has no meaning in MTA and is ignored.
     * Native name: COWAIT_DISPATCH_WINDOW_MESSAGES
     * @type {Integer (Int32)}
     */
    static DISPATCH_WINDOW_MESSAGES => 16
}
