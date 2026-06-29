#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugExpressionCallBack.ahk" { IDebugExpressionCallBack }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IDebugProperty.ahk" { IDebugProperty }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugExpression extends IUnknown {
    /**
     * The interface identifier for IDebugExpression
     * @type {Guid}
     */
    static IID := Guid("{51973c14-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugExpression interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start                    : IntPtr
        Abort                    : IntPtr
        QueryIsComplete          : IntPtr
        GetResultAsString        : IntPtr
        GetResultAsDebugProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugExpression.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugExpressionCallBack} pdecb 
     * @returns {HRESULT} 
     */
    Start(pdecb) {
        result := ComCall(3, this, "ptr", pdecb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryIsComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @param {Pointer<BSTR>} pbstrResult 
     * @returns {HRESULT} 
     */
    GetResultAsString(phrResult, pbstrResult) {
        phrResultMarshal := phrResult is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, phrResultMarshal, phrResult, BSTR.Ptr, pbstrResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrResult 
     * @param {Pointer<IDebugProperty>} ppdp 
     * @returns {HRESULT} 
     */
    GetResultAsDebugProperty(phrResult, ppdp) {
        phrResultMarshal := phrResult is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, phrResultMarshal, phrResult, IDebugProperty.Ptr, ppdp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugExpression.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 2)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
        this.vtbl.QueryIsComplete := CallbackCreate(GetMethod(implObj, "QueryIsComplete"), flags, 1)
        this.vtbl.GetResultAsString := CallbackCreate(GetMethod(implObj, "GetResultAsString"), flags, 3)
        this.vtbl.GetResultAsDebugProperty := CallbackCreate(GetMethod(implObj, "GetResultAsDebugProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.QueryIsComplete)
        CallbackFree(this.vtbl.GetResultAsString)
        CallbackFree(this.vtbl.GetResultAsDebugProperty)
    }
}
