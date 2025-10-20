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
     * 
     * @param {Pointer<IServiceCall>} pIServiceCall 
     * @returns {HRESULT} 
     */
    SynchronousCall(pIServiceCall) {
        result := ComCall(3, this, "ptr", pIServiceCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IServiceCall>} pIServiceCall 
     * @returns {HRESULT} 
     */
    AsynchronousCall(pIServiceCall) {
        result := ComCall(4, this, "ptr", pIServiceCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindToCurrentThread() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnbindFromThread() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
