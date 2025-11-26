#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides methods and properties used to manage a list of parameters that can be passed to business rule (BizRule) scripts.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazbizruleparameters
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzBizRuleParameters extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzBizRuleParameters
     * @type {Guid}
     */
    static IID => Guid("{fc17685f-e25d-4dcd-bae1-276ec9533cb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddParameter", "AddParameters", "GetParameterValue", "Remove", "RemoveAll", "get_Count"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @param {BSTR} bstrParameterName 
     * @param {VARIANT} varParameterValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-addparameter
     */
    AddParameter(bstrParameterName, varParameterValue) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        result := ComCall(7, this, "ptr", bstrParameterName, "ptr", varParameterValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varParameterNames 
     * @param {VARIANT} varParameterValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-addparameters
     */
    AddParameters(varParameterNames, varParameterValues) {
        result := ComCall(8, this, "ptr", varParameterNames, "ptr", varParameterValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrParameterName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-getparametervalue
     */
    GetParameterValue(bstrParameterName) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        pvarParameterValue := VARIANT()
        result := ComCall(9, this, "ptr", bstrParameterName, "ptr", pvarParameterValue, "HRESULT")
        return pvarParameterValue
    }

    /**
     * 
     * @param {BSTR} varParameterName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-remove
     */
    Remove(varParameterName) {
        varParameterName := varParameterName is String ? BSTR.Alloc(varParameterName).Value : varParameterName

        result := ComCall(10, this, "ptr", varParameterName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-removeall
     */
    RemoveAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-get_count
     */
    get_Count() {
        result := ComCall(12, this, "uint*", &plCount := 0, "HRESULT")
        return plCount
    }
}
