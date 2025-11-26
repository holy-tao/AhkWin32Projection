#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfComposition interface is implemented by the TSF manager and is used by a text service to obtain data about and terminate a composition. An instance of this interface is provided by the ITfContextComposition::StartComposition method.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcomposition
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfComposition extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfComposition
     * @type {Guid}
     */
    static IID => Guid("{20168d64-5a8f-4a5a-b7bd-cfa29f4d0fd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRange", "ShiftStart", "ShiftEnd", "EndComposition"]

    /**
     * ITfComposition::GetRange method
     * @returns {ITfRange} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfRange</a> interface pointer that receives the range object. It is possible that the range will have zero length.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcomposition-getrange
     */
    GetRange() {
        result := ComCall(3, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }

    /**
     * ITfComposition::ShiftStart method
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pNewStart Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the new start anchor position. The start anchor of the context will be moved to the start anchor of this range. This method fails if the start anchor of this range is positioned beyond the end anchor of the composition.
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
     * The start anchor of <i>pNewStart</i> is positioned past the end anchor of the composition or <i>pNewStart</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The composition has already terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ecWrite</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcomposition-shiftstart
     */
    ShiftStart(ecWrite, pNewStart) {
        result := ComCall(4, this, "uint", ecWrite, "ptr", pNewStart, "HRESULT")
        return result
    }

    /**
     * ITfComposition::ShiftEnd method
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pNewEnd Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the new end anchor position. The end anchor of the context will be moved to the end anchor of this range. This method fails if the end anchor of this range is positioned prior to the start anchor of the composition.
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
     * The end anchor of <i>pNewEnd</i> is positioned prior to the start anchor of the composition or <i>pNewStart</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The composition has already terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ecWrite</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcomposition-shiftend
     */
    ShiftEnd(ecWrite, pNewEnd) {
        result := ComCall(5, this, "uint", ecWrite, "ptr", pNewEnd, "HRESULT")
        return result
    }

    /**
     * ITfComposition::EndComposition method
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value results when:
     * 
     * <ul>
     * <li>The composition terminated.</li>
     * <li>The caller is inside another composition write operation.</li>
     * <li>The caller does not own the composition.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_NOLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The edit context identified by <i>ecWrite</i> does not have a read/write lock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcomposition-endcomposition
     */
    EndComposition(ecWrite) {
        result := ComCall(6, this, "uint", ecWrite, "HRESULT")
        return result
    }
}
