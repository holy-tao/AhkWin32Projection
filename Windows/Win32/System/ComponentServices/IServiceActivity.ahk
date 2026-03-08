#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to call the batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iserviceactivity
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
     * Performs the user-defined work synchronously. (IServiceActivity.SynchronousCall)
     * @remarks
     * The batch work that is run via this method runs in the context and thread apartment of the activity created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>.
     * @param {IServiceCall} pIServiceCall A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicecall">IServiceCall</a> interface that is used to implement the batch work.
     * @returns {HRESULT} This method always returns the <b>HRESULT</b> value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicecall-oncall">OnCall</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicecall">IServiceCall</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-synchronouscall
     */
    SynchronousCall(pIServiceCall) {
        result := ComCall(3, this, "ptr", pIServiceCall, "HRESULT")
        return result
    }

    /**
     * Performs the user-defined work asynchronously. (IServiceActivity.AsynchronousCall)
     * @remarks
     * The batch work that is run by this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall
     */
    AsynchronousCall(pIServiceCall) {
        result := ComCall(4, this, "ptr", pIServiceCall, "HRESULT")
        return result
    }

    /**
     * Binds the user-defined batch work to the current thread.
     * @remarks
     * This method binds the batch work that is submitted via the AsynchronousCall or the SynchronousCall method to the current single-threaded apartment (STA). It has no effect if the current thread is being run in the multithreaded apartment (MTA). The current thread model is determined by the configuration of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicethreadpoolconfig">IServiceThreadPoolConfig</a> interface of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object that is passed via the <i>pIUnknown</i> parameter during the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>.
     * 
     * 
     * 
     * Calling this method is equivalent to having called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicethreadpoolconfig-setbindinginfo">IServiceThreadPoolConfig::SetBindingInfo</a> with CSC_BindToPoolThread on the <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object that was passed through the <i>pIUnknown</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>. However, after the activity has been created by <b>CoCreateActivity</b>, you can no longer call <b>IServiceThreadPoolConfig::SetBindingInfo</b> to change the thread binding. To change the thread binding after the activity has been created, you must call the <b>BindToCurrentThread</b> or the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-unbindfromthread">UnbindFromThread</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iserviceactivity">IServiceActivity</a>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-bindtocurrentthread
     */
    BindToCurrentThread() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Unbinds the user-defined batch work from the thread on which it is running.
     * @remarks
     * This method unbinds the batch work that is submitted through the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall">AsynchronousCall</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-synchronouscall">SynchronousCall</a> method from the thread it is running on. It has no effect if the batch work was not previously bound to a thread.
     * 
     * Calling this method is equivalent to having called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicethreadpoolconfig-setbindinginfo">IServiceThreadPoolConfig::SetBindingInfo</a> with CSC_NoBinding on the <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object that was passed through the <i>pIUnknown</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>. However, after the activity has been created by <b>CoCreateActivity</b>, you can no longer call <b>IServiceThreadPoolConfig::SetBindingInfo</b> to change the thread binding. To change the thread binding after the activity has been created, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-bindtocurrentthread">BindToCurrentThread</a> or the <b>UnbindFromThread</b> method of <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iserviceactivity">IServiceActivity</a>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-unbindfromthread
     */
    UnbindFromThread() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
