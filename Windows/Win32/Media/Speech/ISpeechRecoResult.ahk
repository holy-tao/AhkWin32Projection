#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoResult extends IDispatch{
    /**
     * The interface identifier for ISpeechRecoResult
     * @type {Guid}
     */
    static IID => Guid("{ed2879cf-ced9-4ee6-a534-de0191d5468d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISpeechRecoContext>} RecoContext 
     * @returns {HRESULT} 
     */
    get_RecoContext(RecoContext) {
        result := ComCall(7, this, "ptr", RecoContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechRecoResultTimes>} Times 
     * @returns {HRESULT} 
     */
    get_Times(Times) {
        result := ComCall(8, this, "ptr", Times, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    putref_AudioFormat(Format) {
        result := ComCall(9, this, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    get_AudioFormat(Format) {
        result := ComCall(10, this, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseInfo>} PhraseInfo 
     * @returns {HRESULT} 
     */
    get_PhraseInfo(PhraseInfo) {
        result := ComCall(11, this, "ptr", PhraseInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RequestCount 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Pointer<ISpeechPhraseAlternates>} Alternates 
     * @returns {HRESULT} 
     */
    Alternates(RequestCount, StartElement, Elements, Alternates) {
        result := ComCall(12, this, "int", RequestCount, "int", StartElement, "int", Elements, "ptr", Alternates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Pointer<ISpeechMemoryStream>} Stream 
     * @returns {HRESULT} 
     */
    Audio(StartElement, Elements, Stream) {
        result := ComCall(13, this, "int", StartElement, "int", Elements, "ptr", Stream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Integer} Flags 
     * @param {Pointer<Int32>} StreamNumber 
     * @returns {HRESULT} 
     */
    SpeakAudio(StartElement, Elements, Flags, StreamNumber) {
        result := ComCall(14, this, "int", StartElement, "int", Elements, "int", Flags, "int*", StreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ResultBlock 
     * @returns {HRESULT} 
     */
    SaveToMemory(ResultBlock) {
        result := ComCall(15, this, "ptr", ResultBlock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ValueTypes 
     * @returns {HRESULT} 
     */
    DiscardResultInfo(ValueTypes) {
        result := ComCall(16, this, "int", ValueTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
