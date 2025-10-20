#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpEventSource.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoContext extends ISpEventSource{
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
     * 
     * @param {Pointer<ISpRecognizer>} ppRecognizer 
     * @returns {HRESULT} 
     */
    GetRecognizer(ppRecognizer) {
        result := ComCall(13, this, "ptr", ppRecognizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullGrammarId 
     * @param {Pointer<ISpRecoGrammar>} ppGrammar 
     * @returns {HRESULT} 
     */
    CreateGrammar(ullGrammarId, ppGrammar) {
        result := ComCall(14, this, "uint", ullGrammarId, "ptr", ppGrammar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPRECOCONTEXTSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(15, this, "ptr", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcAlternates 
     * @returns {HRESULT} 
     */
    GetMaxAlternates(pcAlternates) {
        result := ComCall(16, this, "uint*", pcAlternates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cAlternates 
     * @returns {HRESULT} 
     */
    SetMaxAlternates(cAlternates) {
        result := ComCall(17, this, "uint", cAlternates, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(18, this, "int", Options, "ptr", pAudioFormatId, "ptr", pWaveFormatEx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pOptions 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<WAVEFORMATEX>} ppCoMemWFEX 
     * @returns {HRESULT} 
     */
    GetAudioOptions(pOptions, pAudioFormatId, ppCoMemWFEX) {
        result := ComCall(19, this, "int*", pOptions, "ptr", pAudioFormatId, "ptr", ppCoMemWFEX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPSERIALIZEDRESULT>} pSerializedResult 
     * @param {Pointer<ISpRecoResult>} ppResult 
     * @returns {HRESULT} 
     */
    DeserializeResult(pSerializedResult, ppResult) {
        result := ComCall(20, this, "ptr", pSerializedResult, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {Integer} ullStreamPosition 
     * @param {LPARAM} lparamEvent 
     * @returns {HRESULT} 
     */
    Bookmark(Options, ullStreamPosition, lparamEvent) {
        result := ComCall(21, this, "int", Options, "uint", ullStreamPosition, "ptr", lparamEvent, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(22, this, "ptr", pAdaptationData, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    Pause(dwReserved) {
        result := ComCall(23, this, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    Resume(dwReserved) {
        result := ComCall(24, this, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpVoice>} pVoice 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetVoice(pVoice, fAllowFormatChanges) {
        result := ComCall(25, this, "ptr", pVoice, "int", fAllowFormatChanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpVoice>} ppVoice 
     * @returns {HRESULT} 
     */
    GetVoice(ppVoice) {
        result := ComCall(26, this, "ptr", ppVoice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullEventInterest 
     * @returns {HRESULT} 
     */
    SetVoicePurgeEvent(ullEventInterest) {
        result := ComCall(27, this, "uint", ullEventInterest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pullEventInterest 
     * @returns {HRESULT} 
     */
    GetVoicePurgeEvent(pullEventInterest) {
        result := ComCall(28, this, "uint*", pullEventInterest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eContextState 
     * @returns {HRESULT} 
     */
    SetContextState(eContextState) {
        result := ComCall(29, this, "int", eContextState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peContextState 
     * @returns {HRESULT} 
     */
    GetContextState(peContextState) {
        result := ComCall(30, this, "int*", peContextState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
