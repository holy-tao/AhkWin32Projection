#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPMedia2.ahk" { IWMPMedia2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IWMPMedia3 interface provides methods that supplement the IWMPMedia2 interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmedia3
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPMedia3 extends IWMPMedia2 {
    /**
     * The interface identifier for IWMPMedia3
     * @type {Guid}
     */
    static IID := Guid("{f118efc7-f03a-4fb4-99c9-1c02a5c1065b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPMedia3 interfaces
    */
    struct Vtbl extends IWMPMedia2.Vtbl {
        getAttributeCountByType : IntPtr
        getItemInfoByType       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPMedia3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The getAttributeCountByType method retrieves the number of attributes associated with the specified attribute type.
     * @remarks
     * This method is used to determine the number of attributes corresponding to a particular attribute name for a given media item. Index numbers can then be passed to the <b>getItemInfoByType</b> method. This is useful, for example, when a media item has been categorized under multiple genres.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always retrieves a <b>long</b> set to 0.
     * @param {BSTR} bstrType <b>BSTR</b> containing the type.
     * @param {BSTR} bstrLanguage <b>BSTR</b> containing the language. If the value is set to null or "" (empty string), the current locale string is used. Otherwise, the value must be a valid RFC 1766 language string such as "en-us".
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count of attributes that are associated with the type.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia3-getattributecountbytype
     */
    getAttributeCountByType(bstrType, bstrLanguage, plCount) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, BSTR, bstrType, BSTR, bstrLanguage, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getItemInfoByType method retrieves the value of the attribute corresponding to the specified attribute type and index.
     * @remarks
     * This method retrieves the metadata for an individual digital media item or a media item that is part of a playlist.
     * 
     * This method supports attributes with multiple values and attributes with complex values. The <b>getItemInfo</b> method does not support attributes with multiple values and attributes with complex values.
     * 
     * The <b>attributeCount</b> method retrieves the number of attribute names available for a given media item. Index numbers can then be used with the <b>getAttributeName</b> method to determine the name of each available attribute. Individual attribute names can be passed to the <i>name</i> parameter of <b>getItemInfoByType</b>.
     * 
     * The <b>getAttributeCountByType</b> method returns the number of attributes that correspond to a particular attribute name for a given media item. Index numbers can then be passed to the <i>index</i> parameter of <b>getItemInfoByType</b>. This is useful when a media item has been categorized under multiple genres, for example.
     * 
     * The set of attributes available from sources other than the local library (remote libraries, portable devices, or CDs is defined by the other sources.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrType <b>BSTR</b> containing the type.
     * @param {BSTR} bstrLanguage <b>BSTR</b> containing the language. If the value is set to null or "" (empty string), the current locale string is used. Otherwise, the value must be a valid RFC 1766 language string such as "en-us".
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @param {Pointer<VARIANT>} pvarValue Pointer to a <b>VARIANT</b> that contains the returned value.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia3-getiteminfobytype
     */
    getItemInfoByType(bstrType, bstrLanguage, lIndex, pvarValue) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(27, this, BSTR, bstrType, BSTR, bstrLanguage, "int", lIndex, VARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPMedia3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getAttributeCountByType := CallbackCreate(GetMethod(implObj, "getAttributeCountByType"), flags, 4)
        this.vtbl.getItemInfoByType := CallbackCreate(GetMethod(implObj, "getItemInfoByType"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getAttributeCountByType)
        CallbackFree(this.vtbl.getItemInfoByType)
    }
}
