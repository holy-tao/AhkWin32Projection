#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechLexiconWord extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} LangId 
     * @returns {HRESULT} 
     */
    get_LangId(LangId) {
        result := ComCall(7, this, "int*", LangId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} WordType 
     * @returns {HRESULT} 
     */
    get_Type(WordType) {
        result := ComCall(8, this, "int*", WordType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Word 
     * @returns {HRESULT} 
     */
    get_Word(Word) {
        result := ComCall(9, this, "ptr", Word, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechLexiconPronunciations>} Pronunciations 
     * @returns {HRESULT} 
     */
    get_Pronunciations(Pronunciations) {
        result := ComCall(10, this, "ptr", Pronunciations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
