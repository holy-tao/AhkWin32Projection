#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityInput extends IUnknown{
    /**
     * The interface identifier for IOpenServiceActivityInput
     * @type {Guid}
     */
    static IID => Guid("{75cb4db9-6da0-4da3-83ce-422b6a433346}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwzVariableName 
     * @param {PWSTR} pwzVariableType 
     * @param {Pointer<BSTR>} pbstrVariableContent 
     * @returns {HRESULT} 
     */
    GetVariable(pwzVariableName, pwzVariableType, pbstrVariableContent) {
        pwzVariableName := pwzVariableName is String ? StrPtr(pwzVariableName) : pwzVariableName
        pwzVariableType := pwzVariableType is String ? StrPtr(pwzVariableType) : pwzVariableType

        result := ComCall(3, this, "ptr", pwzVariableName, "ptr", pwzVariableType, "ptr", pbstrVariableContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzVariableName 
     * @param {PWSTR} pwzVariableType 
     * @param {Pointer<BOOL>} pfHasVariable 
     * @returns {HRESULT} 
     */
    HasVariable(pwzVariableName, pwzVariableType, pfHasVariable) {
        pwzVariableName := pwzVariableName is String ? StrPtr(pwzVariableName) : pwzVariableName
        pwzVariableType := pwzVariableType is String ? StrPtr(pwzVariableType) : pwzVariableType

        result := ComCall(4, this, "ptr", pwzVariableName, "ptr", pwzVariableType, "ptr", pfHasVariable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetType(pType) {
        result := ComCall(5, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
