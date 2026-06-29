#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpPhraseAlt.ahk" { ISpPhraseAlt }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISpRecoResult.ahk" { ISpRecoResult }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecoResult2 extends ISpRecoResult {
    /**
     * The interface identifier for ISpRecoResult2
     * @type {Guid}
     */
    static IID := Guid("{27cac6c4-88f2-41f2-8817-0c95e59f1e6e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecoResult2 interfaces
    */
    struct Vtbl extends ISpRecoResult.Vtbl {
        CommitAlternate : IntPtr
        CommitText      : IntPtr
        SetTextFeedback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecoResult2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISpPhraseAlt} pPhraseAlt 
     * @returns {ISpRecoResult} 
     */
    CommitAlternate(pPhraseAlt) {
        result := ComCall(14, this, "ptr", pPhraseAlt, "ptr*", &ppNewResult := 0, "HRESULT")
        return ISpRecoResult(ppNewResult)
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @param {PWSTR} pszCorrectedData 
     * @param {Integer} eCommitFlags 
     * @returns {HRESULT} 
     */
    CommitText(ulStartElement, cElements, pszCorrectedData, eCommitFlags) {
        pszCorrectedData := pszCorrectedData is String ? StrPtr(pszCorrectedData) : pszCorrectedData

        result := ComCall(15, this, "uint", ulStartElement, "uint", cElements, "ptr", pszCorrectedData, "uint", eCommitFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFeedback 
     * @param {BOOL} fSuccessful 
     * @returns {HRESULT} 
     */
    SetTextFeedback(pszFeedback, fSuccessful) {
        pszFeedback := pszFeedback is String ? StrPtr(pszFeedback) : pszFeedback

        result := ComCall(16, this, "ptr", pszFeedback, BOOL, fSuccessful, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpRecoResult2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CommitAlternate := CallbackCreate(GetMethod(implObj, "CommitAlternate"), flags, 3)
        this.vtbl.CommitText := CallbackCreate(GetMethod(implObj, "CommitText"), flags, 5)
        this.vtbl.SetTextFeedback := CallbackCreate(GetMethod(implObj, "SetTextFeedback"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CommitAlternate)
        CallbackFree(this.vtbl.CommitText)
        CallbackFree(this.vtbl.SetTextFeedback)
    }
}
