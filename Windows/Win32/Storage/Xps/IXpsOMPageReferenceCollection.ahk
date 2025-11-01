#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMPageReference interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompagereferencecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPageReferenceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPageReferenceCollection
     * @type {Guid}
     */
    static IID => Guid("{ca16ba4d-e7b9-45c5-958b-f98022473745}")

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
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereferencecollection-getcount
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMPageReference>} pageReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereferencecollection-getat
     */
    GetAt(index, pageReference) {
        result := ComCall(4, this, "uint", index, "ptr*", pageReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMPageReference} pageReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereferencecollection-insertat
     */
    InsertAt(index, pageReference) {
        result := ComCall(5, this, "uint", index, "ptr", pageReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereferencecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMPageReference} pageReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereferencecollection-setat
     */
    SetAt(index, pageReference) {
        result := ComCall(7, this, "uint", index, "ptr", pageReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMPageReference} pageReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompagereferencecollection-append
     */
    Append(pageReference) {
        result := ComCall(8, this, "ptr", pageReference, "HRESULT")
        return result
    }
}
