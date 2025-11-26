#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfEditSession interface is implemented by a text service and used by the TSF manager to read and/or modify the text and properties of a context.
 * @remarks
 * 
 * A text service initiates an edit session by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-requesteditsession">ITfContext::RequestEditSession</a>, passing a pointer to the <b>ITfEditSession</b> interface. When the edit session is granted, the TSF manager calls <b>DoEditSession</b>.
 * 
 * If the context is destroyed before the application grants a lock, or if the calling text service is deactivated before a lock is granted, the <b>DoEditSession</b> method is not called. For this reason, a text service should put cleanup operations for an edit session in the <b>ITfEditSession</b> interface destructor rather than in the <b>DoEditSession</b> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfeditsession
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfEditSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfEditSession
     * @type {Guid}
     */
    static IID => Guid("{aa80e803-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoEditSession"]

    /**
     * ITfEditSession::DoEditSession method
     * @param {Integer} ec Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfeditcookie">TfEditCookie</a> value that uniquely identifies the edit session. This cookie is used to access the context with methods such as <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfrange-gettext">ITfRange::GetText</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfeditsession-doeditsession
     */
    DoEditSession(ec) {
        result := ComCall(3, this, "uint", ec, "HRESULT")
        return result
    }
}
