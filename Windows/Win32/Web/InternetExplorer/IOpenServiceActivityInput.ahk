#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\OpenServiceActivityContentType.ahk" { OpenServiceActivityContentType }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IOpenServiceActivityInput extends IUnknown {
    /**
     * The interface identifier for IOpenServiceActivityInput
     * @type {Guid}
     */
    static IID := Guid("{75cb4db9-6da0-4da3-83ce-422b6a433346}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpenServiceActivityInput interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVariable : IntPtr
        HasVariable : IntPtr
        GetType     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpenServiceActivityInput.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzVariableName 
     * @param {PWSTR} pwzVariableType 
     * @returns {BSTR} 
     */
    GetVariable(pwzVariableName, pwzVariableType) {
        pwzVariableName := pwzVariableName is String ? StrPtr(pwzVariableName) : pwzVariableName
        pwzVariableType := pwzVariableType is String ? StrPtr(pwzVariableType) : pwzVariableType

        pbstrVariableContent := BSTR.Owned()
        result := ComCall(3, this, "ptr", pwzVariableName, "ptr", pwzVariableType, BSTR.Ptr, pbstrVariableContent, "HRESULT")
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

        result := ComCall(4, this, "ptr", pwzVariableName, "ptr", pwzVariableType, BOOL.Ptr, &pfHasVariable := 0, "HRESULT")
        return pfHasVariable
    }

    /**
     * 
     * @returns {OpenServiceActivityContentType} 
     */
    GetType() {
        result := ComCall(5, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    Query(iid) {
        if (IOpenServiceActivityInput.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVariable := CallbackCreate(GetMethod(implObj, "GetVariable"), flags, 4)
        this.vtbl.HasVariable := CallbackCreate(GetMethod(implObj, "HasVariable"), flags, 4)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVariable)
        CallbackFree(this.vtbl.HasVariable)
        CallbackFree(this.vtbl.GetType)
    }
}
