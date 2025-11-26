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
     * The ITfFnReconversion::QueryRange method obtains the range of text that the reconversion applies to.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers all or part of the text to be reconverted.
     * @param {Pointer<ITfRange>} ppNewRange [in, out] Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> pointer that receives a range object that covers all of text that can be reconverted. If none of the text covered by <i>pRange</i> can be reconverted, this parameters receives NULL. In this case, the method will return S_OK, so the caller must verify that this parameter is not NULL before using the pointer.
     * 
     * When this method is implemented by a text service, this parameter is optional and can be NULL. In this case, the range is not required.
     * 
     * When the TSF manager implementation of this method is called, this parameter is not optional and cannot be NULL.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives zero if none of the text covered by <i>pRange</i> can be reconverted or nonzero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnreconversion-queryrange
     */
    QueryRange(pRange, ppNewRange) {
        result := ComCall(4, this, "ptr", pRange, "ptr*", ppNewRange, "int*", &pfConvertable := 0, "HRESULT")
        return pfConvertable
    }

    /**
     * ITfFnReconversion::GetReconversion method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to be reconverted. This range object is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnreconversion-queryrange">ITfFnReconversion::QueryRange</a>.
     * @returns {ITfCandidateList} Pointer to an <b>ITfCandidateList</b> pointer that receives the candidate list object.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnreconversion-getreconversion
     */
    GetReconversion(pRange) {
        result := ComCall(5, this, "ptr", pRange, "ptr*", &ppCandList := 0, "HRESULT")
        return ITfCandidateList(ppCandList)
    }

    /**
     * ITfFnReconversion::Reconvert method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to be reconverted. To obtain this range object call <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnreconversion-queryrange">ITfFnReconversion::QueryRange</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnreconversion-reconvert
     */
    Reconvert(pRange) {
        result := ComCall(6, this, "ptr", pRange, "HRESULT")
        return result
    }
}
