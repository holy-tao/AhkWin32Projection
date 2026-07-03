#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISpeechRecoResult.ahk" { ISpeechRecoResult }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechRecoResult2 extends ISpeechRecoResult {
    /**
     * The interface identifier for ISpeechRecoResult2
     * @type {Guid}
     */
    static IID := Guid("{8e0a246d-d3c8-45de-8657-04290c458c3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechRecoResult2 interfaces
    */
    struct Vtbl extends ISpeechRecoResult.Vtbl {
        SetTextFeedback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechRecoResult2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} Feedback 
     * @param {VARIANT_BOOL} WasSuccessful 
     * @returns {HRESULT} 
     */
    SetTextFeedback(Feedback, WasSuccessful) {
        Feedback := Feedback is String ? BSTR.Alloc(Feedback).Value : Feedback

        result := ComCall(17, this, BSTR, Feedback, VARIANT_BOOL, WasSuccessful, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechRecoResult2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTextFeedback := CallbackCreate(GetMethod(implObj, "SetTextFeedback"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTextFeedback)
    }
}
