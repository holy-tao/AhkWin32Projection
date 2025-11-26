#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for client applications to retrieve documents.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iaccclientdocmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccClientDocMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccClientDocMgr
     * @type {Guid}
     */
    static IID => Guid("{4c896039-7b6d-49e6-a8c1-45116a98292b}")

    /**
     * The class identifier for AccClientDocMgr
     * @type {Guid}
     */
    static CLSID => Guid("{fc48cc30-4f3e-4fa1-803b-ad0e196a83b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocuments", "LookupByHWND", "LookupByPoint", "GetFocused"]

    /**
     * Clients call IAccClientDocMgr::GetDocuments to get a list of all documents that have been registered with the Microsoft Active Accessibility run time.
     * @returns {IEnumUnknown} Type: <b>IEnumUnknown*</b>
     * 
     * A list of document interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccclientdocmgr-getdocuments
     */
    GetDocuments() {
        result := ComCall(3, this, "ptr*", &enumUnknown := 0, "HRESULT")
        return IEnumUnknown(enumUnknown)
    }

    /**
     * Clients call IAccClientDocMgr::LookupByHWND to get a document by providing the HWND for the document.
     * @param {HWND} hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The <b>HWND</b> of the document to be returned.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document being requested. This is usually IID_ITextStoreAnchor.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the document being requested.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccclientdocmgr-lookupbyhwnd
     */
    LookupByHWND(hWnd, riid) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hWnd, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Clients call IAccClientDocMgr::LookupByPoint to get a document object from a point within the document.
     * @param {POINT} pt Type: <b>POINT</b>
     * 
     * A point inside the bounding rectangle of the document to be returned.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document being requested. This is usually IID_ITextStoreAnchor.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the document being requested.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccclientdocmgr-lookupbypoint
     */
    LookupByPoint(pt, riid) {
        result := ComCall(5, this, "ptr", pt, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * Clients call the IAccClientDocMgr::GetFocused method to access a pointer for the document that has focus.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document being requested. This is usually IID_ITextStoreAnchor.
     * @returns {IUnknown} Type: <b>IUnknown*</b>
     * 
     * Interface pointer to the document being requested.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccclientdocmgr-getfocused
     */
    GetFocused(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
