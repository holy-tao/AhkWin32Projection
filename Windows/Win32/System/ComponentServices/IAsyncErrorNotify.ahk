#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to implement error trapping on the asynchronous batch work that is submitted through the activity created by CoCreateActivity.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iasyncerrornotify
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IAsyncErrorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAsyncErrorNotify
     * @type {Guid}
     */
    static IID => Guid("{fe6777fb-a674-4177-8f32-6d707e113484}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnError"]

    /**
     * Called by COM+ when an error occurs in your asynchronous batch work.
     * @remarks
     * This method should be implemented to gracefully handle errors that occur when your batch work is running asynchronously. Because the process terminates (FailFast) on any unrecoverable error, without this method you have no way of knowing when errors occur in your asynchronous batch work. The process also terminates when this method returns an error as its return value.
     * 
     * The batch work itself is implemented in <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicecall-oncall">IServiceCall::OnCall</a>, and it is run asynchronously by calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall">IServiceActivity::AsynchronousCall</a> using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iserviceactivity">IServiceActivity</a> pointer that was returned from the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>.
     * @param {HRESULT} hr The <b>HRESULT</b> value of the error that occurred while your batch work was running asynchronously.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iasyncerrornotify-onerror
     */
    OnError(hr) {
        result := ComCall(3, this, "int", hr, "HRESULT")
        return result
    }
}
