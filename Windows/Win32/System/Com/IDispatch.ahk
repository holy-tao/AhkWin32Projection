#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeInfo.ahk
#Include .\IUnknown.ahk

/**
 * Exposes objects, methods and properties to programming tools and other applications that support Automation.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-idispatch
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
     * @remarks
     * The method may return zero, which indicates that the object does not provide any type information. In this case, the object may still be programmable through <b>IDispatch</b> or a VTBL, but does not provide run-time type information for browsers, compilers, or other programming tools that access type information. This can be useful for hiding an object from browsers.
     * @returns {Integer} The number of type information interfaces provided by the object. If the object provides type information, this number is 1; otherwise the number is 0.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-idispatch-gettypeinfocount
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-idispatch-gettypeinfo
     */
    GetTypeInfo(iTInfo, lcid) {
        result := ComCall(4, this, "uint", iTInfo, "uint", lcid, "ptr*", &ppTInfo := 0, "HRESULT")
        return ITypeInfo(ppTInfo)
    }

    /**
     * Maps a single member and an optional set of argument names to a corresponding set of integer DISPIDs, which can be used on subsequent calls to Invoke.
     * @remarks
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> implementation can associate any positive integer ID value with a given name. Zero is reserved for the default, or <b>Value</b> property; –1 is reserved to indicate an unknown name; and other negative values are defined for other purposes. For example, if <b>GetIDsOfNames</b> is called, and the implementation does not recognize one or more of the names, it returns DISP_E_UNKNOWNNAME, and the <i>rgDispId</i> array contains DISPID_UNKNOWN for the entries that correspond to the unknown names.
     * 
     * The member and parameter DISPIDs must remain constant for the lifetime of the object. This allows a client to obtain the DISPIDs once, and cache them for later use.
     * 
     * When <b>GetIDsOfNames</b> is called with more than one name, the first name (<i>rgszNames</i>[0]) corresponds to the member name, and subsequent names correspond to the names of the member's parameters.
     * 
     * The same name may map to different DISPIDs, depending on context. For example, a name may have a DISPID when it is used as a member name with a particular interface, a different ID as a member of a different interface, and different mapping for each time it appears as a parameter.
     * 
     * <b>GetIDsOfNames</b> is used when an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> client binds to names at run time. To bind at compile time instead, an <b>IDispatch</b> client can map names to DISPIDs by using the type information interfaces described in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/type-description-interfaces">Type Description Interfaces</a>. This allows a client to bind to members at compile time and avoid calling <b>GetIDsOfNames</b> at run time. For a description of binding at compile time, see Type Description Interfaces. 
     * 
     * The implementation of <b>GetIDsOfNames</b> is case insensitive. Users that need case-sensitive name mapping should use type information interfaces to map names to DISPIDs, rather than call <b>GetIDsOfNames</b>.
     * 
     * <div class="alert"><b>Caution</b>  You cannot use this method to access values that have been added dynamically, such as values added through JavaScript. Instead, use the GetDispID of the IDispatchEx interface. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/windows-scripting/reference/idispatchex-interface">IDispatchEx interface</a>.</div>
     * <div> </div>
     * @param {Pointer<Guid>} riid Reserved for future use. Must be IID_NULL.
     * @param {Pointer<PWSTR>} rgszNames The array of names to be mapped.
     * @param {Integer} cNames The count of the names to be mapped.
     * @param {Integer} lcid The locale context in which to interpret the names.
     * @returns {Integer} Caller-allocated array, each element of which contains an identifier (ID) corresponding to one of the names passed in the rgszNames array. The first element represents the member name. The subsequent elements represent each of the member's parameters.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-idispatch-getidsofnames
     */
    GetIDsOfNames(riid, rgszNames, cNames, lcid) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", riid, rgszNamesMarshal, rgszNames, "uint", cNames, "uint", lcid, "int*", &rgDispId := 0, "HRESULT")
        return rgDispId
    }

    /**
     * Provides access to properties and methods exposed by an object.
     * @remarks
     * Generally, you should not implement <b>Invoke</b> directly. Instead, use the dispatch interface to create functions <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-createstddispatch">CreateStdDispatch</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-dispinvoke">DispInvoke</a>. For details, refer to <b>CreateStdDispatch</b>, <b>DispInvoke</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/creating-the-idispatch-interface">Creating the IDispatch Interface</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/exposing-activex-objects">Exposing ActiveX Objects</a>. 
     * 
     * If some application-specific processing needs to be performed before calling a member, the code should perform the necessary actions, and then call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-invoke">ITypeInfo::Invoke</a> to invoke the member. <b>ITypeInfo::Invoke</b> acts exactly like <b>Invoke</b>. The standard implementations of <b>Invoke</b> created by <b>CreateStdDispatch</b> and <b>DispInvoke</b> defer to <b>ITypeInfo::Invoke</b>.
     * 
     * In an ActiveX client, <b>Invoke</b> should be used to get and set the values of properties, or to call a method of an ActiveX object. The <i>dispIdMember</i> argument identifies the member to invoke. The DISPIDs that identify members are defined by the implementer of the object and can be determined by using the object's documentation, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-getidsofnames">IDispatch::GetIDsOfNames</a> function, or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> interface.
     * 
     * When you use <b>IDispatch::Invoke()</b> with DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF, you have to specially initialize the <b>cNamedArgs</b> and <b>rgdispidNamedArgs</b> elements of your DISPPARAMS structure with the following: 
     * 
     * 
     * ```cpp
     * DISPID dispidNamed = DISPID_PROPERTYPUT;
     * dispparams.cNamedArgs = 1;
     * dispparams.rgdispidNamedArgs = &dispidNamed;
     * ```
     * 
     * 
     * The information that follows addresses developers of ActiveX clients and others who use code to expose ActiveX objects. It describes the behavior that users of exposed objects should expect.
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
     * This implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> does not support named arguments.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-idispatch-invoke
     */
    Invoke(dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "int", dispIdMember, "ptr", riid, "uint", lcid, "ushort", wFlags, "ptr", pDispParams, "ptr", pVarResult, "ptr", pExcepInfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
