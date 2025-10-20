#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostPolicyManager extends IUnknown{
    /**
     * The interface identifier for IHostPolicyManager
     * @type {Guid}
     */
    static IID => Guid("{7ae49844-b1e3-4683-ba7c-1e8212ea3b79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    OnDefaultAction(operation, action) {
        result := ComCall(3, this, "int", operation, "int", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    OnTimeout(operation, action) {
        result := ComCall(4, this, "int", operation, "int", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} failure 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    OnFailure(failure, action) {
        result := ComCall(5, this, "int", failure, "int", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
