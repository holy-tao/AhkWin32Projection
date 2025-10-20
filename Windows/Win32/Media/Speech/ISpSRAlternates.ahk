#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSRAlternates extends IUnknown{
    /**
     * The interface identifier for ISpSRAlternates
     * @type {Guid}
     */
    static IID => Guid("{fece8294-2be1-408f-8e68-2de377092f0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SPPHRASEALTREQUEST>} pAltRequest 
     * @param {Pointer<SPPHRASEALT>} ppAlts 
     * @param {Pointer<UInt32>} pcAlts 
     * @returns {HRESULT} 
     */
    GetAlternates(pAltRequest, ppAlts, pcAlts) {
        result := ComCall(3, this, "ptr", pAltRequest, "ptr", ppAlts, "uint*", pcAlts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPPHRASEALTREQUEST>} pAltRequest 
     * @param {Pointer<SPPHRASEALT>} pAlt 
     * @param {Pointer<Void>} ppvResultExtra 
     * @param {Pointer<UInt32>} pcbResultExtra 
     * @returns {HRESULT} 
     */
    Commit(pAltRequest, pAlt, ppvResultExtra, pcbResultExtra) {
        result := ComCall(4, this, "ptr", pAltRequest, "ptr", pAlt, "ptr", ppvResultExtra, "uint*", pcbResultExtra, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
