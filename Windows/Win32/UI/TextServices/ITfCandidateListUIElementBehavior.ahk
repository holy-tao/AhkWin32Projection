#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfCandidateListUIElement.ahk

/**
 * This interface is implemented by a text service that has a candidate list UI and its UI can be controlled by the application. The application QI this interface from ITfUIElement and controls the candidate list behavior.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcandidatelistuielementbehavior
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCandidateListUIElementBehavior extends ITfCandidateListUIElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCandidateListUIElementBehavior
     * @type {Guid}
     */
    static IID => Guid("{85fad185-58ce-497a-9460-355366b64b9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSelection", "Finalize", "Abort"]

    /**
     * The ITfCandidateListUIElementBehavior::SetSelection method set the selection of the candidate list.
     * @param {Integer} nIndex [in] An index for the candidate string to be selected.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielementbehavior-setselection
     */
    SetSelection(nIndex) {
        result := ComCall(15, this, "uint", nIndex, "HRESULT")
        return result
    }

    /**
     * The ITfCandidateListUIElementBehavior::Finalize method finalizes the current selection and close the candidate list.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielementbehavior-finalize
     */
    Finalize() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The ITfCandidateListUIElementBehavior::Abort method closes the candidate list. There is no guarantee that the current selection will be finalized.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcandidatelistuielementbehavior-abort
     */
    Abort() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
