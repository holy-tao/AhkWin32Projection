#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseAlternate extends IDispatch{
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
     * 
     * @param {Pointer<ISpeechRecoResult>} RecoResult 
     * @returns {HRESULT} 
     */
    get_RecoResult(RecoResult) {
        result := ComCall(7, this, "ptr", RecoResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} StartElement 
     * @returns {HRESULT} 
     */
    get_StartElementInResult(StartElement) {
        result := ComCall(8, this, "int*", StartElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} NumberOfElements 
     * @returns {HRESULT} 
     */
    get_NumberOfElementsInResult(NumberOfElements) {
        result := ComCall(9, this, "int*", NumberOfElements, "int")
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
        result := ComCall(10, this, "ptr", PhraseInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
