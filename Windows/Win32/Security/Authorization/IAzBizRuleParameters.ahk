#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides methods and properties used to manage a list of parameters that can be passed to business rule (BizRule) scripts.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazbizruleparameters
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzBizRuleParameters extends IDispatch{
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
     * 
     * @param {BSTR} bstrParameterName 
     * @param {VARIANT} varParameterValue 
     * @returns {HRESULT} 
     */
    AddParameter(bstrParameterName, varParameterValue) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        result := ComCall(7, this, "ptr", bstrParameterName, "ptr", varParameterValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varParameterNames 
     * @param {VARIANT} varParameterValues 
     * @returns {HRESULT} 
     */
    AddParameters(varParameterNames, varParameterValues) {
        result := ComCall(8, this, "ptr", varParameterNames, "ptr", varParameterValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrParameterName 
     * @param {Pointer<VARIANT>} pvarParameterValue 
     * @returns {HRESULT} 
     */
    GetParameterValue(bstrParameterName, pvarParameterValue) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        result := ComCall(9, this, "ptr", bstrParameterName, "ptr", pvarParameterValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} varParameterName 
     * @returns {HRESULT} 
     */
    Remove(varParameterName) {
        varParameterName := varParameterName is String ? BSTR.Alloc(varParameterName).Value : varParameterName

        result := ComCall(10, this, "ptr", varParameterName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(12, this, "uint*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
