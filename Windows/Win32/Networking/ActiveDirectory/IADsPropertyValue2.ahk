#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used to represent the value of an IADsPropertyEntry object in any data format.
 * @remarks
 * 
  * The following table lists the <i>lnADsType</i> parameter values in the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadspropertyvalue2-getobjectproperty">GetObjectProperty</a> and 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadspropertyvalue2-putobjectproperty">PutObjectProperty</a> methods to the 
  *      corresponding <i>pvProp</i> data type.
  * 
  * <table>
  * <tr>
  * <th><i>lnADsType</i> value</th>
  * <th><i>pvProp</i> data type</th>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_INVALID</b>
  * 
  * </td>
  * <td>
  * Not available.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_DN_STRING</b>
  * 
  * </td>
  * <td>
  * <b>VT_BSTR</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_CASE_EXACT_STRING</b>
  * 
  * </td>
  * <td>
  * <b>VT_BSTR</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_CASE_IGNORE_STRING</b>
  * 
  * </td>
  * <td>
  * <b>VT_BSTR</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_PRINTABLE_STRING</b>
  * 
  * </td>
  * <td>
  * <b>VT_BSTR</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_NUMERIC_STRING</b>
  * 
  * </td>
  * <td>
  * <b>VT_BSTR</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_BOOLEAN</b>
  * 
  * </td>
  * <td>
  * <b>VT_BOOL</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_INTEGER</b>
  * 
  * </td>
  * <td>
  * <b>VT_I4</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_OCTET_STRING</b>
  * 
  * </td>
  * <td>
  * <b>VT_ARRAY</b> | <b>VT_UI4</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_UTC_TIME</b>
  * 
  * </td>
  * <td>
  * <b>VT_DATE</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_LARGE_INTEGER</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadslargeinteger">IADsLargeInteger</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_PROV_SPECIFIC</b>
  * 
  * </td>
  * <td>
  * <b>VT_ARRAY</b> | <b>VT_UI1</b>
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_OBJECT_CLASS</b>
  * 
  * </td>
  * <td>
  * Not available.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_CASEIGNORE_LIST</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscaseignorelist">IADsCaseIgnoreList</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_OCTET_LIST</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsoctetlist">IADsOctetList</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_PATH</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspath">IADsPath</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_POSTALADDRESS</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspostaladdress">IADsPostalAddress</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_TIMESTAMP</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadstimestamp">IADsTimestamp</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_BACKLINK</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsbacklink">IADsBackLink</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_TYPEDNAME</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadstypedname">IADsTypedName</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_HOLD</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadshold">IADsHold</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_NETADDRESS</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsnetaddress">IADsNetAddress</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_REPLICAPOINTER</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsreplicapointer">IADsReplicaPointer</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_FAXNUMBER</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsfaxnumber">IADsFaxNumber</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_EMAIL</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsemail">IADsEmail</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_NT_SECURITY_DESCRIPTOR</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_UNKNOWN</b>
  * 
  * </td>
  * <td>
  * Not available.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_DN_WITH_BINARY</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsdnwithbinary">IADsDNWithBinary</a>)
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>ADSTYPE_DN_WITH_STRING</b>
  * 
  * </td>
  * <td>
  * <b>VT_DISPATCH</b> (<a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsdnwithstring">IADsDNWithString</a>)
  * 
  * </td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspropertyvalue2
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPropertyValue2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPropertyValue2
     * @type {Guid}
     */
    static IID => Guid("{306e831c-5bc7-11d1-a3b8-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectProperty", "PutObjectProperty"]

    /**
     * 
     * @param {Pointer<Integer>} lnADsType 
     * @param {Pointer<VARIANT>} pvProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertyvalue2-getobjectproperty
     */
    GetObjectProperty(lnADsType, pvProp) {
        result := ComCall(7, this, "int*", lnADsType, "ptr", pvProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnADsType 
     * @param {VARIANT} vProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertyvalue2-putobjectproperty
     */
    PutObjectProperty(lnADsType, vProp) {
        result := ComCall(8, this, "int", lnADsType, "ptr", vProp, "HRESULT")
        return result
    }
}
