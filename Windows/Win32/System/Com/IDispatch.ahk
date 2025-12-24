#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeInfo.ahk
#Include .\IUnknown.ahk

/**
 * Exposes objects, methods and properties to programming tools and other applications that support Automation.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-idispatch
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDispatch extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispatch
     * @type {Guid}
     */
    static IID => Guid("{00020400-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeInfoCount", "GetTypeInfo", "GetIDsOfNames", "Invoke"]

    /**
     * Retrieves the number of type information interfaces that an object provides (either 0 or 1).
     * @returns {Integer} The number of type information interfaces provided by the object. If the object provides type information, this number is 1; otherwise the number is 0.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-idispatch-gettypeinfocount
     */
    GetTypeInfoCount() {
        result := ComCall(3, this, "uint*", &pctinfo := 0, "HRESULT")
        return pctinfo
    }

    /**
     * Retrieves the type information for an object, which can then be used to get the type information for an interface.
     * @param {Integer} iTInfo The type information to return. Pass 0 to retrieve type information for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> implementation.
     * @param {Integer} lcid The locale identifier for the type information. An object may be able to return different type information for different languages. This is important for classes that support localized member names. For classes that do not support localized member names, this parameter can be ignored.
     * @returns {ITypeInfo} The requested type information object.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-idispatch-gettypeinfo
     */
    GetTypeInfo(iTInfo, lcid) {
        result := ComCall(4, this, "uint", iTInfo, "uint", lcid, "ptr*", &ppTInfo := 0, "HRESULT")
        return ITypeInfo(ppTInfo)
    }

    /**
     * Maps a single member and an optional set of argument names to a corresponding set of integer DISPIDs, which can be used on subsequent calls to Invoke.
     * @param {Pointer<Guid>} riid Reserved for future use. Must be IID_NULL.
     * @param {Pointer<PWSTR>} rgszNames The array of names to be mapped.
     * @param {Integer} cNames The count of the names to be mapped.
     * @param {Integer} lcid The locale context in which to interpret the names.
     * @returns {Integer} Caller-allocated array, each element of which contains an identifier (ID) corresponding to one of the names passed in the rgszNames array. The first element represents the member name. The subsequent elements represent each of the member's parameters.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-idispatch-getidsofnames
     */
    GetIDsOfNames(riid, rgszNames, cNames, lcid) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", riid, rgszNamesMarshal, rgszNames, "uint", cNames, "uint", lcid, "int*", &rgDispId := 0, "HRESULT")
        return rgDispId
    }

    /**
     * Provides access to properties and methods exposed by an object.
     * @param {Integer} dispIdMember Identifies the member. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-getidsofnames">GetIDsOfNames</a> or the object's documentation to obtain the dispatch identifier.
     * @param {Pointer<Guid>} riid Reserved for future use. Must be IID_NULL.
     * @param {Integer} lcid The locale context in which to interpret arguments. The <i>lcid</i> is used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-getidsofnames">GetIDsOfNames</a> function, and is also passed to <b>Invoke</b> to allow the object to interpret its arguments specific to a locale.
     * 
     * Applications that do not support multiple national languages can ignore this parameter. For more information, refer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/supporting-multiple-national-languages">Supporting Multiple National Languages</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/exposing-activex-objects">Exposing ActiveX Objects</a>.
     * @param {Integer} wFlags Flags describing the context of the <b>Invoke</b> call.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_METHOD"></a><a id="dispatch_method"></a><dl>
     * <dt><b>DISPATCH_METHOD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is invoked as a method. If a property has the same name, both this and the DISPATCH_PROPERTYGET flag can be set.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_PROPERTYGET"></a><a id="dispatch_propertyget"></a><dl>
     * <dt><b>DISPATCH_PROPERTYGET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is retrieved as a property or data member.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_PROPERTYPUT"></a><a id="dispatch_propertyput"></a><dl>
     * <dt><b>DISPATCH_PROPERTYPUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is changed as a property or data member.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPATCH_PROPERTYPUTREF"></a><a id="dispatch_propertyputref"></a><dl>
     * <dt><b>DISPATCH_PROPERTYPUTREF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is changed by a reference assignment, rather than a value assignment. This flag is valid only when the property accepts a reference to an object.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DISPPARAMS>} pDispParams Pointer to a DISPPARAMS structure containing an array of arguments, an array of argument DISPIDs for named arguments, and counts for the number of elements in the arrays.
     * @param {Pointer<VARIANT>} pVarResult Pointer to the location where the result is to be stored, or NULL if the caller expects no result. This argument is ignored if DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF is specified.
     * @param {Pointer<EXCEPINFO>} pExcepInfo Pointer to a structure that contains exception information. This structure should be filled in if DISP_E_EXCEPTION is returned. Can be NULL.
     * @param {Pointer<Integer>} puArgErr The index within rgvarg of the first argument that has an error. Arguments are stored in pDispParams-&gt;rgvarg in reverse order, so the first argument is the one with the highest index in the array. This parameter is returned only when the resulting return value is DISP_E_TYPEMISMATCH or DISP_E_PARAMNOTFOUND. This argument can be set to null. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/returning-errors">Returning Errors</a>.
     * @returns {HRESULT} This method can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADPARAMCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of elements provided to DISPPARAMS is different from the number of arguments accepted by the method or property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_BADVARTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments in DISPPARAMS is not a valid variant type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_EXCEPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application needs to raise an exception. In this case, the structure passed in <i>pexcepinfo</i> should be filled in.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_MEMBERNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested member does not exist.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_NONAMEDARGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This implementation of <a href="/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> does not support named arguments.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the arguments in DISPPARAMS could not be coerced to the specified type.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_PARAMNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter IDs does not correspond to a parameter on the method. In this case, <i>puArgErr</i> is set to the first argument that contains the error.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_TYPEMISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments could not be coerced. The index of the first parameter with the incorrect type within rgvarg is returned in <i>puArgErr</i>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_UNKNOWNINTERFACE
     * 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface identifier passed in riid is not IID_NULL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_UNKNOWNLCID
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member being invoked interprets string arguments according to the LCID, and the LCID is not recognized. If the LCID is not needed to interpret arguments, this error should not be returned
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_PARAMNOTOPTIONAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter was omitted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-idispatch-invoke
     */
    Invoke(dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "int", dispIdMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pDispParams, "ptr", pVarResult, "ptr", pExcepInfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
