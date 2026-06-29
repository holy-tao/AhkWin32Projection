#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains information about a Business Rule (BizRule) operation.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">IAzClientContext::AccessCheck</a> method creates an <b>AzBizRuleContext</b> object before it calls a BizRule script.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazbizrulecontext
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzBizRuleContext extends IDispatch {
    /**
     * The interface identifier for IAzBizRuleContext
     * @type {Guid}
     */
    static IID := Guid("{e192f17d-d59f-455e-a152-940316cd77b2}")

    /**
     * The class identifier for AzBizRuleContext
     * @type {Guid}
     */
    static CLSID := Guid("{5c2dc96f-8d51-434b-b33c-379bccae77c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzBizRuleContext interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_BusinessRuleResult : IntPtr
        put_BusinessRuleString : IntPtr
        get_BusinessRuleString : IntPtr
        GetParameter           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzBizRuleContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    BusinessRuleResult {
        set => this.put_BusinessRuleResult(value)
    }

    /**
     * @type {BSTR} 
     */
    BusinessRuleString {
        get => this.get_BusinessRuleString()
        set => this.put_BusinessRuleString(value)
    }

    /**
     * Sets a value that indicates whether the Business Rule (BizRule) allows the user to perform the requested task.
     * @param {BOOL} bResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-put_businessruleresult
     */
    put_BusinessRuleResult(bResult) {
        result := ComCall(7, this, BOOL, bResult, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves an application-specific string for the Business Rule (BizRule). (Put)
     * @remarks
     * This property is returned to the application that called the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">IAzClientContext::AccessCheck</a> method. One possible use of this property is to explain the reason that the BizRule denied access to the user.
     * 
     * The maximum length of this property is 65,536 characters.
     * @param {BSTR} bstrBusinessRuleString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-put_businessrulestring
     */
    put_BusinessRuleString(bstrBusinessRuleString) {
        bstrBusinessRuleString := bstrBusinessRuleString is String ? BSTR.Alloc(bstrBusinessRuleString).Value : bstrBusinessRuleString

        result := ComCall(8, this, BSTR, bstrBusinessRuleString, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves an application-specific string for the Business Rule (BizRule). (Get)
     * @remarks
     * This property is returned to the application that called the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">IAzClientContext::AccessCheck</a> method. One possible use of this property is to explain the reason that the BizRule denied access to the user.
     * 
     * The maximum length of this property is 65,536 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-get_businessrulestring
     */
    get_BusinessRuleString() {
        pbstrBusinessRuleString := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrBusinessRuleString, "HRESULT")
        return pbstrBusinessRuleString
    }

    /**
     * Gets the specified value from the varParameterValues parameter of the IAzClientContext::AccessCheck method.
     * @param {BSTR} bstrParameterName Name of the value to return. The name must match the name in one of the elements in the array passed into the <i>varParameterNames</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. 
     * 
     * <div class="alert"><b>Important</b>  Users of VBScript must be aware that the comparison between this parameter and the names in the <i>varParameterNames</i> parameter is case sensitive.</div>
     * <div> </div>
     * @returns {VARIANT} Parameter value from the <i>varParameterValues</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method that corresponds to the name specified by the <i>bstrParameterName</i> parameter, if found; otherwise, <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizrulecontext-getparameter
     */
    GetParameter(bstrParameterName) {
        bstrParameterName := bstrParameterName is String ? BSTR.Alloc(bstrParameterName).Value : bstrParameterName

        pvarParameterValue := VARIANT()
        result := ComCall(10, this, BSTR, bstrParameterName, VARIANT.Ptr, pvarParameterValue, "HRESULT")
        return pvarParameterValue
    }

    Query(iid) {
        if (IAzBizRuleContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_BusinessRuleResult := CallbackCreate(GetMethod(implObj, "put_BusinessRuleResult"), flags, 2)
        this.vtbl.put_BusinessRuleString := CallbackCreate(GetMethod(implObj, "put_BusinessRuleString"), flags, 2)
        this.vtbl.get_BusinessRuleString := CallbackCreate(GetMethod(implObj, "get_BusinessRuleString"), flags, 2)
        this.vtbl.GetParameter := CallbackCreate(GetMethod(implObj, "GetParameter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_BusinessRuleResult)
        CallbackFree(this.vtbl.put_BusinessRuleString)
        CallbackFree(this.vtbl.get_BusinessRuleString)
        CallbackFree(this.vtbl.GetParameter)
    }
}
