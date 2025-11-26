#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Callback interface to notify the application when an asynchronous method completes.
 * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nn-rtworkq-irtwqasynccallback
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class IRtwqAsyncCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRtwqAsyncCallback
     * @type {Guid}
     */
    static IID => Guid("{a27003cf-2354-4f2a-8d6a-ab7cff15437e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameters", "Invoke"]

    /**
     * Provides configuration information to the dispatching thread for a callback.
     * @param {Pointer<Integer>} pdwFlags Receives a flag indicating the behavior of the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-irtwqasynccallback-invoke">IRtwqAsyncCallback::Invoke</a> method. The following values are defined. The default value is zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Zero"></a><a id="zero"></a><a id="ZERO"></a><dl>
     * <dt><b>Zero</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callback does not take a long time to complete, but has no specific restrictions on what system calls it makes. The callback generally takes less than 30 milliseconds to complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwQueue Receives the identifier of the work queue on which the callback is dispatched.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_NOTIMPL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented. Assume the default behavior.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqasynccallback-getparameters
     */
    GetParameters(pdwFlags, pdwQueue) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwQueueMarshal := pdwQueue is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pdwQueueMarshal, pdwQueue, "HRESULT")
        return result
    }

    /**
     * Called when an asynchronous operation is completed.
     * @param {IRtwqAsyncResult} pAsyncResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqasyncresult">IRtwqAsyncResult</a> interface. Pass this pointer to the asynchronous <b>End...</b> method to complete the asynchronous call.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqasynccallback-invoke
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "HRESULT")
        return result
    }
}
