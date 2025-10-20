#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     */
    GetAt(index, document) {
        result := ComCall(4, this, "uint", index, "ptr", document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     */
    InsertAt(index, document) {
        result := ComCall(5, this, "uint", index, "ptr", document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     */
    SetAt(index, document) {
        result := ComCall(7, this, "uint", index, "ptr", document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMDocument>} document 
     * @returns {HRESULT} 
     */
    Append(document) {
        result := ComCall(8, this, "ptr", document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
