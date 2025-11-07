#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfInsertAtSelection interface is implemented by the manager and is used by a text service to insert text or an embedded object in a context. The text service obtains this interface by calling ITfContext::QueryInterface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinsertatselection
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInsertAtSelection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInsertAtSelection
     * @type {Guid}
     */
    static IID => Guid("{55ce16ba-3014-41c1-9ceb-fade1446ac6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertTextAtSelection", "InsertEmbeddedAtSelection"]

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @returns {ITfRange} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinsertatselection-inserttextatselection
     */
    InsertTextAtSelection(ec, dwFlags, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(3, this, "uint", ec, "uint", dwFlags, "ptr", pchText, "int", cch, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {IDataObject} pDataObject 
     * @returns {ITfRange} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinsertatselection-insertembeddedatselection
     */
    InsertEmbeddedAtSelection(ec, dwFlags, pDataObject) {
        result := ComCall(4, this, "uint", ec, "uint", dwFlags, "ptr", pDataObject, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }
}
