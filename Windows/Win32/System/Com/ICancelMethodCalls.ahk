#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ICancelMethodCalls::Cancel method (objidl.h) manages cancellation requests on an outbound method call and monitors the current state of that method call on the server thread.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-icancelmethodcalls
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ICancelMethodCalls extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICancelMethodCalls
     * @type {Guid}
     */
    static IID => Guid("{00000029-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "TestCancel"]

    /**
     * The ICancelMethodCalls::Cancel method (objidl.h) requests that a method call be canceled.
     * @remarks
     * The <b>Cancel</b> method only issues a cancel request. A return value of S_OK does not mean that the call was canceled, only that an attempt was made to cancel the call. The behavior of the cancel object on receiving a cancel request is entirely at the discretion of the implementer.
     * 
     * If a method that returns an <b>HRESULT</b> is canceled, the return value will be RPC_S_CALL_CANCELED.
     * @param {Integer} ulSeconds The number of seconds to wait for the server to complete the outbound call after the client requests cancellation.
     * @returns {HRESULT} This method can return one of these values.
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
     * The cancellation request was made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALL_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was already canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CANCEL_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call cancellation is not enabled on the thread that is processing the call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CALL_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was completed during the timeout interval.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-icancelmethodcalls-cancel
     */
    Cancel(ulSeconds) {
        result := ComCall(3, this, "uint", ulSeconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ICancelMethodCalls::TestCancel method (objidl.h) determines whether a call has been canceled.
     * @remarks
     * The server object calls <b>TestCancel</b> to determine if the call has been canceled. If the call has been canceled, the server should clean up the necessary resources and return control to the client.
     * 
     * This method can be called from both the client and the server.
     * @returns {HRESULT} If the call was canceled, the return value is RPC_E_CALL_CANCELED. Otherwise, it is RPC_S_CALLPENDING.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-icancelmethodcalls-testcancel
     */
    TestCancel() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
