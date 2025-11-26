#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPStringCollection.ahk

/**
 * The IWMPStringCollection2 interface provides methods that supplement the IWMPStringCollection interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpstringcollection2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPStringCollection2 extends IWMPStringCollection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPStringCollection2
     * @type {Guid}
     */
    static IID => Guid("{46ad648d-53f1-4a74-92e2-2a1b68d63fd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["isIdentical", "getItemInfo", "getAttributeCountByType", "getItemInfoByType"]

    /**
     * The isIdentical method retrieves a value indicating whether the supplied object is the same as the current one.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpstringcollection2-isidentical
     */
    isIdentical(pIWMPStringCollection2, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, "ptr", pIWMPStringCollection2, pvboolMarshal, pvbool, "HRESULT")
        return result
    }

    /**
     * The getItemInfo method retrieves the string corresponding to the specified string collection item index and name.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpstringcollection2-getiteminfo
     */
    getItemInfo(lCollectionIndex, bstrItemName, pbstrValue) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(10, this, "int", lCollectionIndex, "ptr", bstrItemName, "ptr", pbstrValue, "HRESULT")
        return result
    }

    /**
     * The getAttributeCountByType method retrieves the number of attributes associated with the specified string collection index, attribute name, and language.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpstringcollection2-getattributecountbytype
     */
    getAttributeCountByType(lCollectionIndex, bstrType, bstrLanguage, plCount) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", lCollectionIndex, "ptr", bstrType, "ptr", bstrLanguage, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getItemInfoByType method retrieves the value corresponding to the specified string collection item index, name, language, and attribute index.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpstringcollection2-getiteminfobytype
     */
    getItemInfoByType(lCollectionIndex, bstrType, bstrLanguage, lAttributeIndex, pvarValue) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(12, this, "int", lCollectionIndex, "ptr", bstrType, "ptr", bstrLanguage, "int", lAttributeIndex, "ptr", pvarValue, "HRESULT")
        return result
    }
}
