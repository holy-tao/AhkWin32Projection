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
     * ITfDocumentMgr::CreateContext method
     * @param {Integer} tidOwner The client identifier. For an application, this value is provided by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-activate">ITfThreadMgr::Activate</a>. For a text service, this value is provided in the text service <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method.
     * @param {Integer} dwFlags Reserved, must be zero.
     * @param {IUnknown} punk Pointer to an object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontextownercompositionsink">ITfContextOwnerCompositionSink</a> interfaces. This value can be <b>NULL</b>.
     * @param {Pointer<ITfContext>} ppic Address of an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> pointer that receives the context.
     * @param {Pointer<Integer>} pecTextStore Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfeditcookie">TfEditCookie</a> value that receives an edit cookie for the new context. This value identifies the context in various methods.
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
     * A memory allocation error occurred.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdocumentmgr-createcontext
     */
    CreateContext(tidOwner, dwFlags, punk, ppic, pecTextStore) {
        pecTextStoreMarshal := pecTextStore is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", tidOwner, "uint", dwFlags, "ptr", punk, "ptr*", ppic, pecTextStoreMarshal, pecTextStore, "HRESULT")
        return result
    }

    /**
     * ITfDocumentMgr::Push method
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> object to be added to the stack. This object is obtained from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a>.
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
     * <i>pic</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TF_E_STACKFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No space exists on the stack for the context. The context stack has a limit of two contexts.
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
     * This method was called during an <a href="/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-pop">ITfDocumentMgr::Pop</a> call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdocumentmgr-push
     */
    Push(pic) {
        result := ComCall(4, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * ITfDocumentMgr::Pop method
     * @param {Integer} dwFlags If this value is 0, only the context at the top of the stack is removed. If this value is TF_POPF_ALL, all of the contexts are removed from the stack.
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
     * The stack is empty or this method is called without the TF_POPF_ALL flag and only a single context is on the stack.
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
     * This method was called during another <b>ITfDocumentMgr::Pop</b> call.
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
     * <i>dwFlags</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdocumentmgr-pop
     */
    Pop(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfDocumentMgr::GetTop method
     * @returns {ITfContext} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> pointer that receives the context.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdocumentmgr-gettop
     */
    GetTop() {
        result := ComCall(6, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * ITfDocumentMgr::GetBase method
     * @returns {ITfContext} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> pointer that receives the context.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdocumentmgr-getbase
     */
    GetBase() {
        result := ComCall(7, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * ITfDocumentMgr::EnumContexts method
     * @returns {IEnumTfContexts} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfcontexts">IEnumTfContexts</a> pointer that receives the enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfdocumentmgr-enumcontexts
     */
    EnumContexts() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfContexts(ppEnum)
    }
}
