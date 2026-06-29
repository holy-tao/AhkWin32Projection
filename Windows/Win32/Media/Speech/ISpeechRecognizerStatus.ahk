#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISpeechAudioStatus.ahk" { ISpeechAudioStatus }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechRecognizerStatus extends IDispatch {
    /**
     * The interface identifier for ISpeechRecognizerStatus
     * @type {Guid}
     */
    static IID := Guid("{bff9e781-53ec-484e-bb8a-0e1b5551e35c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechRecognizerStatus interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AudioStatus           : IntPtr
        get_CurrentStreamPosition : IntPtr
        get_CurrentStreamNumber   : IntPtr
        get_NumberOfActiveRules   : IntPtr
        get_ClsidEngine           : IntPtr
        get_SupportedLanguages    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechRecognizerStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechAudioStatus} 
     */
    AudioStatus {
        get => this.get_AudioStatus()
    }

    /**
     * @type {VARIANT} 
     */
    CurrentStreamPosition {
        get => this.get_CurrentStreamPosition()
    }

    /**
     * @type {Integer} 
     */
    CurrentStreamNumber {
        get => this.get_CurrentStreamNumber()
    }

    /**
     * @type {Integer} 
     */
    NumberOfActiveRules {
        get => this.get_NumberOfActiveRules()
    }

    /**
     * @type {BSTR} 
     */
    ClsidEngine {
        get => this.get_ClsidEngine()
    }

    /**
     * @type {VARIANT} 
     */
    SupportedLanguages {
        get => this.get_SupportedLanguages()
    }

    /**
     * 
     * @returns {ISpeechAudioStatus} 
     */
    get_AudioStatus() {
        result := ComCall(7, this, "ptr*", &AudioStatus := 0, "HRESULT")
        return ISpeechAudioStatus(AudioStatus)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CurrentStreamPosition() {
        pCurrentStreamPos := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, pCurrentStreamPos, "HRESULT")
        return pCurrentStreamPos
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentStreamNumber() {
        result := ComCall(9, this, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfActiveRules() {
        result := ComCall(10, this, "int*", &NumberOfActiveRules := 0, "HRESULT")
        return NumberOfActiveRules
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClsidEngine() {
        ClsidEngine := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, ClsidEngine, "HRESULT")
        return ClsidEngine
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SupportedLanguages() {
        SupportedLanguages := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, SupportedLanguages, "HRESULT")
        return SupportedLanguages
    }

    Query(iid) {
        if (ISpeechRecognizerStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AudioStatus := CallbackCreate(GetMethod(implObj, "get_AudioStatus"), flags, 2)
        this.vtbl.get_CurrentStreamPosition := CallbackCreate(GetMethod(implObj, "get_CurrentStreamPosition"), flags, 2)
        this.vtbl.get_CurrentStreamNumber := CallbackCreate(GetMethod(implObj, "get_CurrentStreamNumber"), flags, 2)
        this.vtbl.get_NumberOfActiveRules := CallbackCreate(GetMethod(implObj, "get_NumberOfActiveRules"), flags, 2)
        this.vtbl.get_ClsidEngine := CallbackCreate(GetMethod(implObj, "get_ClsidEngine"), flags, 2)
        this.vtbl.get_SupportedLanguages := CallbackCreate(GetMethod(implObj, "get_SupportedLanguages"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AudioStatus)
        CallbackFree(this.vtbl.get_CurrentStreamPosition)
        CallbackFree(this.vtbl.get_CurrentStreamNumber)
        CallbackFree(this.vtbl.get_NumberOfActiveRules)
        CallbackFree(this.vtbl.get_ClsidEngine)
        CallbackFree(this.vtbl.get_SupportedLanguages)
    }
}
