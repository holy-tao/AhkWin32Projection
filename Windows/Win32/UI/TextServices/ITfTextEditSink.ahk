#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import ".\ITfEditRecord.ahk" { ITfEditRecord }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfTextEditSink interface supports completion of an edit session that involves read/write access.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itftexteditsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfTextEditSink extends IUnknown {
    /**
     * The interface identifier for ITfTextEditSink
     * @type {Guid}
     */
    static IID := Guid("{8127d409-ccd3-4683-967a-b43d5b482bf7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfTextEditSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnEndEdit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfTextEditSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfTextEditSink::OnEndEdit method
     * @remarks
     * An edit session with read/write access is requested with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-requesteditsession">ITfContext::RequestEditSession</a> method using the TF_ES_READWRITE flag, which establishes an <b>ITfEditSession::DoEditSession</b> method to perform the session. When such a <b>ITfEditSession::DoEditSession</b> method completes, TSF calls this method.
     * 
     * A text service can use the <i>ecReadOnly</i> parameter only to view the context. If changes are required, the text service must use an asynchronous call to the <b>ITfContext::RequestEditSession</b> method. However, a text service should modify only text that it previously entered as part of a composition. Otherwise, two or more text services could repeatedly modify the same text. A text service can use the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-inwritesession">ITfContext::InWriteSession</a> method to determine if it performed the completed edit session.
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface for the edited context.
     * @param {Integer} ecReadOnly Specifies a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfeditcookie">TfEditCookie</a> value for read-only access to the context.
     * @param {ITfEditRecord} pEditRecord Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfeditrecord">ITfEditRecord</a> interface used to access the modifications to the context.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftexteditsink-onendedit
     */
    OnEndEdit(pic, ecReadOnly, pEditRecord) {
        result := ComCall(3, this, "ptr", pic, "uint", ecReadOnly, "ptr", pEditRecord, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfTextEditSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnEndEdit := CallbackCreate(GetMethod(implObj, "OnEndEdit"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnEndEdit)
    }
}
