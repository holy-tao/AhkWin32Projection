#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpRecognizer.ahk
#Include .\ISpRecoGrammar.ahk
#Include .\ISpRecoResult.ahk
#Include .\ISpVoice.ahk
#Include .\ISpEventSource.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoContext extends ISpEventSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecoContext
     * @type {Guid}
     */
    static IID => Guid("{f740a62f-7c15-489e-8234-940a33d9272d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRecognizer", "CreateGrammar", "GetStatus", "GetMaxAlternates", "SetMaxAlternates", "SetAudioOptions", "GetAudioOptions", "DeserializeResult", "Bookmark", "SetAdaptationData", "Pause", "Resume", "SetVoice", "GetVoice", "SetVoicePurgeEvent", "GetVoicePurgeEvent", "SetContextState", "GetContextState"]

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
        result := ComCall(15, this, "ptr", pStatus, "HRESULT")
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
     * @param {Integer} Options 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetAudioOptions(Options, pAudioFormatId, pWaveFormatEx) {
        result := ComCall(18, this, "int", Options, "ptr", pAudioFormatId, "ptr", pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pOptions 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemWFEX 
     * @returns {HRESULT} 
     */
    GetAudioOptions(pOptions, pAudioFormatId, ppCoMemWFEX) {
        pOptionsMarshal := pOptions is VarRef ? "int*" : "ptr"
        ppCoMemWFEXMarshal := ppCoMemWFEX is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, pOptionsMarshal, pOptions, "ptr", pAudioFormatId, ppCoMemWFEXMarshal, ppCoMemWFEX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPSERIALIZEDRESULT>} pSerializedResult 
     * @returns {ISpRecoResult} 
     */
    DeserializeResult(pSerializedResult) {
        result := ComCall(20, this, "ptr", pSerializedResult, "ptr*", &ppResult := 0, "HRESULT")
        return ISpRecoResult(ppResult)
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {Integer} ullStreamPosition 
     * @param {LPARAM} lparamEvent 
     * @returns {HRESULT} 
     */
    Bookmark(Options, ullStreamPosition, lparamEvent) {
        result := ComCall(21, this, "int", Options, "uint", ullStreamPosition, "ptr", lparamEvent, "HRESULT")
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
     * 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    Pause(dwReserved) {
        result := ComCall(23, this, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
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
        result := ComCall(25, this, "ptr", pVoice, "int", fAllowFormatChanges, "HRESULT")
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
     * @param {Integer} eContextState 
     * @returns {HRESULT} 
     */
    SetContextState(eContextState) {
        result := ComCall(29, this, "int", eContextState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peContextState 
     * @returns {HRESULT} 
     */
    GetContextState(peContextState) {
        peContextStateMarshal := peContextState is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, peContextStateMarshal, peContextState, "HRESULT")
        return result
    }
}
