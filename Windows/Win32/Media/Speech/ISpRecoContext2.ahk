#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoContext2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecoContext2
     * @type {Guid}
     */
    static IID => Guid("{bead311c-52ff-437f-9464-6b21054ca73d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGrammarOptions", "GetGrammarOptions", "SetAdaptationData2"]

    /**
     * 
     * @param {Integer} eGrammarOptions 
     * @returns {HRESULT} 
     */
    SetGrammarOptions(eGrammarOptions) {
        result := ComCall(3, this, "uint", eGrammarOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peGrammarOptions 
     * @returns {HRESULT} 
     */
    GetGrammarOptions(peGrammarOptions) {
        result := ComCall(4, this, "uint*", peGrammarOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAdaptationData 
     * @param {Integer} cch 
     * @param {PWSTR} pTopicName 
     * @param {Integer} eAdaptationSettings 
     * @param {Integer} eRelevance 
     * @returns {HRESULT} 
     */
    SetAdaptationData2(pAdaptationData, cch, pTopicName, eAdaptationSettings, eRelevance) {
        pAdaptationData := pAdaptationData is String ? StrPtr(pAdaptationData) : pAdaptationData
        pTopicName := pTopicName is String ? StrPtr(pTopicName) : pTopicName

        result := ComCall(5, this, "ptr", pAdaptationData, "uint", cch, "ptr", pTopicName, "uint", eAdaptationSettings, "int", eRelevance, "HRESULT")
        return result
    }
}
