#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITfDocumentMgr.ahk" { ITfDocumentMgr }

/**
 * The ITfThreadMgrEventSink interface is implemented by an application or TSF text service to receive notifications of certain thread manager events. Call the TSF manager ITfSource::AdviseSink with IID_ITfThreadMgrEventSink to install this advise sink.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfthreadmgreventsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfThreadMgrEventSink extends IUnknown {
    /**
     * The interface identifier for ITfThreadMgrEventSink
     * @type {Guid}
     */
    static IID := Guid("{aa80e80e-2021-11d2-93e0-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfThreadMgrEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnInitDocumentMgr   : IntPtr
        OnUninitDocumentMgr : IntPtr
        OnSetFocus          : IntPtr
        OnPushContext       : IntPtr
        OnPopContext        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfThreadMgrEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfThreadMgrEventSink::OnInitDocumentMgr method
     * @param {ITfDocumentMgr} pdim Pointer to the document manager object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-oninitdocumentmgr
     */
    OnInitDocumentMgr(pdim) {
        result := ComCall(3, this, "ptr", pdim, "HRESULT")
        return result
    }

    /**
     * ITfThreadMgrEventSink::OnUninitDocumentMgr method
     * @param {ITfDocumentMgr} pdim Pointer to the document manager object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onuninitdocumentmgr
     */
    OnUninitDocumentMgr(pdim) {
        result := ComCall(4, this, "ptr", pdim, "HRESULT")
        return result
    }

    /**
     * ITfThreadMgrEventSink::OnSetFocus method
     * @param {ITfDocumentMgr} pdimFocus Pointer to the document manager receiving the input focus. If no document is receiving the focus, this will be <b>NULL</b>.
     * @param {ITfDocumentMgr} pdimPrevFocus Pointer to the document manager that previously had the input focus. If no document had the focus, this will be <b>NULL</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onsetfocus
     */
    OnSetFocus(pdimFocus, pdimPrevFocus) {
        result := ComCall(5, this, "ptr", pdimFocus, "ptr", pdimPrevFocus, "HRESULT")
        return result
    }

    /**
     * ITfThreadMgrEventSink::OnPushContext method
     * @param {ITfContext} pic Pointer to the context added to the stack.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onpushcontext
     */
    OnPushContext(pic) {
        result := ComCall(6, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * ITfThreadMgrEventSink::OnPopContext method
     * @param {ITfContext} pic Pointer to the context removed from the stack.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onpopcontext
     */
    OnPopContext(pic) {
        result := ComCall(7, this, "ptr", pic, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfThreadMgrEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnInitDocumentMgr := CallbackCreate(GetMethod(implObj, "OnInitDocumentMgr"), flags, 2)
        this.vtbl.OnUninitDocumentMgr := CallbackCreate(GetMethod(implObj, "OnUninitDocumentMgr"), flags, 2)
        this.vtbl.OnSetFocus := CallbackCreate(GetMethod(implObj, "OnSetFocus"), flags, 3)
        this.vtbl.OnPushContext := CallbackCreate(GetMethod(implObj, "OnPushContext"), flags, 2)
        this.vtbl.OnPopContext := CallbackCreate(GetMethod(implObj, "OnPopContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnInitDocumentMgr)
        CallbackFree(this.vtbl.OnUninitDocumentMgr)
        CallbackFree(this.vtbl.OnSetFocus)
        CallbackFree(this.vtbl.OnPushContext)
        CallbackFree(this.vtbl.OnPopContext)
    }
}
