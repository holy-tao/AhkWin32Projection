#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Com\CALLCONV.ahk" { CALLCONV }
#Import ".\PARAMDATA.ahk" { PARAMDATA }

/**
 * Describes a method or property.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ns-oleauto-methoddata
 * @namespace Windows.Win32.System.Ole
 */
export default struct METHODDATA {
    #StructPack 8

    /**
     * The method name.
     */
    szName : PWSTR

    /**
     * An array of method parameters.
     */
    ppdata : PARAMDATA.Ptr

    /**
     * The ID of the method, as used in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>.
     */
    dispid : Int32

    /**
     * The index of the method in the VTBL of the interface, starting with 0.
     */
    iMeth : UInt32

    /**
     * The calling convention. The CDECL and Pascal calling conventions are supported by the dispatch interface creation functions, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-createstddispatch">CreateStdDispatch</a>.
     */
    cc : CALLCONV

    /**
     * The number of arguments.
     */
    cArgs : UInt32

    /**
     * Invoke flags.
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
     * The member is set as a property or data member.
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
     */
    wFlags : UInt16

    /**
     * The return type for the method.
     */
    vtReturn : VARENUM

}
