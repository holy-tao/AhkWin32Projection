#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRPolicyManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRPolicyManager
     * @type {Guid}
     */
    static IID => Guid("{7d290010-d781-45da-a6f8-aa5d711a730e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDefaultAction", "SetTimeout", "SetActionOnTimeout", "SetTimeoutAndAction", "SetActionOnFailure", "SetUnhandledExceptionPolicy"]

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    SetDefaultAction(operation, action) {
        result := ComCall(3, this, "int", operation, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    SetTimeout(operation, dwMilliseconds) {
        result := ComCall(4, this, "int", operation, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    SetActionOnTimeout(operation, action) {
        result := ComCall(5, this, "int", operation, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    SetTimeoutAndAction(operation, dwMilliseconds, action) {
        result := ComCall(6, this, "int", operation, "uint", dwMilliseconds, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} failure 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    SetActionOnFailure(failure, action) {
        result := ComCall(7, this, "int", failure, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} policy 
     * @returns {HRESULT} 
     */
    SetUnhandledExceptionPolicy(policy) {
        result := ComCall(8, this, "int", policy, "HRESULT")
        return result
    }
}
