#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfCandidateList.ahk" { ITfCandidateList }
#Import ".\ITfFunction.ahk" { ITfFunction }

/**
 * The ITfFnGetLinguisticAlternates interface is implemented by a text service and/or by the TSF manager to provide linguistic alternates for the text within a given range passed as a parameter.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffngetlinguisticalternates
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnGetLinguisticAlternates extends ITfFunction {
    /**
     * The interface identifier for ITfFnGetLinguisticAlternates
     * @type {Guid}
     */
    static IID := Guid("{ea163ce2-7a65-4506-82a3-c528215da64e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnGetLinguisticAlternates interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        GetAlternates : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnGetLinguisticAlternates.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a list of alternate strings for a given text range.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to return alternates for.
     * @returns {ITfCandidateList} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-itfcandidatelist">ITfCandidateList</a> pointer that receives the list object containing alternate strings.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffngetlinguisticalternates-getalternates
     */
    GetAlternates(pRange) {
        result := ComCall(4, this, "ptr", pRange, "ptr*", &ppCandidateList := 0, "HRESULT")
        return ITfCandidateList(ppCandidateList)
    }

    Query(iid) {
        if (ITfFnGetLinguisticAlternates.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAlternates := CallbackCreate(GetMethod(implObj, "GetAlternates"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAlternates)
    }
}
