#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechPhraseInfo.ahk" { ISpeechPhraseInfo }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechRecoResult.ahk" { ISpeechRecoResult }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechPhraseAlternate extends IDispatch {
    /**
     * The interface identifier for ISpeechPhraseAlternate
     * @type {Guid}
     */
    static IID := Guid("{27864a2a-2b9f-4cb8-92d3-0d2722fd1e73}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechPhraseAlternate interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RecoResult               : IntPtr
        get_StartElementInResult     : IntPtr
        get_NumberOfElementsInResult : IntPtr
        get_PhraseInfo               : IntPtr
        Commit                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechPhraseAlternate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechRecoResult} 
     */
    RecoResult {
        get => this.get_RecoResult()
    }

    /**
     * @type {Integer} 
     */
    StartElementInResult {
        get => this.get_StartElementInResult()
    }

    /**
     * @type {Integer} 
     */
    NumberOfElementsInResult {
        get => this.get_NumberOfElementsInResult()
    }

    /**
     * @type {ISpeechPhraseInfo} 
     */
    PhraseInfo {
        get => this.get_PhraseInfo()
    }

    /**
     * 
     * @returns {ISpeechRecoResult} 
     */
    get_RecoResult() {
        result := ComCall(7, this, "ptr*", &RecoResult := 0, "HRESULT")
        return ISpeechRecoResult(RecoResult)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartElementInResult() {
        result := ComCall(8, this, "int*", &StartElement := 0, "HRESULT")
        return StartElement
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfElementsInResult() {
        result := ComCall(9, this, "int*", &NumberOfElements := 0, "HRESULT")
        return NumberOfElements
    }

    /**
     * 
     * @returns {ISpeechPhraseInfo} 
     */
    get_PhraseInfo() {
        result := ComCall(10, this, "ptr*", &PhraseInfo := 0, "HRESULT")
        return ISpeechPhraseInfo(PhraseInfo)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechPhraseAlternate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RecoResult := CallbackCreate(GetMethod(implObj, "get_RecoResult"), flags, 2)
        this.vtbl.get_StartElementInResult := CallbackCreate(GetMethod(implObj, "get_StartElementInResult"), flags, 2)
        this.vtbl.get_NumberOfElementsInResult := CallbackCreate(GetMethod(implObj, "get_NumberOfElementsInResult"), flags, 2)
        this.vtbl.get_PhraseInfo := CallbackCreate(GetMethod(implObj, "get_PhraseInfo"), flags, 2)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RecoResult)
        CallbackFree(this.vtbl.get_StartElementInResult)
        CallbackFree(this.vtbl.get_NumberOfElementsInResult)
        CallbackFree(this.vtbl.get_PhraseInfo)
        CallbackFree(this.vtbl.Commit)
    }
}
