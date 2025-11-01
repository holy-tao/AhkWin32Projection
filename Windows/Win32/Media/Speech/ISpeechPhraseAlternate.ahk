#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseAlternate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseAlternate
     * @type {Guid}
     */
    static IID => Guid("{27864a2a-2b9f-4cb8-92d3-0d2722fd1e73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecoResult", "get_StartElementInResult", "get_NumberOfElementsInResult", "get_PhraseInfo", "Commit"]

    /**
     * 
     * @param {Pointer<ISpeechRecoResult>} RecoResult 
     * @returns {HRESULT} 
     */
    get_RecoResult(RecoResult) {
        result := ComCall(7, this, "ptr*", RecoResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} StartElement 
     * @returns {HRESULT} 
     */
    get_StartElementInResult(StartElement) {
        result := ComCall(8, this, "int*", StartElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NumberOfElements 
     * @returns {HRESULT} 
     */
    get_NumberOfElementsInResult(NumberOfElements) {
        result := ComCall(9, this, "int*", NumberOfElements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechPhraseInfo>} PhraseInfo 
     * @returns {HRESULT} 
     */
    get_PhraseInfo(PhraseInfo) {
        result := ComCall(10, this, "ptr*", PhraseInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
