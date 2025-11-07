#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityInput extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVariable", "HasVariable", "GetType"]

    /**
     * 
     * @param {PWSTR} pwzVariableName 
     * @param {PWSTR} pwzVariableType 
     * @returns {BSTR} 
     */
    GetVariable(pwzVariableName, pwzVariableType) {
        pwzVariableName := pwzVariableName is String ? StrPtr(pwzVariableName) : pwzVariableName
        pwzVariableType := pwzVariableType is String ? StrPtr(pwzVariableType) : pwzVariableType

        pbstrVariableContent := BSTR()
        result := ComCall(3, this, "ptr", pwzVariableName, "ptr", pwzVariableType, "ptr", pbstrVariableContent, "HRESULT")
        return pbstrVariableContent
    }

    /**
     * 
     * @param {PWSTR} pwzVariableName 
     * @param {PWSTR} pwzVariableType 
     * @returns {BOOL} 
     */
    HasVariable(pwzVariableName, pwzVariableType) {
        pwzVariableName := pwzVariableName is String ? StrPtr(pwzVariableName) : pwzVariableName
        pwzVariableType := pwzVariableType is String ? StrPtr(pwzVariableType) : pwzVariableType

        result := ComCall(4, this, "ptr", pwzVariableName, "ptr", pwzVariableType, "int*", &pfHasVariable := 0, "HRESULT")
        return pfHasVariable
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetType() {
        result := ComCall(5, this, "int*", &pType := 0, "HRESULT")
        return pType
    }
}
