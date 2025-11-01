#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpGrammarBuilder2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpGrammarBuilder2
     * @type {Guid}
     */
    static IID => Guid("{8ab10026-20cc-4b20-8c22-a49c9ba78f60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTextSubset", "SetPhoneticAlphabet"]

    /**
     * 
     * @param {SPSTATEHANDLE} hFromState 
     * @param {SPSTATEHANDLE} hToState 
     * @param {PWSTR} psz 
     * @param {Integer} eMatchMode 
     * @returns {HRESULT} 
     */
    AddTextSubset(hFromState, hToState, psz, eMatchMode) {
        hFromState := hFromState is Win32Handle ? NumGet(hFromState, "ptr") : hFromState
        hToState := hToState is Win32Handle ? NumGet(hToState, "ptr") : hToState
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(3, this, "ptr", hFromState, "ptr", hToState, "ptr", psz, "int", eMatchMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} phoneticALphabet 
     * @returns {HRESULT} 
     */
    SetPhoneticAlphabet(phoneticALphabet) {
        result := ComCall(4, this, "int", phoneticALphabet, "HRESULT")
        return result
    }
}
