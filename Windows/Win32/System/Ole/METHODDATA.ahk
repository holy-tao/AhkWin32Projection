#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a method or property.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ns-oleauto-methoddata
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class METHODDATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The method name.
     * @type {Pointer<PWSTR>}
     */
    szName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An array of method parameters.
     * @type {Pointer<PARAMDATA>}
     */
    ppdata {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The ID of the method, as used in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>.
     * @type {Integer}
     */
    dispid {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The index of the method in the VTBL of the interface, starting with 0.
     * @type {Integer}
     */
    iMeth {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The calling convention. The CDECL and Pascal calling conventions are supported by the dispatch interface creation functions, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-createstddispatch">CreateStdDispatch</a>.
     * @type {Integer}
     */
    cc {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The number of arguments.
     * @type {Integer}
     */
    cArgs {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

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
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * The return type for the method.
     * @type {Integer}
     */
    vtReturn {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }
}
