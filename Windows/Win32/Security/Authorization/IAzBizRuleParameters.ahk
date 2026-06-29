#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides methods and properties used to manage a list of parameters that can be passed to business rule (BizRule) scripts.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazbizruleparameters
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzBizRuleParameters extends IDispatch {
    /**
     * The interface identifier for IAzBizRuleParameters
     * @type {Guid}
     */
    static IID := Guid("{fc17685f-e25d-4dcd-bae1-276ec9533cb5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzBizRuleParameters interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        AddParameter      : IntPtr
        AddParameters     : IntPtr
        GetParameterValue : IntPtr
        Remove            : IntPtr
        RemoveAll         : IntPtr
        get_Count         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzBizRuleParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-addparameter
     */
    AddParameter(bstrParameterName, varParameterValue) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        result := ComCall(7, this, BSTR, bstrParameterName, VARIANT, varParameterValue, "HRESULT")
        return result
    }

    /**
     * Adds parameters to the list of parameters available to business rule (BizRule) scripts.
     * @param {VARIANT} varParameterNames The parameter names. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a parameter name. This array must be sorted alphabetically; the sort order is as defined by a case-sensitive <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-varcmp">VarCmp</a>. The order of the <i>varParameterValues</i> array must match the order of this array.
     * @param {VARIANT} varParameterValues The values of the parameters that are available to BizRule scripts. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a value that corresponds to an element in the <i>varParameterNames</i> array. The default value is <b>VT_NULL</b>. The entries in the array can hold any type except <b>VT_UNKNOWN</b> and <b>VT_DISPATCH</b>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-addparameters
     */
    AddParameters(varParameterNames, varParameterValues) {
        result := ComCall(8, this, VARIANT, varParameterNames, VARIANT, varParameterValues, "HRESULT")
        return result
    }

    /**
     * Gets the value type of the business rule (BizRule) parameter with the specified name.
     * @param {BSTR} bstrParameterName A string that contains the parameter name.
     * @returns {VARIANT} A pointer to the data type of the parameter value.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-getparametervalue
     */
    GetParameterValue(bstrParameterName) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        pvarParameterValue := VARIANT()
        result := ComCall(9, this, BSTR, bstrParameterName, VARIANT.Ptr, pvarParameterValue, "HRESULT")
        return pvarParameterValue
    }

    /**
     * Removes the specified parameter from the list of parameters available to business rule (BizRule) scripts.
     * @param {BSTR} varParameterName The name of the parameter to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-remove
     */
    Remove(varParameterName) {
        varParameterName := varParameterName is String ? BSTR.Alloc(varParameterName).Value : varParameterName

        result := ComCall(10, this, BSTR, varParameterName, "HRESULT")
        return result
    }

    /**
     * Removes all parameters from the list of parameters available to business rule (BizRule) scripts.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-removeall
     */
    RemoveAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Gets the number of parameters available to business rule (BizRule) scripts.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleparameters-get_count
     */
    get_Count() {
        result := ComCall(12, this, "uint*", &plCount := 0, "HRESULT")
        return plCount
    }

    Query(iid) {
        if (IAzBizRuleParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddParameter := CallbackCreate(GetMethod(implObj, "AddParameter"), flags, 3)
        this.vtbl.AddParameters := CallbackCreate(GetMethod(implObj, "AddParameters"), flags, 3)
        this.vtbl.GetParameterValue := CallbackCreate(GetMethod(implObj, "GetParameterValue"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.RemoveAll := CallbackCreate(GetMethod(implObj, "RemoveAll"), flags, 1)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddParameter)
        CallbackFree(this.vtbl.AddParameters)
        CallbackFree(this.vtbl.GetParameterValue)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.RemoveAll)
        CallbackFree(this.vtbl.get_Count)
    }
}
