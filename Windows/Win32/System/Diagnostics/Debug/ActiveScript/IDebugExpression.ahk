#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugExpression extends IUnknown{
    /**
     * The interface identifier for IDebugExpression
     * @type {Guid}
     */
    static IID => Guid("{51973c14-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDebugExpressionCallBack>} pdecb 
     * @returns {HRESULT} 
     */
    Start(pdecb) {
        result := ComCall(3, this, "ptr", pdecb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsComplete() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @param {Pointer<BSTR>} pbstrResult 
     * @returns {HRESULT} 
     */
    GetResultAsString(phrResult, pbstrResult) {
        result := ComCall(6, this, "ptr", phrResult, "ptr", pbstrResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @param {Pointer<IDebugProperty>} ppdp 
     * @returns {HRESULT} 
     */
    GetResultAsDebugProperty(phrResult, ppdp) {
        result := ComCall(7, this, "ptr", phrResult, "ptr", ppdp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
