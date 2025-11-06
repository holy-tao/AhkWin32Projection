#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfContext.ahk
#Include .\IEnumTfContexts.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfDocumentMgr interface is implemented by the TSF manager and used by an application or text service to create and manage text contexts. To obtain an instance of this interface call ITfThreadMgr::CreateDocumentMgr.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfdocumentmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfDocumentMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfDocumentMgr
     * @type {Guid}
     */
    static IID => Guid("{aa80e7f4-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateContext", "Push", "Pop", "GetTop", "GetBase", "EnumContexts"]

    /**
     * Creates a recognizer context.
     * @param {Integer} tidOwner 
     * @param {Integer} dwFlags 
     * @param {IUnknown} punk 
     * @param {Pointer<ITfContext>} ppic 
     * @param {Pointer<Integer>} pecTextStore 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is an invalid pointer.
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
     * There is insufficient memory to complete the operation.
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
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-createcontext
     */
    CreateContext(tidOwner, dwFlags, punk, ppic, pecTextStore) {
        pecTextStoreMarshal := pecTextStore is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", tidOwner, "uint", dwFlags, "ptr", punk, "ptr*", ppic, pecTextStoreMarshal, pecTextStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-push
     */
    Push(pic) {
        result := ComCall(4, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-pop
     */
    Pop(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITfContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-gettop
     */
    GetTop() {
        result := ComCall(6, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * 
     * @returns {ITfContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-getbase
     */
    GetBase() {
        result := ComCall(7, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * 
     * @returns {IEnumTfContexts} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-enumcontexts
     */
    EnumContexts() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfContexts(ppEnum)
    }
}
