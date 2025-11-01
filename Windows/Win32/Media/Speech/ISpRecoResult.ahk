#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpPhrase.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoResult extends ISpPhrase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecoResult
     * @type {Guid}
     */
    static IID => Guid("{20b053be-e235-43cd-9a2a-8d17a48b7842}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResultTimes", "GetAlternates", "GetAudio", "SpeakAudio", "Serialize", "ScaleAudio", "GetRecoContext"]

    /**
     * 
     * @param {Pointer<SPRECORESULTTIMES>} pTimes 
     * @returns {HRESULT} 
     */
    GetResultTimes(pTimes) {
        result := ComCall(7, this, "ptr", pTimes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @param {Integer} ulRequestCount 
     * @param {Pointer<ISpPhraseAlt>} ppPhrases 
     * @param {Pointer<Integer>} pcPhrasesReturned 
     * @returns {HRESULT} 
     */
    GetAlternates(ulStartElement, cElements, ulRequestCount, ppPhrases, pcPhrasesReturned) {
        result := ComCall(8, this, "uint", ulStartElement, "uint", cElements, "uint", ulRequestCount, "ptr*", ppPhrases, "uint*", pcPhrasesReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @param {Pointer<ISpStreamFormat>} ppStream 
     * @returns {HRESULT} 
     */
    GetAudio(ulStartElement, cElements, ppStream) {
        result := ComCall(9, this, "uint", ulStartElement, "uint", cElements, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pulStreamNumber 
     * @returns {HRESULT} 
     */
    SpeakAudio(ulStartElement, cElements, dwFlags, pulStreamNumber) {
        result := ComCall(10, this, "uint", ulStartElement, "uint", cElements, "uint", dwFlags, "uint*", pulStreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPSERIALIZEDRESULT>>} ppCoMemSerializedResult 
     * @returns {HRESULT} 
     */
    Serialize(ppCoMemSerializedResult) {
        result := ComCall(11, this, "ptr*", ppCoMemSerializedResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    ScaleAudio(pAudioFormatId, pWaveFormatEx) {
        result := ComCall(12, this, "ptr", pAudioFormatId, "ptr", pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpRecoContext>} ppRecoContext 
     * @returns {HRESULT} 
     */
    GetRecoContext(ppRecoContext) {
        result := ComCall(13, this, "ptr*", ppRecoContext, "HRESULT")
        return result
    }
}
