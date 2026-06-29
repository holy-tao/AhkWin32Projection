#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPStringCollection interface provides methods that work with a collection of strings.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpstringcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPStringCollection extends IDispatch {
    /**
     * The interface identifier for IWMPStringCollection
     * @type {Guid}
     */
    static IID := Guid("{4a976298-8c0d-11d3-b389-00c04f68574b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPStringCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_count : IntPtr
        item      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPStringCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * The get_count method retrieves the number of items in the string collection.
     * @remarks
     * To retrieve the value of this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The item method retrieves the string at the given index.
     * @remarks
     * The <b>IWMPStringCollection</b> interface is used to retrieve the set of values available for an attribute. For example, the <b>IWMPMediaCollection::getAttributeStringCollection</b> method can be used to retrieve a pointer to an <b>IWMPStringCollection</b> interface representing all the values for the Genre attribute within the Audio media type. The <b>item</b> method can then be used to iterate through all of the possible values for the Genre attribute.
     * 
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @param {Pointer<BSTR>} pbstrString Pointer to a <b>BSTR</b> containing the string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection-item
     */
    item(lIndex, pbstrString) {
        result := ComCall(8, this, "int", lIndex, BSTR.Ptr, pbstrString, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPStringCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_count := CallbackCreate(GetMethod(implObj, "get_count"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_count)
        CallbackFree(this.vtbl.item)
    }
}
