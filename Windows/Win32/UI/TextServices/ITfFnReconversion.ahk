#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfCandidateList.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnReconversion interface is implemented by a text service and is used by the TSF manager or a client to support reconversion of text provided by the text service.
 * @remarks
 * 
  * When a text service must interpret text before it is inserted into a context, there might be more than one possible interpretation of the text. Speech input is an example of this. If the spoken word is "there", other possible interpretations might be "their" or "they're". The text service will insert the most appropriate text, but there is still some chance of error involved. Text reconversion is the process of allowing the user to select alternate text for the inserted text.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnreconversion
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnReconversion extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnReconversion
     * @type {Guid}
     */
    static IID => Guid("{4cea93c0-0a58-11d3-8df0-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryRange", "GetReconversion", "Reconvert"]

    /**
     * 
     * @param {ITfRange} pRange 
     * @param {Pointer<ITfRange>} ppNewRange 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnreconversion-queryrange
     */
    QueryRange(pRange, ppNewRange) {
        result := ComCall(4, this, "ptr", pRange, "ptr*", ppNewRange, "int*", &pfConvertable := 0, "HRESULT")
        return pfConvertable
    }

    /**
     * 
     * @param {ITfRange} pRange 
     * @returns {ITfCandidateList} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnreconversion-getreconversion
     */
    GetReconversion(pRange) {
        result := ComCall(5, this, "ptr", pRange, "ptr*", &ppCandList := 0, "HRESULT")
        return ITfCandidateList(ppCandList)
    }

    /**
     * 
     * @param {ITfRange} pRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnreconversion-reconvert
     */
    Reconvert(pRange) {
        result := ComCall(6, this, "ptr", pRange, "HRESULT")
        return result
    }
}
