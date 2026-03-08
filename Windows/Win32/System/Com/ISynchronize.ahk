#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ISynchronize (objidlbase.h) interface provides asynchronous communication between objects about the occurrence of an event.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-isynchronize
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronize
     * @type {Guid}
     */
    static IID => Guid("{00000030-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Wait", "Signal", "Reset"]

    /**
     * The ISynchronize::Wait (objidlbase.h) method waits for the synchronization object to be signaled or for a specified timeout period to elapse.
     * @remarks
     * If the caller is waiting in a single-thread apartment, <b>Wait</b> enters the COM modal loop. If the caller is waiting in a multithread apartment, the caller is blocked until <b>Wait</b> returns.
     * @param {Integer} dwFlags The wait options. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_FLAGS</a> enumeration.
     * @param {Integer} dwMilliseconds The time this call will wait before returning, in milliseconds. If this parameter is INFINITE, the caller will wait until the synchronization object is signaled, no matter how long it takes. If this parameter is 0, the method returns immediately.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The synchronization object was signaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CALLPENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out period elapsed before the synchronization object was signaled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronize-wait
     */
    Wait(dwFlags, dwMilliseconds) {
        result := ComCall(3, this, "uint", dwFlags, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * The ISynchronize::Signal (objidlbase.h) method sets the synchronization object to the signaled state and causes pending wait operations to return S_OK.
     * @returns {HRESULT} This method returns S_OK to indicate that the method completed successfully.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronize-signal
     */
    Signal() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The ISynchronize::Reset (objidlbase.h) method sets the synchronization object to the nonsignaled state.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isynchronize-wait">ISynchronize::Wait</a> method implemented on a standard event object (CLSID_StdEvent) automatically calls <b>Reset</b> when the synchronization object has been signaled.
     * 
     * The implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isynchronize-wait">ISynchronize::Wait</a> on the manual reset event object (CLSID_ManualResetEvent) does not automatically call <b>Reset</b>. A server object usually calls <b>Reset</b> from a method that clients call after they detect that the synchronization object was signaled.
     * 
     * In general, it is the server's responsibility to call <b>Reset</b>. If, however, the client needs to begin with the synchronization object in an unsignaled state, the client should call <b>Reset</b>.
     * @returns {HRESULT} This method returns S_OK to indicate that the method completed successfully.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronize-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
