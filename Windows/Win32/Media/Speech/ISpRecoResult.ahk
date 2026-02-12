#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpPhraseAlt.ahk
#Include .\ISpStreamFormat.ahk
#Include .\ISpRecoContext.ahk
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
        result := ComCall(7, this, "ptr", pTimes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @param {Integer} ulRequestCount 
     * @param {Pointer<Integer>} pcPhrasesReturned 
     * @returns {ISpPhraseAlt} 
     */
    GetAlternates(ulStartElement, cElements, ulRequestCount, pcPhrasesReturned) {
        pcPhrasesReturnedMarshal := pcPhrasesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", ulStartElement, "uint", cElements, "uint", ulRequestCount, "ptr*", &ppPhrases := 0, pcPhrasesReturnedMarshal, pcPhrasesReturned, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpPhraseAlt(ppPhrases)
    }

    /**
     * The GetAudioLanguage method retrieves a string indicating which language is available on the specified audio stream.
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @returns {ISpStreamFormat} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/getaudiolanguage-method
     */
    GetAudio(ulStartElement, cElements) {
        result := ComCall(9, this, "uint", ulStartElement, "uint", cElements, "ptr*", &ppStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpStreamFormat(ppStream)
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
        pulStreamNumberMarshal := pulStreamNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "uint", ulStartElement, "uint", cElements, "uint", dwFlags, pulStreamNumberMarshal, pulStreamNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPSERIALIZEDRESULT>>} ppCoMemSerializedResult 
     * @returns {HRESULT} 
     */
    Serialize(ppCoMemSerializedResult) {
        ppCoMemSerializedResultMarshal := ppCoMemSerializedResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, ppCoMemSerializedResultMarshal, ppCoMemSerializedResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    ScaleAudio(pAudioFormatId, pWaveFormatEx) {
        result := ComCall(12, this, "ptr", pAudioFormatId, "ptr", pWaveFormatEx, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISpRecoContext} 
     */
    GetRecoContext() {
        result := ComCall(13, this, "ptr*", &ppRecoContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpRecoContext(ppRecoContext)
    }
}
