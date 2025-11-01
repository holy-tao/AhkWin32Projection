#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhrase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpPhrase
     * @type {Guid}
     */
    static IID => Guid("{1a5c0354-b621-4b5a-8791-d306ed379e53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPhrase", "GetSerializedPhrase", "GetText", "Discard"]

    /**
     * 
     * @param {Pointer<Pointer<SPPHRASE>>} ppCoMemPhrase 
     * @returns {HRESULT} 
     */
    GetPhrase(ppCoMemPhrase) {
        result := ComCall(3, this, "ptr*", ppCoMemPhrase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPSERIALIZEDPHRASE>>} ppCoMemPhrase 
     * @returns {HRESULT} 
     */
    GetSerializedPhrase(ppCoMemPhrase) {
        result := ComCall(4, this, "ptr*", ppCoMemPhrase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStart 
     * @param {Integer} ulCount 
     * @param {BOOL} fUseTextReplacements 
     * @param {Pointer<PWSTR>} ppszCoMemText 
     * @param {Pointer<Integer>} pbDisplayAttributes 
     * @returns {HRESULT} 
     */
    GetText(ulStart, ulCount, fUseTextReplacements, ppszCoMemText, pbDisplayAttributes) {
        result := ComCall(5, this, "uint", ulStart, "uint", ulCount, "int", fUseTextReplacements, "ptr", ppszCoMemText, "char*", pbDisplayAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwValueTypes 
     * @returns {HRESULT} 
     */
    Discard(dwValueTypes) {
        result := ComCall(6, this, "uint", dwValueTypes, "HRESULT")
        return result
    }
}
