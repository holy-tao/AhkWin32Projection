#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to call the batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iserviceactivity
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceActivity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceActivity
     * @type {Guid}
     */
    static IID => Guid("{67532e0c-9e2f-4450-a354-035633944e17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SynchronousCall", "AsynchronousCall", "BindToCurrentThread", "UnbindFromThread"]

    /**
     * Performs the user-defined work synchronously.
     * @param {IServiceCall} pIServiceCall A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicecall">IServiceCall</a> interface that is used to implement the batch work.
     * @returns {HRESULT} This method always returns the <b>HRESULT</b> value returned by the <a href="/windows/desktop/api/comsvcs/nf-comsvcs-iservicecall-oncall">OnCall</a> method of the <a href="/windows/desktop/api/comsvcs/nn-comsvcs-iservicecall">IServiceCall</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iserviceactivity-synchronouscall
     */
    SynchronousCall(pIServiceCall) {
        result := ComCall(3, this, "ptr", pIServiceCall, "HRESULT")
        return result
    }

    /**
     * Performs the user-defined work asynchronously.
     * @param {IServiceCall} pIServiceCall A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicecall">IServiceCall</a> interface that is used to implement the batch work.
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
     * The batch work was accepted by the activity to run asynchronously. This return value does not necessarily mean that the batch work successfully completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_ASYNC_WORK_REJECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The batch work cannot be added to the asynchronous work queue of the activity.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall
     */
    AsynchronousCall(pIServiceCall) {
        result := ComCall(4, this, "ptr", pIServiceCall, "HRESULT")
        return result
    }

    /**
     * Binds the user-defined batch work to the current thread.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iserviceactivity-bindtocurrentthread
     */
    BindToCurrentThread() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Unbinds the user-defined batch work from the thread on which it is running.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iserviceactivity-unbindfromthread
     */
    UnbindFromThread() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
