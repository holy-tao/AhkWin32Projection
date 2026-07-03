#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCleanupContextDurationSink interface is implemented by a text service to receive notifications when a context cleanup operation is performed.
 * @remarks
 * A context cleanup occurs when:
 * 
 * <ul>
 * <li>The text service is deactivated while a context is still on the context stack. This can occur when the active text service is changed or when the active language changes while the text service is active.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-deactivate">ITfThreadMgr::Deactivate
 *             </a> is called while a context is still on the context stack.</li>
 * </ul>
 * A text service can use the notifications of this interface to prevent itself from performing any context initialization during the context cleanup operation.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcleanupcontextdurationsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCleanupContextDurationSink extends IUnknown {
    /**
     * The interface identifier for ITfCleanupContextDurationSink
     * @type {Guid}
     */
    static IID := Guid("{45c35144-154e-4797-bed8-d33ae7bf8794}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCleanupContextDurationSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStartCleanupContext : IntPtr
        OnEndCleanupContext   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCleanupContextDurationSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCleanupContextDurationSink::OnStartCleanupContext method
     * @remarks
     * A context cleanup occurs when:
     * 
     * - The text service is deactivated while a context is still on the context stack. This can occur when the active text service is changed or when the active language changes while the text service is active.
     * - [ITfThreadMgr::Deactivate](nf-msctf-itfthreadmgr-deactivate.md) is called while a context is still on the context stack.
     * 
     * [ITfCleanupContextDurationSink::OnStartCleanupContext](nf-msctf-itfcleanupcontextdurationsink-onstartcleanupcontext.md) is called just before the TSF manager begins making [ITfCleanupContextSink::OnCleanupContext](nf-msctf-itfcleanupcontextsink-oncleanupcontext.md) notifications. When all of the OnCleanupContext notifications complete, the TSF manager calls **OnEndCleanupContext**.
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcleanupcontextdurationsink-onstartcleanupcontext
     */
    OnStartCleanupContext() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * ITfCleanupContextDurationSink::OnEndCleanupContext method
     * @remarks
     * A context cleanup occurs when:
     * 
     * - The text service is deactivated while a context is still on the context stack. This can occur when the active text service is changed or when the active language changes while the text service is active.
     * - [ITfThreadMgr::Deactivate](nf-msctf-itfthreadmgr-deactivate.md) is called while a context is still on the context stack.
     * 
     * [ITfCleanupContextDurationSink::OnStartCleanupContext](nf-msctf-itfcleanupcontextdurationsink-onstartcleanupcontext.md) is called just before the TSF manager begins making [ITfCleanupContextSink::OnCleanupContext](nf-msctf-itfcleanupcontextsink-oncleanupcontext.md) notifications. When all of the OnCleanupContext notifications complete, the TSF manager calls **OnEndCleanupContext**.
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcleanupcontextdurationsink-onendcleanupcontext
     */
    OnEndCleanupContext() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfCleanupContextDurationSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStartCleanupContext := CallbackCreate(GetMethod(implObj, "OnStartCleanupContext"), flags, 1)
        this.vtbl.OnEndCleanupContext := CallbackCreate(GetMethod(implObj, "OnEndCleanupContext"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStartCleanupContext)
        CallbackFree(this.vtbl.OnEndCleanupContext)
    }
}
