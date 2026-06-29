#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import ".\INSERT_TEXT_AT_SELECTION_FLAGS.ahk" { INSERT_TEXT_AT_SELECTION_FLAGS }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfInsertAtSelection interface is implemented by the manager and is used by a text service to insert text or an embedded object in a context. The text service obtains this interface by calling ITfContext::QueryInterface.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfinsertatselection
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfInsertAtSelection extends IUnknown {
    /**
     * The interface identifier for ITfInsertAtSelection
     * @type {Guid}
     */
    static IID := Guid("{55ce16ba-3014-41c1-9ceb-fade1446ac6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfInsertAtSelection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InsertTextAtSelection     : IntPtr
        InsertEmbeddedAtSelection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfInsertAtSelection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfInsertAtSelection::InsertTextAtSelection method
     * @remarks
     * To insert an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object instead of text, use <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinsertatselection-insertembeddedatselection">ITfInsertAtSelection::InsertEmbeddedAtSelection</a>.
     * @param {Integer} ec Identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {INSERT_TEXT_AT_SELECTION_FLAGS} dwFlags 
     * @param {PWSTR} pchText Specifies the text to insert.
     * @param {Integer} cch Specifies the character count of the text in <i>pchText</i>.
     * @returns {ITfRange} Receives the position of the inserted object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinsertatselection-inserttextatselection
     */
    InsertTextAtSelection(ec, dwFlags, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(3, this, "uint", ec, INSERT_TEXT_AT_SELECTION_FLAGS, dwFlags, "ptr", pchText, "int", cch, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }

    /**
     * The ITfInsertAtSelection::InsertEmbeddedAtSelection method inserts an IDataObject object at the selection or insertion point.
     * @remarks
     * Callers can use the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfqueryembedded-queryinsertembedded">ITfQueryEmbedded::QueryInsertEmbedded</a> method to determine if a particular object type is likely to be accepted by this method.
     * 
     * To insert text instead of an <b>IDataObject</b> object, use the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinsertatselection-inserttextatselection">ITfInsertAtSelection::InsertTextAtSelection</a> method.
     * @param {Integer} ec Identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {Integer} dwFlags 
     * @param {IDataObject} pDataObject Pointer to object to insert.
     * @returns {ITfRange} Position of the inserted object. Optional.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinsertatselection-insertembeddedatselection
     */
    InsertEmbeddedAtSelection(ec, dwFlags, pDataObject) {
        result := ComCall(4, this, "uint", ec, "uint", dwFlags, "ptr", pDataObject, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }

    Query(iid) {
        if (ITfInsertAtSelection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InsertTextAtSelection := CallbackCreate(GetMethod(implObj, "InsertTextAtSelection"), flags, 6)
        this.vtbl.InsertEmbeddedAtSelection := CallbackCreate(GetMethod(implObj, "InsertEmbeddedAtSelection"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InsertTextAtSelection)
        CallbackFree(this.vtbl.InsertEmbeddedAtSelection)
    }
}
