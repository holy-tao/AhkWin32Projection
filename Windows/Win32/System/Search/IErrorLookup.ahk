#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\DISPPARAMS.ahk" { DISPPARAMS }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IErrorLookup extends IUnknown {
    /**
     * The interface identifier for IErrorLookup
     * @type {Guid}
     */
    static IID := Guid("{0c733a66-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IErrorLookup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetErrorDescription : IntPtr
        GetHelpInfo         : IntPtr
        ReleaseErrors       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IErrorLookup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Integer} dwLookupID 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrSource 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    GetErrorDescription(hrError, dwLookupID, pdispparams, lcid, pbstrSource, pbstrDescription) {
        result := ComCall(3, this, "int", hrError, "uint", dwLookupID, DISPPARAMS.Ptr, pdispparams, "uint", lcid, BSTR.Ptr, pbstrSource, BSTR.Ptr, pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Integer} dwLookupID 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrHelpFile 
     * @param {Pointer<Integer>} pdwHelpContext 
     * @returns {HRESULT} 
     */
    GetHelpInfo(hrError, dwLookupID, lcid, pbstrHelpFile, pdwHelpContext) {
        pdwHelpContextMarshal := pdwHelpContext is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", hrError, "uint", dwLookupID, "uint", lcid, BSTR.Ptr, pbstrHelpFile, pdwHelpContextMarshal, pdwHelpContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDynamicErrorID 
     * @returns {HRESULT} 
     */
    ReleaseErrors(dwDynamicErrorID) {
        result := ComCall(5, this, "uint", dwDynamicErrorID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IErrorLookup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetErrorDescription := CallbackCreate(GetMethod(implObj, "GetErrorDescription"), flags, 7)
        this.vtbl.GetHelpInfo := CallbackCreate(GetMethod(implObj, "GetHelpInfo"), flags, 6)
        this.vtbl.ReleaseErrors := CallbackCreate(GetMethod(implObj, "ReleaseErrors"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetErrorDescription)
        CallbackFree(this.vtbl.GetHelpInfo)
        CallbackFree(this.vtbl.ReleaseErrors)
    }
}
