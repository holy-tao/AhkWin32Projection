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
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pdwQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasynccallback-getparameters
     */
    GetParameters(pdwFlags, pdwQueue) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwQueueMarshal := pdwQueue is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, pdwQueueMarshal, pdwQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRtwqAsyncResult} pAsyncResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-irtwqasynccallback-invoke
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "HRESULT")
        return result
    }
}
