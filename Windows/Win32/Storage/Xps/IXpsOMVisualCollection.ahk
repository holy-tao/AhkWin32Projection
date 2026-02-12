#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMVisual.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMVisual interface pointers.
 * @remarks
 * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisualcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMVisualCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMVisualCollection
     * @type {Guid}
     */
    static IID => Guid("{94d8abde-ab91-46a8-82b7-f5b05ef01a96}")

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
     * Gets the number of IXpsOMVisual interface pointers in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface pointers in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * Gets an IXpsOMVisual interface pointer from a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface pointer to be obtained.
     * @returns {IXpsOMVisual} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualcollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMVisual(object_)
    }

    /**
     * Inserts an IXpsOMVisual interface pointer at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method inserts the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface pointer that is passed in <i>object</i>.  Prior to the insertion, the pointer in this and all subsequent locations  is moved up by one index.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index of the collection where the interface pointer that is passed in <i>object</i>  is to be inserted.
     * @param {IXpsOMVisual} object_ The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface pointer that is to be inserted at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualcollection-insertat
     */
    InsertAt(index, object_) {
        result := ComCall(5, this, "uint", index, "ptr", object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes and releases an IXpsOMVisual interface pointer from a specified location in the collection.
     * @remarks
     * At  the location specified by <i>index</i>, this method releases the interface  referenced by the pointer. After releasing the interface, this method compacts the collection by   reducing by 1 the index of each pointer subsequent to <i>index</i>.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection from which  an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface pointer is to be removed and released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Replaces an IXpsOMVisual interface pointer at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method releases the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface referenced by the existing pointer, then writes the pointer that is passed in <i>object</i>.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface pointer is to be replaced.
     * @param {IXpsOMVisual} object_ The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface pointer that will replace current contents at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualcollection-setat
     */
    SetAt(index, object_) {
        result := ComCall(7, this, "uint", index, "ptr", object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Appends an IXpsOMVisual interface to the end of the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {IXpsOMVisual} object_ A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisual">IXpsOMVisual</a> interface that is to be appended to the collection.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomvisualcollection-append
     */
    Append(object_) {
        result := ComCall(8, this, "ptr", object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
