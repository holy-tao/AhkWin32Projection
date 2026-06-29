#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugDocumentTextExternalAuthor extends IUnknown {
    /**
     * The interface identifier for IDebugDocumentTextExternalAuthor
     * @type {Guid}
     */
    static IID := Guid("{51973c25-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDocumentTextExternalAuthor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPathName   : IntPtr
        GetFileName   : IntPtr
        NotifyChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDocumentTextExternalAuthor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLongName 
     * @param {Pointer<BOOL>} pfIsOriginalFile 
     * @returns {HRESULT} 
     */
    GetPathName(pbstrLongName, pfIsOriginalFile) {
        pfIsOriginalFileMarshal := pfIsOriginalFile is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, BSTR.Ptr, pbstrLongName, pfIsOriginalFileMarshal, pfIsOriginalFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFileName() {
        pbstrShortName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrShortName, "HRESULT")
        return pbstrShortName
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyChanged() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugDocumentTextExternalAuthor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPathName := CallbackCreate(GetMethod(implObj, "GetPathName"), flags, 3)
        this.vtbl.GetFileName := CallbackCreate(GetMethod(implObj, "GetFileName"), flags, 2)
        this.vtbl.NotifyChanged := CallbackCreate(GetMethod(implObj, "NotifyChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPathName)
        CallbackFree(this.vtbl.GetFileName)
        CallbackFree(this.vtbl.NotifyChanged)
    }
}
