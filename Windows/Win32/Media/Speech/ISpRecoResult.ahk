#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpRecoContext.ahk" { ISpRecoContext }
#Import ".\ISpPhraseAlt.ahk" { ISpPhraseAlt }
#Import ".\ISpPhrase.ahk" { ISpPhrase }
#Import ".\ISpStreamFormat.ahk" { ISpStreamFormat }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\SPSERIALIZEDRESULT.ahk" { SPSERIALIZEDRESULT }
#Import ".\SPRECORESULTTIMES.ahk" { SPRECORESULTTIMES }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecoResult extends ISpPhrase {
    /**
     * The interface identifier for ISpRecoResult
     * @type {Guid}
     */
    static IID := Guid("{20b053be-e235-43cd-9a2a-8d17a48b7842}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecoResult interfaces
    */
    struct Vtbl extends ISpPhrase.Vtbl {
        GetResultTimes : IntPtr
        GetAlternates  : IntPtr
        GetAudio       : IntPtr
        SpeakAudio     : IntPtr
        Serialize      : IntPtr
        ScaleAudio     : IntPtr
        GetRecoContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecoResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SPRECORESULTTIMES>} pTimes 
     * @returns {HRESULT} 
     */
    GetResultTimes(pTimes) {
        result := ComCall(7, this, SPRECORESULTTIMES.Ptr, pTimes, "HRESULT")
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

        result := ComCall(8, this, "uint", ulStartElement, "uint", cElements, "uint", ulRequestCount, "ptr*", &ppPhrases := 0, pcPhrasesReturnedMarshal, pcPhrasesReturned, "HRESULT")
        return ISpPhraseAlt(ppPhrases)
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @returns {ISpStreamFormat} 
     */
    GetAudio(ulStartElement, cElements) {
        result := ComCall(9, this, "uint", ulStartElement, "uint", cElements, "ptr*", &ppStream := 0, "HRESULT")
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

        result := ComCall(10, this, "uint", ulStartElement, "uint", cElements, "uint", dwFlags, pulStreamNumberMarshal, pulStreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPSERIALIZEDRESULT>>} ppCoMemSerializedResult 
     * @returns {HRESULT} 
     */
    Serialize(ppCoMemSerializedResult) {
        ppCoMemSerializedResultMarshal := ppCoMemSerializedResult is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, ppCoMemSerializedResultMarshal, ppCoMemSerializedResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pAudioFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    ScaleAudio(pAudioFormatId, pWaveFormatEx) {
        result := ComCall(12, this, Guid.Ptr, pAudioFormatId, WAVEFORMATEX.Ptr, pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpRecoContext} 
     */
    GetRecoContext() {
        result := ComCall(13, this, "ptr*", &ppRecoContext := 0, "HRESULT")
        return ISpRecoContext(ppRecoContext)
    }

    Query(iid) {
        if (ISpRecoResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResultTimes := CallbackCreate(GetMethod(implObj, "GetResultTimes"), flags, 2)
        this.vtbl.GetAlternates := CallbackCreate(GetMethod(implObj, "GetAlternates"), flags, 6)
        this.vtbl.GetAudio := CallbackCreate(GetMethod(implObj, "GetAudio"), flags, 4)
        this.vtbl.SpeakAudio := CallbackCreate(GetMethod(implObj, "SpeakAudio"), flags, 5)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 2)
        this.vtbl.ScaleAudio := CallbackCreate(GetMethod(implObj, "ScaleAudio"), flags, 3)
        this.vtbl.GetRecoContext := CallbackCreate(GetMethod(implObj, "GetRecoContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResultTimes)
        CallbackFree(this.vtbl.GetAlternates)
        CallbackFree(this.vtbl.GetAudio)
        CallbackFree(this.vtbl.SpeakAudio)
        CallbackFree(this.vtbl.Serialize)
        CallbackFree(this.vtbl.ScaleAudio)
        CallbackFree(this.vtbl.GetRecoContext)
    }
}
