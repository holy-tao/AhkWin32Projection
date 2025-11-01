#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMFontResource interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresourcecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMFontResourceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMFontResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{70b4a6bb-88d4-4fa8-aaf9-6d9c596fdbad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "SetAt", "InsertAt", "Append", "RemoveAt", "GetByPartName"]

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-getcount
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMFontResource>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-getat
     */
    GetAt(index, value) {
        result := ComCall(4, this, "uint", index, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMFontResource} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-setat
     */
    SetAt(index, value) {
        result := ComCall(5, this, "uint", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMFontResource} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-insertat
     */
    InsertAt(index, value) {
        result := ComCall(6, this, "uint", index, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMFontResource} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-append
     */
    Append(value) {
        result := ComCall(7, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(8, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} partName 
     * @param {Pointer<IXpsOMFontResource>} part 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresourcecollection-getbypartname
     */
    GetByPartName(partName, part) {
        result := ComCall(9, this, "ptr", partName, "ptr*", part, "HRESULT")
        return result
    }
}
