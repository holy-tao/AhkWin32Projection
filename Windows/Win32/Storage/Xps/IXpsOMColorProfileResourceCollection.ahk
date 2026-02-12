#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMColorProfileResource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMColorProfileResource interface pointers.
 * @remarks
 * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresourcecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMColorProfileResourceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMColorProfileResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{12759630-5fba-4283-8f7d-cca849809edb}")

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
     * Gets the number of IXpsOMColorProfileResource interface pointers in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface pointers in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * Gets an IXpsOMColorProfileResource interface pointer from a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface pointer to be obtained.
     * @returns {IXpsOMColorProfileResource} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMColorProfileResource(object_)
    }

    /**
     * Inserts an IXpsOMColorProfileResource interface pointer at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method inserts the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface pointer that is passed in <i>object</i>.  Prior to the insertion, the pointer in this and all subsequent locations  is moved up by one index.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection where the interface pointer that is passed in <i>object</i>  is to be inserted.
     * @param {IXpsOMColorProfileResource} object_ The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface pointer that is to be inserted in the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-insertat
     */
    InsertAt(index, object_) {
        result := ComCall(5, this, "uint", index, "ptr", object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes and releases an IXpsOMColorProfileResource interface pointer from a specified location in the collection.
     * @remarks
     * This method releases the interface  referenced by the pointer at  the location specified by <i>index</i>. After releasing the interface, this method compacts the collection by   reducing by 1 the index of each pointer subsequent to <i>index</i>.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection from which  an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface pointer is to be removed and released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Replaces an IXpsOMColorProfileResource interface pointer at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method releases the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface referenced by the existing pointer, then writes the pointer that is passed in <i>object</i>.
     * 
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface pointer is to be replaced.
     * @param {IXpsOMColorProfileResource} object_ The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface pointer that will replace current contents at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-setat
     */
    SetAt(index, object_) {
        result := ComCall(7, this, "uint", index, "ptr", object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Appends an IXpsOMColorProfileResource interface pointer to the end of the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {IXpsOMColorProfileResource} object_ A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface that is to be appended to the collection.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-append
     */
    Append(object_) {
        result := ComCall(8, this, "ptr", object_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an IXpsOMColorProfileResource interface pointer from the collection by matching the interface's part name.
     * @param {IOpcPartUri} partName The part name of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface to be found in  the collection.
     * @returns {IXpsOMColorProfileResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcolorprofileresource">IXpsOMColorProfileResource</a> interface whose part name  matches <i>partName</i>. If a matching interface is not found in the collection, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomcolorprofileresourcecollection-getbypartname
     */
    GetByPartName(partName) {
        result := ComCall(9, this, "ptr", partName, "ptr*", &part := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMColorProfileResource(part)
    }
}
