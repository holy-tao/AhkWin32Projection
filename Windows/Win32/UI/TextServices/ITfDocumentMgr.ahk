#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import ".\IEnumTfContexts.ahk" { IEnumTfContexts }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfDocumentMgr interface is implemented by the TSF manager and used by an application or text service to create and manage text contexts. To obtain an instance of this interface call ITfThreadMgr::CreateDocumentMgr.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfdocumentmgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfDocumentMgr extends IUnknown {
    /**
     * The interface identifier for ITfDocumentMgr
     * @type {Guid}
     */
    static IID := Guid("{aa80e7f4-2021-11d2-93e0-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfDocumentMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateContext : IntPtr
        Push          : IntPtr
        Pop           : IntPtr
        GetTop        : IntPtr
        GetBase       : IntPtr
        EnumContexts  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfDocumentMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfDocumentMgr::CreateContext method
     * @remarks
     * All references to the <i>punk</i> parameter are released when the context is destroyed or when the context is removed from the stack with the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-pop">ITfDocumentMgr::Pop</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-createcontext
     */
    CreateContext(tidOwner, dwFlags, punk, ppic, pecTextStore) {
        pecTextStoreMarshal := pecTextStore is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", tidOwner, "uint", dwFlags, "ptr", punk, ITfContext.Ptr, ppic, pecTextStoreMarshal, pecTextStore, "HRESULT")
        return result
    }

    /**
     * ITfDocumentMgr::Push method
     * @remarks
     * The first context added to the stack becomes the main document context.
     * 
     * The TSF manager and text services only interact with the context at the top of the stack. Normally, only the main document context is on the stack. Occasionally, it is necessary to add a second context to the stack. For example, when a text service must display a modal UI, such as a candidate list. During this time, the text service will add its context to the stack. When the text service UI is no longer required, the text service removes the context from the stack. The main context then returns to the top of the stack. To simplify this process and prevent multiple modal UIs from being displayed, there is a maximum of two contexts allowed on the stack.
     * 
     * This method causes the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgreventsink-onpushcontext">ITfThreadMgrEventSink::OnPushContext</a> method of all installed thread manager event sinks to be called. If this is the first context to be added to the stack, this method causes the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgreventsink-oninitdocumentmgr">ITfThreadMgrEventSink::OnInitDocumentMgr</a> method of all installed thread manager event sinks to be called.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-pop">ITfDocumentMgr::Pop</a> must be called to remove this context from the context stack.
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
     * This method was called during an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-pop">ITfDocumentMgr::Pop</a> call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-push
     */
    Push(pic) {
        result := ComCall(4, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * ITfDocumentMgr::Pop method
     * @remarks
     * This method must be called from the same thread as the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-push">ITfDocumentMgr::Push</a> call.
     * 
     * The first context added to the stack becomes the primary context. The primary context cannot be removed from the stack without using the TF_POPF_ALL flag. When the document is uninitialized, this method should be called with the TF_POPF_ALL flag. This causes the document manager to remove all contexts from the context stack and terminate any text service UI. Do not use the TF_POPF_ALL flag at any other time.
     * 
     * This method causes the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgreventsink-onpopcontext">ITfThreadMgrEventSink::OnPopContext</a> method of all installed thread manager event sinks to be called. If the last context is removed from the stack, this method causes the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgreventsink-onuninitdocumentmgr">ITfThreadMgrEventSink::OnUninitDocumentMgr</a> method of all installed thread manager event sinks to be called.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-pop
     */
    Pop(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfDocumentMgr::GetTop method
     * @returns {ITfContext} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> pointer that receives the context.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-gettop
     */
    GetTop() {
        result := ComCall(6, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * ITfDocumentMgr::GetBase method
     * @returns {ITfContext} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> pointer that receives the context.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-getbase
     */
    GetBase() {
        result := ComCall(7, this, "ptr*", &ppic := 0, "HRESULT")
        return ITfContext(ppic)
    }

    /**
     * ITfDocumentMgr::EnumContexts method
     * @returns {IEnumTfContexts} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfcontexts">IEnumTfContexts</a> pointer that receives the enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdocumentmgr-enumcontexts
     */
    EnumContexts() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfContexts(ppEnum)
    }

    Query(iid) {
        if (ITfDocumentMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateContext := CallbackCreate(GetMethod(implObj, "CreateContext"), flags, 6)
        this.vtbl.Push := CallbackCreate(GetMethod(implObj, "Push"), flags, 2)
        this.vtbl.Pop := CallbackCreate(GetMethod(implObj, "Pop"), flags, 2)
        this.vtbl.GetTop := CallbackCreate(GetMethod(implObj, "GetTop"), flags, 2)
        this.vtbl.GetBase := CallbackCreate(GetMethod(implObj, "GetBase"), flags, 2)
        this.vtbl.EnumContexts := CallbackCreate(GetMethod(implObj, "EnumContexts"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateContext)
        CallbackFree(this.vtbl.Push)
        CallbackFree(this.vtbl.Pop)
        CallbackFree(this.vtbl.GetTop)
        CallbackFree(this.vtbl.GetBase)
        CallbackFree(this.vtbl.EnumContexts)
    }
}
