#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCandidateString interface is implemented by a text service and is used by the TSF manager or a client to obtain information about a candidate string object.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itfcandidatestring
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCandidateString extends IUnknown {
    /**
     * The interface identifier for ITfCandidateString
     * @type {Guid}
     */
    static IID := Guid("{581f317e-fd9d-443f-b972-ed00467c5d40}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCandidateString interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetString : IntPtr
        GetIndex  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCandidateString.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCandidateString::GetString method
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the text of the candidate string object. The caller must release this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatestring-getstring
     */
    GetString() {
        pbstr := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstr, "HRESULT")
        return pbstr
    }

    /**
     * ITfCandidateString::GetIndex method
     * @returns {Integer} Pointer to a <b>ULONG</b> value that receives the zero-based index of the candidate string object within the candidate list.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatestring-getindex
     */
    GetIndex() {
        result := ComCall(4, this, "uint*", &pnIndex := 0, "HRESULT")
        return pnIndex
    }

    Query(iid) {
        if (ITfCandidateString.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 2)
        this.vtbl.GetIndex := CallbackCreate(GetMethod(implObj, "GetIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetIndex)
    }
}
