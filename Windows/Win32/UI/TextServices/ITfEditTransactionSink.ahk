#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfContext.ahk" { ITfContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfEditTransactionSink interface is implemented by a text service and used by the TSF manager to support edit transactions.
 * @remarks
 * An edit transaction involves multiple document locks, and usually includes multiple <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit</a> method callbacks.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfedittransactionsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfEditTransactionSink extends IUnknown {
    /**
     * The interface identifier for ITfEditTransactionSink
     * @type {Guid}
     */
    static IID := Guid("{708fbf70-b520-416b-b06c-2c41ab44f8ba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfEditTransactionSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStartEditTransaction : IntPtr
        OnEndEditTransaction   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfEditTransactionSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfEditTransactionSink::OnStartEditTransaction method
     * @remarks
     * The TSF manager calls this method at the start of an edit transaction. A text service might delay reevaluation of the changing context of the transaction due to the multiple <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit</a> notifications until after receiving the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfedittransactionsink-onendedittransaction">ITfEditTransactionSink::OnEndEditTransaction</a> callback.
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface involved in the transaction.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfedittransactionsink-onstartedittransaction
     */
    OnStartEditTransaction(pic) {
        result := ComCall(3, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * ITfEditTransactionSink::OnEndEditTransaction method
     * @remarks
     * The TSF manager calls this method at the end of an edit transaction. A text service can delay reevaluation of the changing context of the transaction due to the multiple <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit</a> method notifications until after receiving this callback.
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface involved in the transaction.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfedittransactionsink-onendedittransaction
     */
    OnEndEditTransaction(pic) {
        result := ComCall(4, this, "ptr", pic, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfEditTransactionSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStartEditTransaction := CallbackCreate(GetMethod(implObj, "OnStartEditTransaction"), flags, 2)
        this.vtbl.OnEndEditTransaction := CallbackCreate(GetMethod(implObj, "OnEndEditTransaction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStartEditTransaction)
        CallbackFree(this.vtbl.OnEndEditTransaction)
    }
}
