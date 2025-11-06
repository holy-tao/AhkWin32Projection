#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMImageResource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMImageResource interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomimageresourcecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMImageResourceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMImageResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{7a4a1a71-9cde-4b71-b33f-62de843eabfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "InsertAt", "RemoveAt", "SetAt", "Append", "GetByPartName"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresourcecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IXpsOMImageResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresourcecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &object := 0, "HRESULT")
        return IXpsOMImageResource(object)
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMImageResource} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresourcecollection-insertat
     */
    InsertAt(index, object) {
        result := ComCall(5, this, "uint", index, "ptr", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresourcecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMImageResource} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresourcecollection-setat
     */
    SetAt(index, object) {
        result := ComCall(7, this, "uint", index, "ptr", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMImageResource} object 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresourcecollection-append
     */
    Append(object) {
        result := ComCall(8, this, "ptr", object, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} partName 
     * @returns {IXpsOMImageResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomimageresourcecollection-getbypartname
     */
    GetByPartName(partName) {
        result := ComCall(9, this, "ptr", partName, "ptr*", &part := 0, "HRESULT")
        return IXpsOMImageResource(part)
    }
}
