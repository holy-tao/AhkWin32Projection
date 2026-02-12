#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XPS_DASH.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of XPS_DASH structures.
 * @remarks
 * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomdashcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMDashCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMDashCollection
     * @type {Guid}
     */
    static IID => Guid("{081613f4-74eb-48f2-83b3-37a9ce2d7dc6}")

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
     * Gets the number of XPS_DASH structures in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structures in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * Gets an XPS_DASH structure from a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure is to  be obtained.
     * @returns {XPS_DASH} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_dash">XPS_DASH</a> structure that is found at the location specified by <i>index</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-getat
     */
    GetAt(index) {
        dash := XPS_DASH()
        result := ComCall(4, this, "uint", index, "ptr", dash, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-insertat
     */
    InsertAt(index, dash) {
        result := ComCall(5, this, "uint", index, "ptr", dash, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-setat
     */
    SetAt(index, dash) {
        result := ComCall(7, this, "uint", index, "ptr", dash, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomdashcollection-append
     */
    Append(dash) {
        result := ComCall(8, this, "ptr", dash, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
