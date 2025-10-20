#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoContext2 extends IUnknown{
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
     * 
     * @param {Integer} eGrammarOptions 
     * @returns {HRESULT} 
     */
    SetGrammarOptions(eGrammarOptions) {
        result := ComCall(3, this, "uint", eGrammarOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} peGrammarOptions 
     * @returns {HRESULT} 
     */
    GetGrammarOptions(peGrammarOptions) {
        result := ComCall(4, this, "uint*", peGrammarOptions, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(5, this, "ptr", pAdaptationData, "uint", cch, "ptr", pTopicName, "uint", eAdaptationSettings, "int", eRelevance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
