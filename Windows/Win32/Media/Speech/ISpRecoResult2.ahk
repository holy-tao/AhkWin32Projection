#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpRecoResult.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecoResult2 extends ISpRecoResult{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecoResult2
     * @type {Guid}
     */
    static IID => Guid("{27cac6c4-88f2-41f2-8817-0c95e59f1e6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CommitAlternate", "CommitText", "SetTextFeedback"]

    /**
     * 
     * @param {ISpPhraseAlt} pPhraseAlt 
     * @returns {ISpRecoResult} 
     */
    CommitAlternate(pPhraseAlt) {
        result := ComCall(14, this, "ptr", pPhraseAlt, "ptr*", &ppNewResult := 0, "HRESULT")
        return ISpRecoResult(ppNewResult)
    }

    /**
     * 
     * @param {Integer} ulStartElement 
     * @param {Integer} cElements 
     * @param {PWSTR} pszCorrectedData 
     * @param {Integer} eCommitFlags 
     * @returns {HRESULT} 
     */
    CommitText(ulStartElement, cElements, pszCorrectedData, eCommitFlags) {
        pszCorrectedData := pszCorrectedData is String ? StrPtr(pszCorrectedData) : pszCorrectedData

        result := ComCall(15, this, "uint", ulStartElement, "uint", cElements, "ptr", pszCorrectedData, "uint", eCommitFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFeedback 
     * @param {BOOL} fSuccessful 
     * @returns {HRESULT} 
     */
    SetTextFeedback(pszFeedback, fSuccessful) {
        pszFeedback := pszFeedback is String ? StrPtr(pszFeedback) : pszFeedback

        result := ComCall(16, this, "ptr", pszFeedback, "int", fSuccessful, "HRESULT")
        return result
    }
}
