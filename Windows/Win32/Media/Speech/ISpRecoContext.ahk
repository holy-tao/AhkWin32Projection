#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SPSERIALIZEDRESULT.ahk" { SPSERIALIZEDRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\SPCONTEXTSTATE.ahk" { SPCONTEXTSTATE }
#Import ".\ISpRecoResult.ahk" { ISpRecoResult }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\ISpRecoGrammar.ahk" { ISpRecoGrammar }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISpRecognizer.ahk" { ISpRecognizer }
#Import ".\SPRECOCONTEXTSTATUS.ahk" { SPRECOCONTEXTSTATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpEventSource.ahk" { ISpEventSource }
#Import ".\SPBOOKMARKOPTIONS.ahk" { SPBOOKMARKOPTIONS }
#Import ".\SPAUDIOOPTIONS.ahk" { SPAUDIOOPTIONS }
#Import ".\ISpVoice.ahk" { ISpVoice }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecoContext extends ISpEventSource {
    /**
     * The interface identifier for ISpRecoContext
     * @type {Guid}
     */
    static IID := Guid("{f740a62f-7c15-489e-8234-940a33d9272d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecoContext interfaces
    */
    struct Vtbl extends ISpEventSource.Vtbl {
        GetRecognizer      : IntPtr
        CreateGrammar      : IntPtr
        GetStatus          : IntPtr
        GetMaxAlternates   : IntPtr
        SetMaxAlternates   : IntPtr
        SetAudioOptions    : IntPtr
        GetAudioOptions    : IntPtr
        DeserializeResult  : IntPtr
        Bookmark           : IntPtr
        SetAdaptationData  : IntPtr
        Pause              : IntPtr
        Resume             : IntPtr
        SetVoice           : IntPtr
        GetVoice           : IntPtr
        SetVoicePurgeEvent : IntPtr
        GetVoicePurgeEvent : IntPtr
        SetContextState    : IntPtr
        GetContextState    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecoContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ISpRecognizer} 
     */
    GetRecognizer() {
        result := ComCall(13, this, "ptr*", &ppRecognizer := 0, "HRESULT")
        return ISpRecognizer(ppRecognizer)
    }

    /**
     * 
     * @param {Integer} ullGrammarId 
     * @returns {ISpRecoGrammar} 
     */
    CreateGrammar(ullGrammarId) {
        result := ComCall(14, this, "uint", ullGrammarId, "ptr*", &ppGrammar := 0, "HRESULT")
        return ISpRecoGrammar(ppGrammar)
    }

    /**
     * 
     * @param {Pointer<SPRECOCONTEXTSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(15, this, SPRECOCONTEXTSTATUS.Ptr, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcAlternates 
     * @returns {HRESULT} 
     */
    GetMaxAlternates(pcAlternates) {
        pcAlternatesMarshal := pcAlternates is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pcAlternatesMarshal, pcAlternates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cAlternates 
     * @returns {HRESULT} 
     */
    SetMaxAlternates(cAlternates) {
        result := ComCall(17, this, "uint", cAlternates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPAUDIOOPTIONS} Options 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetAudioOptions(Options, pAudioFormatId, pWaveFormatEx) {
        result := ComCall(18, this, SPAUDIOOPTIONS, Options, Guid.Ptr, pAudioFormatId, WAVEFORMATEX.Ptr, pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOOPTIONS>} pOptions 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemWFEX 
     * @returns {HRESULT} 
     */
    GetAudioOptions(pOptions, pAudioFormatId, ppCoMemWFEX) {
        pOptionsMarshal := pOptions is VarRef ? "int*" : "ptr"
        ppCoMemWFEXMarshal := ppCoMemWFEX is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, pOptionsMarshal, pOptions, Guid.Ptr, pAudioFormatId, ppCoMemWFEXMarshal, ppCoMemWFEX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPSERIALIZEDRESULT>} pSerializedResult 
     * @returns {ISpRecoResult} 
     */
    DeserializeResult(pSerializedResult) {
        result := ComCall(20, this, SPSERIALIZEDRESULT.Ptr, pSerializedResult, "ptr*", &ppResult := 0, "HRESULT")
        return ISpRecoResult(ppResult)
    }

    /**
     * 
     * @param {SPBOOKMARKOPTIONS} Options 
     * @param {Integer} ullStreamPosition 
     * @param {LPARAM} lparamEvent 
     * @returns {HRESULT} 
     */
    Bookmark(Options, ullStreamPosition, lparamEvent) {
        result := ComCall(21, this, SPBOOKMARKOPTIONS, Options, "uint", ullStreamPosition, LPARAM, lparamEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAdaptationData 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    SetAdaptationData(pAdaptationData, cch) {
        pAdaptationData := pAdaptationData is String ? StrPtr(pAdaptationData) : pAdaptationData

        result := ComCall(22, this, "ptr", pAdaptationData, "uint", cch, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @param {Integer} dwReserved 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause(dwReserved) {
        result := ComCall(23, this, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @param {Integer} dwReserved 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume(dwReserved) {
        result := ComCall(24, this, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpVoice} pVoice 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetVoice(pVoice, fAllowFormatChanges) {
        result := ComCall(25, this, "ptr", pVoice, BOOL, fAllowFormatChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpVoice} 
     */
    GetVoice() {
        result := ComCall(26, this, "ptr*", &ppVoice := 0, "HRESULT")
        return ISpVoice(ppVoice)
    }

    /**
     * 
     * @param {Integer} ullEventInterest 
     * @returns {HRESULT} 
     */
    SetVoicePurgeEvent(ullEventInterest) {
        result := ComCall(27, this, "uint", ullEventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pullEventInterest 
     * @returns {HRESULT} 
     */
    GetVoicePurgeEvent(pullEventInterest) {
        pullEventInterestMarshal := pullEventInterest is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, pullEventInterestMarshal, pullEventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPCONTEXTSTATE} eContextState 
     * @returns {HRESULT} 
     */
    SetContextState(eContextState) {
        result := ComCall(29, this, SPCONTEXTSTATE, eContextState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPCONTEXTSTATE>} peContextState 
     * @returns {HRESULT} 
     */
    GetContextState(peContextState) {
        peContextStateMarshal := peContextState is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, peContextStateMarshal, peContextState, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpRecoContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRecognizer := CallbackCreate(GetMethod(implObj, "GetRecognizer"), flags, 2)
        this.vtbl.CreateGrammar := CallbackCreate(GetMethod(implObj, "CreateGrammar"), flags, 3)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetMaxAlternates := CallbackCreate(GetMethod(implObj, "GetMaxAlternates"), flags, 2)
        this.vtbl.SetMaxAlternates := CallbackCreate(GetMethod(implObj, "SetMaxAlternates"), flags, 2)
        this.vtbl.SetAudioOptions := CallbackCreate(GetMethod(implObj, "SetAudioOptions"), flags, 4)
        this.vtbl.GetAudioOptions := CallbackCreate(GetMethod(implObj, "GetAudioOptions"), flags, 4)
        this.vtbl.DeserializeResult := CallbackCreate(GetMethod(implObj, "DeserializeResult"), flags, 3)
        this.vtbl.Bookmark := CallbackCreate(GetMethod(implObj, "Bookmark"), flags, 4)
        this.vtbl.SetAdaptationData := CallbackCreate(GetMethod(implObj, "SetAdaptationData"), flags, 3)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 2)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 2)
        this.vtbl.SetVoice := CallbackCreate(GetMethod(implObj, "SetVoice"), flags, 3)
        this.vtbl.GetVoice := CallbackCreate(GetMethod(implObj, "GetVoice"), flags, 2)
        this.vtbl.SetVoicePurgeEvent := CallbackCreate(GetMethod(implObj, "SetVoicePurgeEvent"), flags, 2)
        this.vtbl.GetVoicePurgeEvent := CallbackCreate(GetMethod(implObj, "GetVoicePurgeEvent"), flags, 2)
        this.vtbl.SetContextState := CallbackCreate(GetMethod(implObj, "SetContextState"), flags, 2)
        this.vtbl.GetContextState := CallbackCreate(GetMethod(implObj, "GetContextState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRecognizer)
        CallbackFree(this.vtbl.CreateGrammar)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetMaxAlternates)
        CallbackFree(this.vtbl.SetMaxAlternates)
        CallbackFree(this.vtbl.SetAudioOptions)
        CallbackFree(this.vtbl.GetAudioOptions)
        CallbackFree(this.vtbl.DeserializeResult)
        CallbackFree(this.vtbl.Bookmark)
        CallbackFree(this.vtbl.SetAdaptationData)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.SetVoice)
        CallbackFree(this.vtbl.GetVoice)
        CallbackFree(this.vtbl.SetVoicePurgeEvent)
        CallbackFree(this.vtbl.GetVoicePurgeEvent)
        CallbackFree(this.vtbl.SetContextState)
        CallbackFree(this.vtbl.GetContextState)
    }
}
