#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides asynchronous communication between objects about the occurrence of an event.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronize
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
     * Waits for the synchronization object to be signaled or for a specified timeout period to elapse, whichever comes first.
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
     * <dt><b>RPC_S_CALLPENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out period elapsed before the synchronization object was signaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_NO_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no synchronization object to wait on.
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isynchronize-wait
     */
    Wait(dwFlags, dwMilliseconds) {
        result := ComCall(3, this, "uint", dwFlags, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * Sets the synchronization object to the signaled state and causes pending wait operations to return S_OK.
     * @returns {HRESULT} This method returns S_OK to indicate that the method completed successfully.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isynchronize-signal
     */
    Signal() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the synchronization object to the nonsignaled state.
     * @returns {HRESULT} This method returns S_OK to indicate that the method completed successfully.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isynchronize-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
