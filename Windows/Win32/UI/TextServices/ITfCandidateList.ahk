#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfCandidates.ahk
#Include .\ITfCandidateString.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCandidateList interface is implemented by a text service and is used by the TSF manager or a client (application or other text service) to obtain and manipulate candidate string objects.
 * @remarks
 * 
 * When a text service must interpret text before it is inserted into a context, there might be more than one possible interpretation of the text. Speech input is an example of this. If the spoken word is "there", other possible interpretations might be "their" or "they're". The text service will insert the most appropriate text, but there is still some chance of error involved. Text reconversion is the process of allowing the user to select alternate text for the inserted text. The alternate text objects are known as candidates.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itfcandidatelist
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCandidateList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCandidateList
     * @type {Guid}
     */
    static IID => Guid("{a3ad50fb-9bdb-49e3-a843-6c76520fbf5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumCandidates", "GetCandidate", "GetCandidateNum", "SetResult"]

    /**
     * 
     * @returns {IEnumTfCandidates} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-enumcandidates
     */
    EnumCandidates() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfCandidates(ppEnum)
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {ITfCandidateString} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-getcandidate
     */
    GetCandidate(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppCand := 0, "HRESULT")
        return ITfCandidateString(ppCand)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-getcandidatenum
     */
    GetCandidateNum() {
        result := ComCall(5, this, "uint*", &pnCnt := 0, "HRESULT")
        return pnCnt
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Integer} imcr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfcandidatelist-setresult
     */
    SetResult(nIndex, imcr) {
        result := ComCall(6, this, "uint", nIndex, "int", imcr, "HRESULT")
        return result
    }
}
