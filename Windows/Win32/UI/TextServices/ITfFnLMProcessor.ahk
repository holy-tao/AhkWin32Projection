#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfCandidateList.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnLMProcessor interface is implemented by the language model text service and is used by an application or text service to enable alternate language model processing.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnlmprocessor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnLMProcessor extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnLMProcessor
     * @type {Guid}
     */
    static IID => Guid("{7afbf8e7-ac4b-4082-b058-890899d3a010}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryRange", "QueryLangID", "GetReconversion", "Reconvert", "QueryKey", "InvokeKey", "InvokeFunc"]

    /**
     * ITfFnLMProcessor::QueryRange method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers all or part of the text to be reconverted.
     * @param {Pointer<ITfRange>} ppNewRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> pointer that receives a range object that covers all of the text that can be reconverted. If none of the text covered by <i>pRange</i> can be reconverted, this parameters receives <b>NULL</b>. In this case, the method will return S_OK; the caller must verify that this parameter is not <b>NULL</b> before using the pointer.
     * 
     * This parameter is optional and can be <b>NULL</b>. In this case, the range is not required.
     * @param {Pointer<BOOL>} pfAccepted Pointer to a <b>BOOL</b> value that receives zero if none of the text covered by <i>pRange</i> can be reconverted or nonzero otherwise.
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
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlmprocessor-queryrange
     */
    QueryRange(pRange, ppNewRange, pfAccepted) {
        pfAcceptedMarshal := pfAccepted is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pRange, "ptr*", ppNewRange, pfAcceptedMarshal, pfAccepted, "HRESULT")
        return result
    }

    /**
     * ITfFnLMProcessor::QueryLangID method
     * @param {Integer} langid Contains a <b>LANGID</b> that specifies the identifier of the language that the query applies to.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives nonzero if the language model text service supports the language identified by <i>langid</i> or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlmprocessor-querylangid
     */
    QueryLangID(langid) {
        result := ComCall(5, this, "ushort", langid, "int*", &pfAccepted := 0, "HRESULT")
        return pfAccepted
    }

    /**
     * ITfFnLMProcessor::GetReconversion method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to be reconverted. To obtain this range object, call <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nf-ctffunc-itffnreconversion-queryrange">ITfFnReconversion::QueryRange</a>.
     * @returns {ITfCandidateList} Pointer to an <b>ITfCandidateList</b> pointer that receives the candidate list object.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlmprocessor-getreconversion
     */
    GetReconversion(pRange) {
        result := ComCall(6, this, "ptr", pRange, "ptr*", &ppCandList := 0, "HRESULT")
        return ITfCandidateList(ppCandList)
    }

    /**
     * ITfFnLMProcessor::Reconvert method
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to reconvert.
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
     * <i>pRange</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlmprocessor-reconvert
     */
    Reconvert(pRange) {
        result := ComCall(7, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * ITfFnLMProcessor::QueryKey method
     * @param {BOOL} fUp Contains a <b>BOOL</b> that specifies if this is a key-down or a key-up event. Contains zero if this is a key-down event or nonzero otherwise.
     * @param {WPARAM} vKey Contains the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lparamKeydata Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives nonzero if the language model text service will handle the key event or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlmprocessor-querykey
     */
    QueryKey(fUp, vKey, lparamKeydata) {
        result := ComCall(8, this, "int", fUp, "ptr", vKey, "ptr", lparamKeydata, "int*", &pfInterested := 0, "HRESULT")
        return pfInterested
    }

    /**
     * ITfFnLMProcessor::InvokeKey method
     * @param {BOOL} fUp Contains a <b>BOOL</b> that specifies if this is a key-down or a key-up event. Contains zero if this is a key-down event or nonzero otherwise.
     * @param {WPARAM} vKey Contains the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lparamKeyData Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlmprocessor-invokekey
     */
    InvokeKey(fUp, vKey, lparamKeyData) {
        result := ComCall(9, this, "int", fUp, "ptr", vKey, "ptr", lparamKeyData, "HRESULT")
        return result
    }

    /**
     * ITfFnLMProcessor::InvokeFunc method
     * @param {ITfContext} pic Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface that represents context to perform the function on.
     * @param {Pointer<Guid>} refguidFunc Contains a GUID that specifies the function to invoke. Possible values for this parameter are defined by the language model text service provider.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlmprocessor-invokefunc
     */
    InvokeFunc(pic, refguidFunc) {
        result := ComCall(10, this, "ptr", pic, "ptr", refguidFunc, "HRESULT")
        return result
    }
}
