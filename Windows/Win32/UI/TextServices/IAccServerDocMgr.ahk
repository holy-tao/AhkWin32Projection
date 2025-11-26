#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that make documents accessible to client applications.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iaccserverdocmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccServerDocMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccServerDocMgr
     * @type {Guid}
     */
    static IID => Guid("{ad7c73cf-6dd5-4855-abc2-b04bad5b9153}")

    /**
     * The class identifier for AccServerDocMgr
     * @type {Guid}
     */
    static CLSID => Guid("{6089a37e-eb8a-482d-bd6f-f9f46904d16d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NewDocument", "RevokeDocument", "OnDocumentFocus"]

    /**
     * Server applications call the IAccServerDocMgr::NewDocument method when it is available. The adapter creates a wrapped document and registers it with the store, so clients can access information about the text in the document.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * IID of the document. This is usually IID_ITextStoreAnchor.
     * @param {IUnknown} punk Type: <b>IUnknown*</b>
     * 
     * [in, iid_is(riid)] An interface pointer to the document.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccserverdocmgr-newdocument
     */
    NewDocument(riid, punk) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Server applications call the IAccServerDocMgr::RevokeDocument method to notify the Microsoft Active Accessibility run time that a document is no longer available. Calling RevokeDocument removes it from the store so that clients cannot see the document.
     * @param {IUnknown} punk Type: <b>IUnknown*</b>
     * 
     * An interface pointer to the document being revoked.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccserverdocmgr-revokedocument
     */
    RevokeDocument(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Applications that use Text Services Framework call IAccServerDocMgr::OnDocumentFocus to notify the Microsoft Active Accessibility run time when a document gets or loses focus.
     * @param {IUnknown} punk Type: <b>IUnknown*</b>
     * 
     * An interface pointer to the document getting focus.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//msaatext/nf-msaatext-iaccserverdocmgr-ondocumentfocus
     */
    OnDocumentFocus(punk) {
        result := ComCall(5, this, "ptr", punk, "HRESULT")
        return result
    }
}
