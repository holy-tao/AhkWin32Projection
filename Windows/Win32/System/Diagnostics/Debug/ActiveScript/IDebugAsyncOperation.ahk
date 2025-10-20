#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugAsyncOperation extends IUnknown{
    /**
     * The interface identifier for IDebugAsyncOperation
     * @type {Guid}
     */
    static IID => Guid("{51973c1b-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDebugSyncOperation>} ppsdo 
     * @returns {HRESULT} 
     */
    GetSyncDebugOperation(ppsdo) {
        result := ComCall(3, this, "ptr", ppsdo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugAsyncOperationCallBack>} padocb 
     * @returns {HRESULT} 
     */
    Start(padocb) {
        result := ComCall(4, this, "ptr", padocb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsComplete() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @param {Pointer<IUnknown>} ppunkResult 
     * @returns {HRESULT} 
     */
    GetResult(phrResult, ppunkResult) {
        result := ComCall(7, this, "ptr", phrResult, "ptr", ppunkResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
