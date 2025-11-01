#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechLexiconWord extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechLexiconWord
     * @type {Guid}
     */
    static IID => Guid("{4e5b933c-c9be-48ed-8842-1ee51bb1d4ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LangId", "get_Type", "get_Word", "get_Pronunciations"]

    /**
     * 
     * @param {Pointer<Integer>} LangId 
     * @returns {HRESULT} 
     */
    get_LangId(LangId) {
        LangIdMarshal := LangId is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, LangIdMarshal, LangId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} WordType 
     * @returns {HRESULT} 
     */
    get_Type(WordType) {
        WordTypeMarshal := WordType is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, WordTypeMarshal, WordType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Word 
     * @returns {HRESULT} 
     */
    get_Word(Word) {
        result := ComCall(9, this, "ptr", Word, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechLexiconPronunciations>} Pronunciations 
     * @returns {HRESULT} 
     */
    get_Pronunciations(Pronunciations) {
        result := ComCall(10, this, "ptr*", Pronunciations, "HRESULT")
        return result
    }
}
