#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPWORDPRONUNCIATIONLIST.ahk" { SPWORDPRONUNCIATIONLIST }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPNORMALIZATIONLIST.ahk" { SPNORMALIZATIONLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpEnginePronunciation extends IUnknown {
    /**
     * The interface identifier for ISpEnginePronunciation
     * @type {Guid}
     */
    static IID := Guid("{c360ce4b-76d1-4214-ad68-52657d5083da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpEnginePronunciation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Normalize         : IntPtr
        GetPronunciations : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpEnginePronunciation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {PWSTR} pszLeftContext 
     * @param {PWSTR} pszRightContext 
     * @param {Integer} LangID 
     * @param {Pointer<SPNORMALIZATIONLIST>} pNormalizationList 
     * @returns {HRESULT} 
     */
    Normalize(pszWord, pszLeftContext, pszRightContext, LangID, pNormalizationList) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord
        pszLeftContext := pszLeftContext is String ? StrPtr(pszLeftContext) : pszLeftContext
        pszRightContext := pszRightContext is String ? StrPtr(pszRightContext) : pszRightContext

        result := ComCall(3, this, "ptr", pszWord, "ptr", pszLeftContext, "ptr", pszRightContext, "ushort", LangID, SPNORMALIZATIONLIST.Ptr, pNormalizationList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszWord 
     * @param {PWSTR} pszLeftContext 
     * @param {PWSTR} pszRightContext 
     * @param {Integer} LangID 
     * @param {Pointer<SPWORDPRONUNCIATIONLIST>} pEnginePronunciationList 
     * @returns {HRESULT} 
     */
    GetPronunciations(pszWord, pszLeftContext, pszRightContext, LangID, pEnginePronunciationList) {
        pszWord := pszWord is String ? StrPtr(pszWord) : pszWord
        pszLeftContext := pszLeftContext is String ? StrPtr(pszLeftContext) : pszLeftContext
        pszRightContext := pszRightContext is String ? StrPtr(pszRightContext) : pszRightContext

        result := ComCall(4, this, "ptr", pszWord, "ptr", pszLeftContext, "ptr", pszRightContext, "ushort", LangID, SPWORDPRONUNCIATIONLIST.Ptr, pEnginePronunciationList, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpEnginePronunciation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Normalize := CallbackCreate(GetMethod(implObj, "Normalize"), flags, 6)
        this.vtbl.GetPronunciations := CallbackCreate(GetMethod(implObj, "GetPronunciations"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Normalize)
        CallbackFree(this.vtbl.GetPronunciations)
    }
}
