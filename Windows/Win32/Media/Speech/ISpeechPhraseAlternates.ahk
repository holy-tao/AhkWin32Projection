#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechPhraseAlternates extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechPhraseAlternates
     * @type {Guid}
     */
    static IID => Guid("{b238b6d5-f276-4c3d-a6c1-2974801c3cc2}")

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
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ISpeechPhraseAlternate>} PhraseAlternate 
     * @returns {HRESULT} 
     */
    Item(Index, PhraseAlternate) {
        result := ComCall(8, this, "int", Index, "ptr*", PhraseAlternate, "HRESULT")
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
