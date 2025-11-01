#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechLexiconPronunciations extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechLexiconPronunciations
     * @type {Guid}
     */
    static IID => Guid("{72829128-5682-4704-a0d4-3e2bb6f2ead3}")

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
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ISpeechLexiconPronunciation>} Pronunciation 
     * @returns {HRESULT} 
     */
    Item(Index, Pronunciation) {
        result := ComCall(8, this, "int", Index, "ptr*", Pronunciation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} EnumVARIANT 
     * @returns {HRESULT} 
     */
    get__NewEnum(EnumVARIANT) {
        result := ComCall(9, this, "ptr*", EnumVARIANT, "HRESULT")
        return result
    }
}
