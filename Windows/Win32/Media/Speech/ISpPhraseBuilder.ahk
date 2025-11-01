#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpPhrase.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhraseBuilder extends ISpPhrase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpPhraseBuilder
     * @type {Guid}
     */
    static IID => Guid("{88a3342a-0bed-4834-922b-88d43173162f}")

    /**
     * The class identifier for SpPhraseBuilder
     * @type {Guid}
     */
    static CLSID => Guid("{777b6bbd-2ff2-11d3-88fe-00c04f8ef9b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitFromPhrase", "InitFromSerializedPhrase", "AddElements", "AddRules", "AddProperties", "AddReplacements"]

    /**
     * 
     * @param {Pointer<SPPHRASE>} pPhrase 
     * @returns {HRESULT} 
     */
    InitFromPhrase(pPhrase) {
        result := ComCall(7, this, "ptr", pPhrase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPSERIALIZEDPHRASE>} pPhrase 
     * @returns {HRESULT} 
     */
    InitFromSerializedPhrase(pPhrase) {
        result := ComCall(8, this, "ptr", pPhrase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElements 
     * @param {Pointer<SPPHRASEELEMENT>} pElement 
     * @returns {HRESULT} 
     */
    AddElements(cElements, pElement) {
        result := ComCall(9, this, "uint", cElements, "ptr", pElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPPHRASERULEHANDLE} hParent 
     * @param {Pointer<SPPHRASERULE>} pRule 
     * @param {Pointer<SPPHRASERULEHANDLE>} phNewRule 
     * @returns {HRESULT} 
     */
    AddRules(hParent, pRule, phNewRule) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(10, this, "ptr", hParent, "ptr", pRule, "ptr", phNewRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SPPHRASEPROPERTYHANDLE} hParent 
     * @param {Pointer<SPPHRASEPROPERTY>} pProperty 
     * @param {Pointer<SPPHRASEPROPERTYHANDLE>} phNewProperty 
     * @returns {HRESULT} 
     */
    AddProperties(hParent, pProperty, phNewProperty) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(11, this, "ptr", hParent, "ptr", pProperty, "ptr", phNewProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cReplacements 
     * @param {Pointer<SPPHRASEREPLACEMENT>} pReplacements 
     * @returns {HRESULT} 
     */
    AddReplacements(cReplacements, pReplacements) {
        result := ComCall(12, this, "uint", cReplacements, "ptr", pReplacements, "HRESULT")
        return result
    }
}
