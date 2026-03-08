#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to implement the batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicecall
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceCall extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceCall
     * @type {Guid}
     */
    static IID => Guid("{bd3e2e12-42dd-40f4-a09a-95a50c58304b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCall"]

    /**
     * Triggers the execution of the batch work implemented in this method. (IServiceCall.OnCall)
     * @remarks
     * The batch work that is run in this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>. The batch work in this method is run through a call to either <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-synchronouscall">SynchronousCall</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall">AsynchronousCall</a>, using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iserviceactivity">IServiceActivity</a> pointer that was returned from the call to <b>CoCreateActivity</b>.
     * 
     * 
     * 
     * You must make sure that this method is thread safe in situations where the activity object that is created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> is not created with a synchronized context because in such situations many calls to <b>OnCall</b> can run at the same time.
     * 
     * 
     * 
     * To achieve the best performance from the system, the context configuration of the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> should be matched to the batch work performed by the <b>OnCall</b> method. For example, if the batch work in the <b>OnCall</b> method uses poolable objects, the activity created by <b>CoCreateActivity</b> should be configured to use the multithreaded apartment (MTA).
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicecall-oncall
     */
    OnCall() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
