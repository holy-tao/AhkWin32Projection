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
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Pointer<UInt32>} pdwQueue 
     * @returns {HRESULT} 
     */
    GetParameters(pdwFlags, pdwQueue) {
        result := ComCall(3, this, "uint*", pdwFlags, "uint*", pdwQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRtwqAsyncResult>} pAsyncResult 
     * @returns {HRESULT} 
     */
    Invoke(pAsyncResult) {
        result := ComCall(4, this, "ptr", pAsyncResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
