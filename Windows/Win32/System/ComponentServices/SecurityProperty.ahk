#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about the current object's original caller and direct caller.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-securityproperty
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class SecurityProperty extends IDispatch{
    /**
     * The interface identifier for SecurityProperty
     * @type {Guid}
     */
    static IID => Guid("{e74a7215-014d-11d1-a63c-00a0c911b4e0}")

    /**
     * The class identifier for SecurityProperty
     * @type {Guid}
     */
    static CLSID => Guid("{e74a7215-014d-11d1-a63c-00a0c911b4e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} bstrUserName 
     * @returns {HRESULT} 
     */
    GetDirectCallerName(bstrUserName) {
        result := ComCall(7, this, "ptr", bstrUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrUserName 
     * @returns {HRESULT} 
     */
    GetDirectCreatorName(bstrUserName) {
        result := ComCall(8, this, "ptr", bstrUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrUserName 
     * @returns {HRESULT} 
     */
    GetOriginalCallerName(bstrUserName) {
        result := ComCall(9, this, "ptr", bstrUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bstrUserName 
     * @returns {HRESULT} 
     */
    GetOriginalCreatorName(bstrUserName) {
        result := ComCall(10, this, "ptr", bstrUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
