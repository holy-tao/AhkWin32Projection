#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGeometryFigure.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMGeometryFigure interface pointers.
 * @remarks
 * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigurecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGeometryFigureCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGeometryFigureCollection
     * @type {Guid}
     */
    static IID => Guid("{fd48c3f3-a58e-4b5a-8826-1de54abe72b2}")

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
     * Gets the number of IXpsOMGeometryFigure interface pointers in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointers in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets an IXpsOMGeometryFigure interface pointer from a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointer to be obtained.
     * @returns {IXpsOMGeometryFigure} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointer at the location specified by <i>index</i>.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &geometryFigure := 0, "HRESULT")
        return IXpsOMGeometryFigure(geometryFigure)
    }

    /**
     * Inserts an IXpsOMGeometryFigure interface pointer at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method inserts the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointer that is passed in <i>geometryFigure</i>.  Prior to the insertion, the pointer in this and all subsequent locations  is moved up by one index.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection where the interface pointer that is passed in <i>geometryFigure</i>  is to be inserted.
     * @param {IXpsOMGeometryFigure} geometryFigure The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointer that is to be inserted at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-insertat
     */
    InsertAt(index, geometryFigure) {
        result := ComCall(5, this, "uint", index, "ptr", geometryFigure, "HRESULT")
        return result
    }

    /**
     * Removes and releases an IXpsOMGeometryFigure interface pointer from a specified location in the collection.
     * @remarks
     * This method releases the interface  referenced by the pointer at  the location specified by <i>index</i>. After releasing the interface, this method compacts the collection by   reducing by 1 the index of each pointer subsequent to <i>index</i>.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection from which  an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointer is to be removed and released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Replaces an IXpsOMGeometryFigure interface pointer at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method releases the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface referenced by the existing pointer, then writes the pointer that is passed in <i>geometryFigure</i>.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointer is to be replaced.
     * @param {IXpsOMGeometryFigure} geometryFigure The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface pointer that will replace current contents at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-setat
     */
    SetAt(index, geometryFigure) {
        result := ComCall(7, this, "uint", index, "ptr", geometryFigure, "HRESULT")
        return result
    }

    /**
     * Appends an IXpsOMGeometryFigure interface to the end of the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {IXpsOMGeometryFigure} geometryFigure A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigure">IXpsOMGeometryFigure</a> interface that is to be appended to the collection.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-append
     */
    Append(geometryFigure) {
        result := ComCall(8, this, "ptr", geometryFigure, "HRESULT")
        return result
    }
}
