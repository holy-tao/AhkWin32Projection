#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &LexiconType := 0, "HRESULT")
        return LexiconType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LangId() {
        result := ComCall(8, this, "int*", &LangId := 0, "HRESULT")
        return LangId
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartOfSpeech() {
        result := ComCall(9, this, "int*", &PartOfSpeech := 0, "HRESULT")
        return PartOfSpeech
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PhoneIds() {
        PhoneIds := VARIANT()
        result := ComCall(10, this, "ptr", PhoneIds, "HRESULT")
        return PhoneIds
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Symbolic() {
        Symbolic := BSTR()
        result := ComCall(11, this, "ptr", Symbolic, "HRESULT")
        return Symbolic
    }
}
