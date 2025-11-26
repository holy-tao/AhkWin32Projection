#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPMedia2.ahk

/**
 * The IWMPMedia3 interface provides methods that supplement the IWMPMedia2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmedia3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMedia3 extends IWMPMedia2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMedia3
     * @type {Guid}
     */
    static IID => Guid("{f118efc7-f03a-4fb4-99c9-1c02a5c1065b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getAttributeCountByType", "getItemInfoByType"]

    /**
     * The getAttributeCountByType method retrieves the number of attributes associated with the specified attribute type.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmedia3-getattributecountbytype
     */
    getAttributeCountByType(bstrType, bstrLanguage, plCount) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "ptr", bstrType, "ptr", bstrLanguage, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getItemInfoByType method retrieves the value of the attribute corresponding to the specified attribute type and index.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmedia3-getiteminfobytype
     */
    getItemInfoByType(bstrType, bstrLanguage, lIndex, pvarValue) {
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(27, this, "ptr", bstrType, "ptr", bstrLanguage, "int", lIndex, "ptr", pvarValue, "HRESULT")
        return result
    }
}
