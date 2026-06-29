#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for client applications to retrieve documents.
 * @see https://learn.microsoft.com/windows/win32/api/msaatext/nn-msaatext-iaccclientdocmgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IAccClientDocMgr extends IUnknown {
    /**
     * The interface identifier for IAccClientDocMgr
     * @type {Guid}
     */
    static IID := Guid("{4c896039-7b6d-49e6-a8c1-45116a98292b}")

    /**
     * The class identifier for AccClientDocMgr
     * @type {Guid}
     */
    static CLSID := Guid("{fc48cc30-4f3e-4fa1-803b-ad0e196a83b1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccClientDocMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDocuments  : IntPtr
        LookupByHWND  : IntPtr
        LookupByPoint : IntPtr
        GetFocused    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccClientDocMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Clients call IAccClientDocMgr::GetDocuments to get a list of all documents that have been registered with the Microsoft Active Accessibility run time.
     * @remarks
     * Servers might need to poll this method more than once before they receive a document. There can be a limited time lapse (approximately second) between when a document appears in the system and when it is registered with document services.
     * @returns {IEnumUnknown} Type: <b>IEnumUnknown*</b>
     * 
     * A list of document interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccclientdocmgr-getdocuments
     */
    GetDocuments() {
        result := ComCall(3, this, "ptr*", &enumUnknown := 0, "HRESULT")
        return IEnumUnknown(enumUnknown)
    }

    /**
     * Clients call IAccClientDocMgr::LookupByHWND to get a document by providing the HWND for the document.
     * @remarks
     * Servers might need to poll this method more than once before they receive a document. There can be a limited time lapse (approximately second) between when a document appears in the system and when it is registered with document services.
     * @param {HWND} _hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The <b>HWND</b> of the document to be returned.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document being requested. This is usually IID_ITextStoreAnchor.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the document being requested.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccclientdocmgr-lookupbyhwnd
     */
    LookupByHWND(_hWnd, riid) {
        result := ComCall(4, this, HWND, _hWnd, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Clients call IAccClientDocMgr::LookupByPoint to get a document object from a point within the document.
     * @remarks
     * Servers might need to poll this method more than once before they receive a document. There can be a limited time lapse (approximately second) between when a document appears in the system and when it is registered with document services.
     * @param {POINT} pt Type: <b>POINT</b>
     * 
     * A point inside the bounding rectangle of the document to be returned.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document being requested. This is usually IID_ITextStoreAnchor.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the document being requested.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccclientdocmgr-lookupbypoint
     */
    LookupByPoint(pt, riid) {
        result := ComCall(5, this, POINT, pt, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Clients call the IAccClientDocMgr::GetFocused method to access a pointer for the document that has focus.
     * @remarks
     * If the window that has focus is not a document that implements the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> interface, <i>ppunk</i> will be <b>NULL</b>.
     * 
     * Servers might need to poll this method more than once before they receive a document. There can be a limited time lapse (approximately second) between when a document appears in the system and when it is registered with document services.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document being requested. This is usually IID_ITextStoreAnchor.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the document being requested.
     * @see https://learn.microsoft.com/windows/win32/api/msaatext/nf-msaatext-iaccclientdocmgr-getfocused
     */
    GetFocused(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (IAccClientDocMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocuments := CallbackCreate(GetMethod(implObj, "GetDocuments"), flags, 2)
        this.vtbl.LookupByHWND := CallbackCreate(GetMethod(implObj, "LookupByHWND"), flags, 4)
        this.vtbl.LookupByPoint := CallbackCreate(GetMethod(implObj, "LookupByPoint"), flags, 4)
        this.vtbl.GetFocused := CallbackCreate(GetMethod(implObj, "GetFocused"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocuments)
        CallbackFree(this.vtbl.LookupByHWND)
        CallbackFree(this.vtbl.LookupByPoint)
        CallbackFree(this.vtbl.GetFocused)
    }
}
