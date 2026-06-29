#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\XPS_DASH.ahk" { XPS_DASH }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A collection of XPS_DASH structures.
 * @remarks
 * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdashcollection
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMDashCollection extends IUnknown {
    /**
     * The interface identifier for IXpsOMDashCollection
     * @type {Guid}
     */
    static IID := Guid("{081613f4-74eb-48f2-83b3-37a9ce2d7dc6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMDashCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetAt    : IntPtr
        InsertAt : IntPtr
        RemoveAt : IntPtr
        SetAt    : IntPtr
        Append   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMDashCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of XPS_DASH structures in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structures in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets an XPS_DASH structure from a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure is to  be obtained.
     * @returns {XPS_DASH} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure that is found at the location specified by <i>index</i>.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-getat
     */
    GetAt(index) {
        dash := XPS_DASH()
        result := ComCall(4, this, "uint", index, XPS_DASH.Ptr, dash, "HRESULT")
        return dash
    }

    /**
     * Inserts an XPS_DASH structure at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method inserts the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure that is passed in <i>dash</i>.  Prior to insertion, the structure in this and all subsequent locations is moved up by one index.
     * 
     * The figure that follows illustrates how the collection is changed by the <b>InsertAt</b> method.
     * 
     * <img alt="A figure that shows how InsertAt adds an entry to the dash collection" src="./images/dashcollection_insertat.png"/>
     * @param {Integer} index The zero-based index in the collection where the structure that is referenced by  <i>dash</i>  is to be inserted.
     * @param {Pointer<XPS_DASH>} dash A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure that is to be inserted at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-insertat
     */
    InsertAt(index, dash) {
        result := ComCall(5, this, "uint", index, XPS_DASH.Ptr, dash, "HRESULT")
        return result
    }

    /**
     * Removes and frees an XPS_DASH structure from a specified location in the collection.
     * @remarks
     * This method removes and frees  the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure  referenced by the pointer at  the location specified by <i>index</i>. After freeing the structure, this method compacts the collection by   reducing by 1 the index of each pointer subsequent to <i>index</i>.
     * 
     * The figure that follows illustrates how the collection is changed by the <b>RemoveAt</b> method.
     * 
     * <img alt="A figure that shows how RemoveAt removes an entry from the dash collection" src="./images/dashcollection_removeat.png"/>
     * @param {Integer} index The zero-based index in the collection from which  an <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure is to be removed and freed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Replaces an XPS_DASH structure at a specified location in the collection.
     * @remarks
     * At the location specified by <i>index</i>, this method frees the existing <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure then replaces it with the structure that is passed in <i>dash</i>.
     * 
     * The figure that follows illustrates how the collection is changed by the <b>SetAt</b> method.
     * 
     * <img alt="A figure that shows how SetAt changes an entry in the dash collection" src="./images/dashcollection_setat.png"/>
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure is to be replaced.
     * @param {Pointer<XPS_DASH>} dash A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure that will replace the current contents at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-setat
     */
    SetAt(index, dash) {
        result := ComCall(7, this, "uint", index, XPS_DASH.Ptr, dash, "HRESULT")
        return result
    }

    /**
     * Appends an XPS_DASH structure to the end of the collection.
     * @remarks
     * The figure that follows illustrates how the collection is changed by the <b>Append</b> method.
     * 
     * <img alt="A figure that shows how Append adds an entry to the dash collection" src="./images/dashcollection_append.png"/>
     * @param {Pointer<XPS_DASH>} dash A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure that is to be appended  to the collection.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-append
     */
    Append(dash) {
        result := ComCall(8, this, XPS_DASH.Ptr, dash, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsOMDashCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
        this.vtbl.InsertAt := CallbackCreate(GetMethod(implObj, "InsertAt"), flags, 3)
        this.vtbl.RemoveAt := CallbackCreate(GetMethod(implObj, "RemoveAt"), flags, 2)
        this.vtbl.SetAt := CallbackCreate(GetMethod(implObj, "SetAt"), flags, 3)
        this.vtbl.Append := CallbackCreate(GetMethod(implObj, "Append"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.InsertAt)
        CallbackFree(this.vtbl.RemoveAt)
        CallbackFree(this.vtbl.SetAt)
        CallbackFree(this.vtbl.Append)
    }
}
