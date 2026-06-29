#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SCRIPTSTATE.ahk" { SCRIPTSTATE }
#Import ".\IActiveScriptError.ahk" { IActiveScriptError }
#Import "..\..\..\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\ITypeInfo.ahk" { ITypeInfo }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptSite extends IUnknown {
    /**
     * The interface identifier for IActiveScriptSite
     * @type {Guid}
     */
    static IID := Guid("{db01a1e3-a42b-11cf-8f20-00805f2cd064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLCID             : IntPtr
        GetItemInfo         : IntPtr
        GetDocVersionString : IntPtr
        OnScriptTerminate   : IntPtr
        OnStateChange       : IntPtr
        OnScriptError       : IntPtr
        OnEnterScript       : IntPtr
        OnLeaveScript       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLCID() {
        result := ComCall(3, this, "uint*", &plcid := 0, "HRESULT")
        return plcid
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwReturnMask 
     * @param {Pointer<IUnknown>} ppiunkItem 
     * @param {Pointer<ITypeInfo>} ppti 
     * @returns {HRESULT} 
     */
    GetItemInfo(pstrName, dwReturnMask, ppiunkItem, ppti) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(4, this, "ptr", pstrName, "uint", dwReturnMask, IUnknown.Ptr, ppiunkItem, ITypeInfo.Ptr, ppti, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDocVersionString() {
        pbstrVersion := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrVersion, "HRESULT")
        return pbstrVersion
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    OnScriptTerminate(pvarResult, pexcepinfo) {
        result := ComCall(6, this, VARIANT.Ptr, pvarResult, EXCEPINFO.Ptr, pexcepinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SCRIPTSTATE} ssScriptState 
     * @returns {HRESULT} 
     */
    OnStateChange(ssScriptState) {
        result := ComCall(7, this, SCRIPTSTATE, ssScriptState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IActiveScriptError} pscripterror 
     * @returns {HRESULT} 
     */
    OnScriptError(pscripterror) {
        result := ComCall(8, this, "ptr", pscripterror, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnEnterScript() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnLeaveScript() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLCID := CallbackCreate(GetMethod(implObj, "GetLCID"), flags, 2)
        this.vtbl.GetItemInfo := CallbackCreate(GetMethod(implObj, "GetItemInfo"), flags, 5)
        this.vtbl.GetDocVersionString := CallbackCreate(GetMethod(implObj, "GetDocVersionString"), flags, 2)
        this.vtbl.OnScriptTerminate := CallbackCreate(GetMethod(implObj, "OnScriptTerminate"), flags, 3)
        this.vtbl.OnStateChange := CallbackCreate(GetMethod(implObj, "OnStateChange"), flags, 2)
        this.vtbl.OnScriptError := CallbackCreate(GetMethod(implObj, "OnScriptError"), flags, 2)
        this.vtbl.OnEnterScript := CallbackCreate(GetMethod(implObj, "OnEnterScript"), flags, 1)
        this.vtbl.OnLeaveScript := CallbackCreate(GetMethod(implObj, "OnLeaveScript"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLCID)
        CallbackFree(this.vtbl.GetItemInfo)
        CallbackFree(this.vtbl.GetDocVersionString)
        CallbackFree(this.vtbl.OnScriptTerminate)
        CallbackFree(this.vtbl.OnStateChange)
        CallbackFree(this.vtbl.OnScriptError)
        CallbackFree(this.vtbl.OnEnterScript)
        CallbackFree(this.vtbl.OnLeaveScript)
    }
}
