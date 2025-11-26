#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechLexiconPronunciations.ahk
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
     * @type {Integer} 
     */
    LangId {
        get => this.get_LangId()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    Word {
        get => this.get_Word()
    }

    /**
     * @type {ISpeechLexiconPronunciations} 
     */
    Pronunciations {
        get => this.get_Pronunciations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LangId() {
        result := ComCall(7, this, "int*", &LangId := 0, "HRESULT")
        return LangId
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(8, this, "int*", &WordType := 0, "HRESULT")
        return WordType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Word() {
        Word := BSTR()
        result := ComCall(9, this, "ptr", Word, "HRESULT")
        return Word
    }

    /**
     * 
     * @returns {ISpeechLexiconPronunciations} 
     */
    get_Pronunciations() {
        result := ComCall(10, this, "ptr*", &Pronunciations := 0, "HRESULT")
        return ISpeechLexiconPronunciations(Pronunciations)
    }
}
