#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMDocument.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMDocument interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomdocumentcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMDocumentCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMDocumentCollection
     * @type {Guid}
     */
    static IID => Guid("{d1c87f0d-e947-4754-8a25-971478f7e83e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "InsertAt", "RemoveAt", "SetAt", "Append"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IXpsOMDocument} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentcollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &document := 0, "HRESULT")
        return IXpsOMDocument(document)
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMDocument} document 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentcollection-insertat
     */
    InsertAt(index, document) {
        result := ComCall(5, this, "uint", index, "ptr", document, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMDocument} document 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentcollection-setat
     */
    SetAt(index, document) {
        result := ComCall(7, this, "uint", index, "ptr", document, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMDocument} document 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdocumentcollection-append
     */
    Append(document) {
        result := ComCall(8, this, "ptr", document, "HRESULT")
        return result
    }
}
