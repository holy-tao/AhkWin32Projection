#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoResult extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecoContext", "get_Times", "putref_AudioFormat", "get_AudioFormat", "get_PhraseInfo", "Alternates", "Audio", "SpeakAudio", "SaveToMemory", "DiscardResultInfo"]

    /**
     * 
     * @param {Pointer<ISpeechRecoContext>} RecoContext 
     * @returns {HRESULT} 
     */
    get_RecoContext(RecoContext) {
        result := ComCall(7, this, "ptr*", RecoContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechRecoResultTimes>} Times 
     * @returns {HRESULT} 
     */
    get_Times(Times) {
        result := ComCall(8, this, "ptr*", Times, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpeechAudioFormat} Format 
     * @returns {HRESULT} 
     */
    putref_AudioFormat(Format) {
        result := ComCall(9, this, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} Format 
     * @returns {HRESULT} 
     */
    get_AudioFormat(Format) {
        result := ComCall(10, this, "ptr*", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseInfo>} PhraseInfo 
     * @returns {HRESULT} 
     */
    get_PhraseInfo(PhraseInfo) {
        result := ComCall(11, this, "ptr*", PhraseInfo, "HRESULT")
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
        result := ComCall(12, this, "int", RequestCount, "int", StartElement, "int", Elements, "ptr*", Alternates, "HRESULT")
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
        result := ComCall(13, this, "int", StartElement, "int", Elements, "ptr*", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartElement 
     * @param {Integer} Elements 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} StreamNumber 
     * @returns {HRESULT} 
     */
    SpeakAudio(StartElement, Elements, Flags, StreamNumber) {
        result := ComCall(14, this, "int", StartElement, "int", Elements, "int", Flags, "int*", StreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} ResultBlock 
     * @returns {HRESULT} 
     */
    SaveToMemory(ResultBlock) {
        result := ComCall(15, this, "ptr", ResultBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ValueTypes 
     * @returns {HRESULT} 
     */
    DiscardResultInfo(ValueTypes) {
        result := ComCall(16, this, "int", ValueTypes, "HRESULT")
        return result
    }
}
