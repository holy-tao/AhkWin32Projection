#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpDisplayAlternates extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpDisplayAlternates
     * @type {Guid}
     */
    static IID => Guid("{c8d7c7e2-0dde-44b7-afe3-b0c991fbeb5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayAlternates", "SetFullStopTrailSpace"]

    /**
     * 
     * @param {Pointer<SPDISPLAYPHRASE>} pPhrase 
     * @param {Integer} cRequestCount 
     * @param {Pointer<Pointer<SPDISPLAYPHRASE>>} ppCoMemPhrases 
     * @param {Pointer<Integer>} pcPhrasesReturned 
     * @returns {HRESULT} 
     */
    GetDisplayAlternates(pPhrase, cRequestCount, ppCoMemPhrases, pcPhrasesReturned) {
        pcPhrasesReturnedMarshal := pcPhrasesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pPhrase, "uint", cRequestCount, "ptr*", ppCoMemPhrases, pcPhrasesReturnedMarshal, pcPhrasesReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTrailSpace 
     * @returns {HRESULT} 
     */
    SetFullStopTrailSpace(ulTrailSpace) {
        result := ComCall(4, this, "uint", ulTrailSpace, "HRESULT")
        return result
    }
}
