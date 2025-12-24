#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves the information in the property pages offered by an object.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iperpropertybrowsing
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPerPropertyBrowsing extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerPropertyBrowsing
     * @type {Guid}
     */
    static IID => Guid("{376bd3aa-3845-101b-84ed-08002b2ec713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayString", "MapPropertyToPage", "GetPredefinedStrings", "GetPredefinedValue"]

    /**
     * Retrieves a text string describing the specified property.
     * @param {Integer} dispID The dispatch identifier of the property whose display name is requested.
     * @returns {BSTR} A pointer to a variable that receives the display name for the property identified in <i>dispID</i>. The string is allocated by this method using <b>SysAllocString</b>. Upon return, the string is the responsibility of the caller, which must free it with <b>SysFreeString</b> when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iperpropertybrowsing-getdisplaystring
     */
    GetDisplayString(dispID) {
        pBstr := BSTR()
        result := ComCall(3, this, "int", dispID, "ptr", pBstr, "HRESULT")
        return pBstr
    }

    /**
     * Retrieves the CLSID of the property page associated with the specified property.
     * @param {Integer} dispID The dispatch identifier of the property.
     * @returns {Guid} A pointer to the CLSID identifying the property page associated with the property specified by <i>dispID</i>. If this method fails, *<i>pClsid</i> is set to CLSID_NULL.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iperpropertybrowsing-mappropertytopage
     */
    MapPropertyToPage(dispID) {
        pClsid := Guid()
        result := ComCall(4, this, "int", dispID, "ptr", pClsid, "HRESULT")
        return pClsid
    }

    /**
     * Retrieves an array description strings for the allowable values that the specified property can accept.
     * @param {Integer} dispID The dispatch identifier of the property.
     * @param {Pointer<CALPOLESTR>} pCaStringsOut A pointer to a caller-allocated, counted array structure that contains the element count and address of a method-allocated array of string pointers. This method also allocates memory for the string values containing the predefined names, and it stores the string pointers in the array. If the method fails, no memory is allocated, and the contents of the structure are undefined.
     * @param {Pointer<CADWORD>} pCaCookiesOut A pointer to the caller-allocated, counted array structure that contains the element count and address of a method-allocated array of <b>DWORD</b> values. The values in the array can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue">IPerPropertyBrowsing::GetPredefinedValue</a> to retrieve the value associated with the name in the same array position inside <i>pCaStringsOut</i>. If the method fails, no memory is allocated, and the contents of the structure are undefined.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The method completed succesfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not implemented and predefined names are not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>pCaStringsOut</i> or <i>pCaCookiesOut</i> is not valid. For example, either parameter may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedstrings
     */
    GetPredefinedStrings(dispID, pCaStringsOut, pCaCookiesOut) {
        result := ComCall(5, this, "int", dispID, "ptr", pCaStringsOut, "ptr", pCaCookiesOut, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the specified property that is associated with a predefined string name.
     * @param {Integer} dispID The dispatch identifier of the property for which a predefined value is requested.
     * @param {Integer} dwCookie A token identifying which value to return. The token was previously returned in the <i>pCaCookiesOut</i> array filled by <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedstrings">GetPredefinedStrings</a>.
     * @returns {VARIANT} A pointer to the <b>VARIANT</b> value for the property.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iperpropertybrowsing-getpredefinedvalue
     */
    GetPredefinedValue(dispID, dwCookie) {
        pVarOut := VARIANT()
        result := ComCall(6, this, "int", dispID, "uint", dwCookie, "ptr", pVarOut, "HRESULT")
        return pVarOut
    }
}
