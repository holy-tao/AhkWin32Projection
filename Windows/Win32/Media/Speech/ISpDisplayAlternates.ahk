#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpDisplayAlternates extends IUnknown{
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
     * 
     * @param {Pointer<SPDISPLAYPHRASE>} pPhrase 
     * @param {Integer} cRequestCount 
     * @param {Pointer<SPDISPLAYPHRASE>} ppCoMemPhrases 
     * @param {Pointer<UInt32>} pcPhrasesReturned 
     * @returns {HRESULT} 
     */
    GetDisplayAlternates(pPhrase, cRequestCount, ppCoMemPhrases, pcPhrasesReturned) {
        result := ComCall(3, this, "ptr", pPhrase, "uint", cRequestCount, "ptr", ppCoMemPhrases, "uint*", pcPhrasesReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTrailSpace 
     * @returns {HRESULT} 
     */
    SetFullStopTrailSpace(ulTrailSpace) {
        result := ComCall(4, this, "uint", ulTrailSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
