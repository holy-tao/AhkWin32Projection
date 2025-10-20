#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechLexiconPronunciation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechLexiconPronunciation
     * @type {Guid}
     */
    static IID => Guid("{95252c5d-9e43-4f4a-9899-48ee73352f9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_LangId", "get_PartOfSpeech", "get_PhoneIds", "get_Symbolic"]

    /**
     * 
     * @param {Pointer<Integer>} LexiconType 
     * @returns {HRESULT} 
     */
    get_Type(LexiconType) {
        result := ComCall(7, this, "int*", LexiconType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} LangId 
     * @returns {HRESULT} 
     */
    get_LangId(LangId) {
        result := ComCall(8, this, "int*", LangId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PartOfSpeech 
     * @returns {HRESULT} 
     */
    get_PartOfSpeech(PartOfSpeech) {
        result := ComCall(9, this, "int*", PartOfSpeech, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PhoneIds 
     * @returns {HRESULT} 
     */
    get_PhoneIds(PhoneIds) {
        result := ComCall(10, this, "ptr", PhoneIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Symbolic 
     * @returns {HRESULT} 
     */
    get_Symbolic(Symbolic) {
        result := ComCall(11, this, "ptr", Symbolic, "HRESULT")
        return result
    }
}
