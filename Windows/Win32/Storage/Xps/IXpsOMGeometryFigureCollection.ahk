#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMGeometryFigure.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMGeometryFigure interface pointers.
 * @remarks
 * 
 * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometryfigurecollection
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IXpsOMGeometryFigure} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &geometryFigure := 0, "HRESULT")
        return IXpsOMGeometryFigure(geometryFigure)
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMGeometryFigure} geometryFigure 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-insertat
     */
    InsertAt(index, geometryFigure) {
        result := ComCall(5, this, "uint", index, "ptr", geometryFigure, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMGeometryFigure} geometryFigure 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-setat
     */
    SetAt(index, geometryFigure) {
        result := ComCall(7, this, "uint", index, "ptr", geometryFigure, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMGeometryFigure} geometryFigure 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomgeometryfigurecollection-append
     */
    Append(geometryFigure) {
        result := ComCall(8, this, "ptr", geometryFigure, "HRESULT")
        return result
    }
}
