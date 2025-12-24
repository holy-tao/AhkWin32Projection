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
     * Adds a parameter to the list of parameters available to business rule (BizRule) scripts.
     * @param {BSTR} bstrParameterName A string that contains the parameter name.
     * @param {VARIANT} varParameterValue The data type of the parameter value.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleparameters-addparameter
     */
    AddParameter(bstrParameterName, varParameterValue) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        result := ComCall(7, this, "ptr", bstrParameterName, "ptr", varParameterValue, "HRESULT")
        return result
    }

    /**
     * Adds parameters to the list of parameters available to business rule (BizRule) scripts.
     * @param {VARIANT} varParameterNames The parameter names. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a parameter name. This array must be sorted alphabetically; the sort order is as defined by a case-sensitive <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-varcmp">VarCmp</a>. The order of the <i>varParameterValues</i> array must match the order of this array.
     * @param {VARIANT} varParameterValues The values of the parameters that are available to BizRule scripts. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a value that corresponds to an element in the <i>varParameterNames</i> array. The default value is <b>VT_NULL</b>. The entries in the array can hold any type except <b>VT_UNKNOWN</b> and <b>VT_DISPATCH</b>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleparameters-addparameters
     */
    AddParameters(varParameterNames, varParameterValues) {
        result := ComCall(8, this, "ptr", varParameterNames, "ptr", varParameterValues, "HRESULT")
        return result
    }

    /**
     * Gets the value type of the business rule (BizRule) parameter with the specified name.
     * @param {BSTR} bstrParameterName A string that contains the parameter name.
     * @returns {VARIANT} A pointer to the data type of the parameter value.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleparameters-getparametervalue
     */
    GetParameterValue(bstrParameterName) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        pvarParameterValue := VARIANT()
        result := ComCall(9, this, "ptr", bstrParameterName, "ptr", pvarParameterValue, "HRESULT")
        return pvarParameterValue
    }

    /**
     * Removes the specified parameter from the list of parameters available to business rule (BizRule) scripts.
     * @param {BSTR} varParameterName The name of the parameter to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleparameters-remove
     */
    Remove(varParameterName) {
        varParameterName := varParameterName is String ? BSTR.Alloc(varParameterName).Value : varParameterName

        result := ComCall(10, this, "ptr", varParameterName, "HRESULT")
        return result
    }

    /**
     * Removes all parameters from the list of parameters available to business rule (BizRule) scripts.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleparameters-removeall
     */
    RemoveAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Gets the number of parameters available to business rule (BizRule) scripts.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazbizruleparameters-get_count
     */
    get_Count() {
        result := ComCall(12, this, "uint*", &plCount := 0, "HRESULT")
        return plCount
    }
}
