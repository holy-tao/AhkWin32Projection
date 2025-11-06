#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SPTRANSITIONENTRY.ahk
#Include .\ISpSREngineSite.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpSREngineSite2 extends ISpSREngineSite{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpSREngineSite2
     * @type {Guid}
     */
    static IID => Guid("{7bc6e012-684a-493e-bdd4-2bf5fbf48cfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddEventEx", "UpdateRecoPosEx", "GetRuleTransition", "RecognitionEx"]

    /**
     * 
     * @param {Pointer<SPEVENTEX>} pEvent 
     * @param {SPRECOCONTEXTHANDLE} hSAPIRecoContext 
     * @returns {HRESULT} 
     */
    AddEventEx(pEvent, hSAPIRecoContext) {
        hSAPIRecoContext := hSAPIRecoContext is Win32Handle ? NumGet(hSAPIRecoContext, "ptr") : hSAPIRecoContext

        result := ComCall(21, this, "ptr", pEvent, "ptr", hSAPIRecoContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullCurrentRecoPos 
     * @param {Integer} ullCurrentRecoTime 
     * @returns {HRESULT} 
     */
    UpdateRecoPosEx(ullCurrentRecoPos, ullCurrentRecoTime) {
        result := ComCall(22, this, "uint", ullCurrentRecoPos, "uint", ullCurrentRecoTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulGrammarID 
     * @param {Integer} RuleIndex 
     * @returns {SPTRANSITIONENTRY} 
     */
    GetRuleTransition(ulGrammarID, RuleIndex) {
        pTrans := SPTRANSITIONENTRY()
        result := ComCall(23, this, "uint", ulGrammarID, "uint", RuleIndex, "ptr", pTrans, "HRESULT")
        return pTrans
    }

    /**
     * 
     * @param {Pointer<SPRECORESULTINFOEX>} pResultInfo 
     * @returns {HRESULT} 
     */
    RecognitionEx(pResultInfo) {
        result := ComCall(24, this, "ptr", pResultInfo, "HRESULT")
        return result
    }
}
