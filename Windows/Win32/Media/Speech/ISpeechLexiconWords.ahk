#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechLexiconWord.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechLexiconWords extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechLexiconWords
     * @type {Guid}
     */
    static IID => Guid("{8d199862-415e-47d5-ac4f-faa608b424e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Item", "get__NewEnum"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ISpeechLexiconWord} 
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &Word := 0, "HRESULT")
        return ISpeechLexiconWord(Word)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &EnumVARIANT := 0, "HRESULT")
        return IUnknown(EnumVARIANT)
    }
}
