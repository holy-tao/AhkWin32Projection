#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that make documents accessible to client applications.
 * @see https://learn.microsoft.com/windows/win32/api/msaatext/nn-msaatext-iaccserverdocmgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IAccServerDocMgr extends IUnknown {
    /**
     * The interface identifier for IAccServerDocMgr
     * @type {Guid}
     */
    static IID := Guid("{ad7c73cf-6dd5-4855-abc2-b04bad5b9153}")

    /**
     * The class identifier for AccServerDocMgr
     * @type {Guid}
     */
    static CLSID := Guid("{6089a37e-eb8a-482d-bd6f-f9f46904d16d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccServerDocMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NewDocument     : IntPtr
        RevokeDocument  : IntPtr
        OnDocumentFocus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccServerDocMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Server applications call the IAccServerDocMgr::NewDocument method when it is available. The adapter creates a wrapped document and registers it with the store, so clients can access information about the text in the document.
     * @remarks
     * The server application calls the <b>IAccServerDocMgr::NewDocument</b> method to notify the Microsoft Active Accessibility run time that a document is available. Calling <b>NewDocument</b> adds the document to the Microsoft Active Accessibility store so that clients can access the document.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document. This is usually IID_ITextStoreAnchor.
     * @param {IUnknown} punk Type: <b>IUnknown*</b>
     * 
     * [in, iid_is(riid)] An interface pointer to the document.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccserverdocmgr-newdocument
     */
    NewDocument(riid, punk) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Server applications call the IAccServerDocMgr::RevokeDocument method to notify the Microsoft Active Accessibility run time that a document is no longer available. Calling RevokeDocument removes it from the store so that clients cannot see the document.
     * @param {IUnknown} punk Type: <b>IUnknown*</b>
     * 
     * An interface pointer to the document being revoked.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccserverdocmgr-revokedocument
     */
    RevokeDocument(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Applications that use Text Services Framework call IAccServerDocMgr::OnDocumentFocus to notify the Microsoft Active Accessibility run time when a document gets or loses focus.
     * @remarks
     * This can be null indicating that no document has focus.
     * @param {IUnknown} punk Type: <b>IUnknown*</b>
     * 
     * An interface pointer to the document getting focus.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccserverdocmgr-ondocumentfocus
     */
    OnDocumentFocus(punk) {
        result := ComCall(5, this, "ptr", punk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAccServerDocMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NewDocument := CallbackCreate(GetMethod(implObj, "NewDocument"), flags, 3)
        this.vtbl.RevokeDocument := CallbackCreate(GetMethod(implObj, "RevokeDocument"), flags, 2)
        this.vtbl.OnDocumentFocus := CallbackCreate(GetMethod(implObj, "OnDocumentFocus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NewDocument)
        CallbackFree(this.vtbl.RevokeDocument)
        CallbackFree(this.vtbl.OnDocumentFocus)
    }
}
