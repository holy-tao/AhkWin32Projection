#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpTranscript extends IUnknown {
    /**
     * The interface identifier for ISpTranscript
     * @type {Guid}
     */
    static IID := Guid("{10f63bce-201a-11d3-ac70-00c04f8ee6c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpTranscript interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTranscript    : IntPtr
        AppendTranscript : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpTranscript.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetTranscript() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszTranscript := 0, "HRESULT")
        return ppszTranscript
    }

    /**
     * 
     * @param {PWSTR} pszTranscript 
     * @returns {HRESULT} 
     */
    AppendTranscript(pszTranscript) {
        pszTranscript := pszTranscript is String ? StrPtr(pszTranscript) : pszTranscript

        result := ComCall(4, this, "ptr", pszTranscript, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpTranscript.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTranscript := CallbackCreate(GetMethod(implObj, "GetTranscript"), flags, 2)
        this.vtbl.AppendTranscript := CallbackCreate(GetMethod(implObj, "AppendTranscript"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTranscript)
        CallbackFree(this.vtbl.AppendTranscript)
    }
}
