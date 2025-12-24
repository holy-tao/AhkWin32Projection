#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfContext.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfUIElement.ahk

/**
 * The ITfCandidateListUIElement interface is implemented by a text service that has a UI for reading information UI at the near caret.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfreadinginformationuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfReadingInformationUIElement extends ITfUIElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfReadingInformationUIElement
     * @type {Guid}
     */
    static IID => Guid("{ea1ea139-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUpdatedFlags", "GetContext", "GetString", "GetMaxReadingStringLength", "GetErrorIndex", "IsVerticalOrderPreferred"]

    /**
     * This method returns the flag that tells which part of this element was updated.
     * @returns {Integer} [out] A pointer to receive the flags that is a combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_CONTEXT"></a><a id="tf_riuie_context"></a><dl>
     * <dt><b>TF_RIUIE_CONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_STRING"></a><a id="tf_riuie_string"></a><dl>
     * <dt><b>TF_RIUIE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reading information string was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_MAXREADINGSTRINGLENGTH"></a><a id="tf_riuie_maxreadingstringlength"></a><dl>
     * <dt><b>TF_RIUIE_MAXREADINGSTRINGLENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The max length of the reading information string was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_ERRORINDEX"></a><a id="tf_riuie_errorindex"></a><dl>
     * <dt><b>TF_RIUIE_ERRORINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error index of the reading information string was changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RIUIE_VERTICALORDER"></a><a id="tf_riuie_verticalorder"></a><dl>
     * <dt><b>TF_RIUIE_VERTICALORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vertical order preference was changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfreadinginformationuielement-getupdatedflags
     */
    GetUpdatedFlags() {
        result := ComCall(7, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * This method returns the target ITfContext of this reading information UI.
     * @returns {ITfContext} [out] A pointer to receive the target <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface of this UI element.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfreadinginformationuielement-getcontext
     */
    GetContext() {
        result := ComCall(8, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * This method returns the string on the reading information UI.
     * @returns {BSTR} [out] A pointer to the BSTR of the reading information string.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfreadinginformationuielement-getstring
     */
    GetString() {
        pstr := BSTR()
        result := ComCall(9, this, "ptr", pstr, "HRESULT")
        return pstr
    }

    /**
     * The ITfReadingInformationUIElement::GetMaxReadingStringLength method returns the max string count of the reading information UI.
     * @returns {Integer} [out] A pointer to the max length of the reading information string.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfreadinginformationuielement-getmaxreadingstringlength
     */
    GetMaxReadingStringLength() {
        result := ComCall(10, this, "uint*", &pcchMax := 0, "HRESULT")
        return pcchMax
    }

    /**
     * This method returns the char index where the typing error occurs.
     * @returns {Integer} [out] A pointer to receive the char index where the typing error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfreadinginformationuielement-geterrorindex
     */
    GetErrorIndex() {
        result := ComCall(11, this, "uint*", &pErrorIndex := 0, "HRESULT")
        return pErrorIndex
    }

    /**
     * This method returns if the UI prefers to be shown in vertical order.
     * @returns {BOOL} [out] True if the UI prefers to be shown in the vertical order.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfreadinginformationuielement-isverticalorderpreferred
     */
    IsVerticalOrderPreferred() {
        result := ComCall(12, this, "int*", &pfVertical := 0, "HRESULT")
        return pfVertical
    }
}
