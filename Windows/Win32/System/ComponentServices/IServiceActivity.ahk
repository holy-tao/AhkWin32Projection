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
     * 
     * @param {IServiceCall} pIServiceCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-synchronouscall
     */
    SynchronousCall(pIServiceCall) {
        result := ComCall(3, this, "ptr", pIServiceCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IServiceCall} pIServiceCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-asynchronouscall
     */
    AsynchronousCall(pIServiceCall) {
        result := ComCall(4, this, "ptr", pIServiceCall, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-bindtocurrentthread
     */
    BindToCurrentThread() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceactivity-unbindfromthread
     */
    UnbindFromThread() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
