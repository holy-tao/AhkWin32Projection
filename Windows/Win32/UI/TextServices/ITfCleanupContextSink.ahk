#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCleanupContextSink interface is implemented by a text service to receive notifications when a context cleanup operation occurs. This notification sink is installed by calling ITfSourceSingle::AdviseSingleSink with IID_ITfCleanupContextSink.
 * @remarks
 * A context cleanup occurs when:
 * 
 * <ul>
 * <li>The text service is deactivated while a context is still on the context stack. This can occur when the active text service is changed or when the active language changes while the text service is active.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-deactivate">ITfThreadMgr::Deactivate
 *             </a> is called while a context is still on the context stack.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcleanupcontextsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCleanupContextSink extends IUnknown {
    /**
     * The interface identifier for ITfCleanupContextSink
     * @type {Guid}
     */
    static IID := Guid("{01689689-7acb-4e9b-ab7c-7ea46b12b522}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCleanupContextSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCleanupContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCleanupContextSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCleanupContextSink::OnCleanupContext method
     * @remarks
     * A context cleanup occurs when:
     * 
     * - The text service is deactivated while a context is still on the context stack. This can occur when the active text service is changed or when the active language changes while the text service is active.
     * - [ITfThreadMgr::Deactivate](nf-msctf-itfthreadmgr-deactivate.md) is called while a context is still on the context stack.
     * 
     * [ITfCleanupContextDurationSink::OnStartCleanupContext](nf-msctf-itfcleanupcontextdurationsink-onstartcleanupcontext.md) is called just before the TSF manager begins making [ITfCleanupContextSink::OnCleanupContext](nf-msctf-itfcleanupcontextsink-oncleanupcontext.md) notifications. When all of the OnCleanupContext notifications complete, the TSF manager calls **OnEndCleanupContext**.
     * @param {Integer} ecWrite Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfeditcookie">TfEditCookie</a> value that identifies the edit context cleaned up. The edit context is guaranteed to have a read/write lock.
     * @param {ITfContext} pic Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface that represents the context cleaned up.
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcleanupcontextsink-oncleanupcontext
     */
    OnCleanupContext(ecWrite, pic) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pic, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfCleanupContextSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCleanupContext := CallbackCreate(GetMethod(implObj, "OnCleanupContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCleanupContext)
    }
}
