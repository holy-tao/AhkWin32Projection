#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPMedia2.ahk

/**
 * The IWMPMedia3 interface provides methods that supplement the IWMPMedia2 interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpmedia3
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpmedia3-getattributecountbytype
     */
    getAttributeCountByType(bstrType, bstrLanguage, plCount) {
        if(bstrType is String) {
            pin := BSTR.Alloc(bstrType)
            bstrType := pin.Value
        }
        if(bstrLanguage is String) {
            pin := BSTR.Alloc(bstrLanguage)
            bstrLanguage := pin.Value
        }

        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, "ptr", bstrType, "ptr", bstrLanguage, plCountMarshal, plCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpmedia3-getiteminfobytype
     */
    getItemInfoByType(bstrType, bstrLanguage, lIndex, pvarValue) {
        if(bstrType is String) {
            pin := BSTR.Alloc(bstrType)
            bstrType := pin.Value
        }
        if(bstrLanguage is String) {
            pin := BSTR.Alloc(bstrLanguage)
            bstrLanguage := pin.Value
        }

        result := ComCall(27, this, "ptr", bstrType, "ptr", bstrLanguage, "int", lIndex, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
