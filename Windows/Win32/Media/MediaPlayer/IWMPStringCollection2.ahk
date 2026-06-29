#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPStringCollection.ahk" { IWMPStringCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IWMPStringCollection2 interface provides methods that supplement the IWMPStringCollection interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpstringcollection2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPStringCollection2 extends IWMPStringCollection {
    /**
     * The interface identifier for IWMPStringCollection2
     * @type {Guid}
     */
    static IID := Guid("{46ad648d-53f1-4a74-92e2-2a1b68d63fd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPStringCollection2 interfaces
    */
    struct Vtbl extends IWMPStringCollection.Vtbl {
        isIdentical             : IntPtr
        getItemInfo             : IntPtr
        getAttributeCountByType : IntPtr
        getItemInfoByType       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPStringCollection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The isIdentical method retrieves a value indicating whether the supplied object is the same as the current one.
     * @remarks
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {IWMPStringCollection2} pIWMPStringCollection2 Pointer to an <b>IWMPStringCollection2</b> interface that represents the object to compare with current one.
     * @param {Pointer<VARIANT_BOOL>} pvbool Pointer to a <b>VARIANT_BOOL</b> that receives the result of the comparison. VARIANT_TRUE indicates that the objects are the same.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-isidentical
     */
    isIdentical(pIWMPStringCollection2, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, "ptr", pIWMPStringCollection2, pvboolMarshal, pvbool, "HRESULT")
        return result
    }

    /**
     * The getItemInfo method retrieves the string corresponding to the specified string collection item index and name.
     * @remarks
     * To retrieve attributes with multiple values and attributes with complex values, use the <b>getItemInfoByType</b> method.
     * 
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} lCollectionIndex A <b>long</b> specifying the zero-based index of the string collection item from which to get the attribute.
     * @param {BSTR} bstrItemName <b>BSTR</b> containing the attribute name.
     * @param {Pointer<BSTR>} pbstrValue Pointer to a <b>BSTR</b> that receives the string. For attributes whose underlying value is <b>Boolean</b>, it returns the string "true" or "false".
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-getiteminfo
     */
    getItemInfo(lCollectionIndex, bstrItemName, pbstrValue) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(10, this, "int", lCollectionIndex, BSTR, bstrItemName, BSTR.Ptr, pbstrValue, "HRESULT")
        return result
    }

    /**
     * The getAttributeCountByType method retrieves the number of attributes associated with the specified string collection index, attribute name, and language.
     * @remarks
     * This method is used to determine the number of attributes corresponding to a particular attribute name for a given <b>StringCollection</b> item. Index numbers can then be passed to the fourth parameter of the <b>getItemInfoByType</b> method.
     * 
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} lCollectionIndex A <b>long</b> specifying the zero-based index of the string collection item from which to get the attribute.
     * @param {BSTR} bstrType <b>BSTR</b> containing the name of the attribute.
     * @param {BSTR} bstrLanguage <b>BSTR</b> containing the language. If the value is set to null or "" (empty string), the current locale string is used. Otherwise, the value must be a valid RFC 1766 language string such as "en-us".
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that receives the count.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-getattributecountbytype
     */
    getAttributeCountByType(lCollectionIndex, bstrType, bstrLanguage, plCount) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", lCollectionIndex, BSTR, bstrType, BSTR, bstrLanguage, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getItemInfoByType method retrieves the value corresponding to the specified string collection item index, name, language, and attribute index.
     * @remarks
     * This method supports attributes with multiple values and attributes with complex values. The <b>getItemInfo</b> method does not support attributes with multiple values or attributes with complex values.
     * 
     * By passing the value "ChildList" in the <i>bstrType</i> parameter, you can retrieve a new string collection that contains the children of one of the items in the parent string collection. For instance, if the parent collection contains a list of AlbumIDs, you can use this method to obtain a child string collection that contains all the tracks for one of the albums. This approach is faster and more efficient than calling the <b>IWMPMediaCollection2::getStringCollectionByQuery</b> method twice; once to get a collection of AlbumIDs, and a second time to get a collection of titles for a particular AlbumID. To use ChildList in the way just described, the parent string collection must be obtained from a media collection through <b>IWMPLibraryServices</b>, and not by using the <b>IWMPCore::get_mediaCollection</b> method.
     * 
     * When using ChildList, pass the value "ChildList" in the <i>bstrType</i> parameter, and the value 0 in the <i>lAttributeIndex</i> parameter. You can call <b>QueryInterface</b> on the <b>VARIANT</b> that is returned to obtain an <b>IWMPStringCollection2</b> interface, from which you can access the child list.
     * 
     * To use this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} lCollectionIndex A <b>long</b> specifying the zero-based index of the string collection item from which to get the attribute.
     * @param {BSTR} bstrType <b>BSTR</b> containing the attribute name.
     * @param {BSTR} bstrLanguage <b>BSTR</b> containing the language. If the value is set to null or "" (empty string) the current locale string is used. Otherwise, the value must be a valid RFC 1766 language string such as "en-us".
     * @param {Integer} lAttributeIndex A <b>long</b> containing the zero-based index of the attribute.
     * @param {Pointer<VARIANT>} pvarValue Pointer to a <b>VARIANT</b> that receives the returned value.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection2-getiteminfobytype
     */
    getItemInfoByType(lCollectionIndex, bstrType, bstrLanguage, lAttributeIndex, pvarValue) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(12, this, "int", lCollectionIndex, BSTR, bstrType, BSTR, bstrLanguage, "int", lAttributeIndex, VARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPStringCollection2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.isIdentical := CallbackCreate(GetMethod(implObj, "isIdentical"), flags, 3)
        this.vtbl.getItemInfo := CallbackCreate(GetMethod(implObj, "getItemInfo"), flags, 4)
        this.vtbl.getAttributeCountByType := CallbackCreate(GetMethod(implObj, "getAttributeCountByType"), flags, 5)
        this.vtbl.getItemInfoByType := CallbackCreate(GetMethod(implObj, "getItemInfoByType"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.isIdentical)
        CallbackFree(this.vtbl.getItemInfo)
        CallbackFree(this.vtbl.getAttributeCountByType)
        CallbackFree(this.vtbl.getItemInfoByType)
    }
}
