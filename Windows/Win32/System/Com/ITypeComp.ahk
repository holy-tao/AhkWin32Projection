#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ITypeComp interface provides a fast way to access information that compilers need when binding to and instantiating structures and interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypecomp
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeComp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeComp
     * @type {Guid}
     */
    static IID => Guid("{00020403-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Bind", "BindType"]

    /**
     * Maps a name to a member of a type, or binds global variables and functions contained in a type library.
     * @param {PWSTR} szName The name to be bound.
     * @param {Integer} lHashVal The hash value for the name computed by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-lhashvalofnamesys">LHashValOfNameSys</a>.
     * @param {Integer} wFlags One or more of the flags defined in the INVOKEKIND enumeration. Specifies whether the name was referenced as a method or a property. When binding to a variable, specify the flag INVOKE_PROPERTYGET. Specify zero to bind to any type of member.
     * @param {Pointer<ITypeInfo>} ppTInfo If a FUNCDESC or VARDESC was returned, then <i>ppTInfo</i> points to a pointer to the type description that contains the item to which it is bound.
     * @param {Pointer<Integer>} pDescKind Indicates whether the name bound to is a VARDESC, FUNCDESC, or TYPECOMP. If there was no match, DESCKIND_NONE.
     * @param {Pointer<BINDPTR>} pBindPtr The bound-to VARDESC, FUNCDESC, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> interface.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypecomp-bind
     */
    Bind(szName, lHashVal, wFlags, ppTInfo, pDescKind, pBindPtr) {
        szName := szName is String ? StrPtr(szName) : szName

        pDescKindMarshal := pDescKind is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", szName, "uint", lHashVal, "ushort", wFlags, "ptr*", ppTInfo, pDescKindMarshal, pDescKind, "ptr", pBindPtr, "HRESULT")
        return result
    }

    /**
     * Binds to the type descriptions contained within a type library.
     * @param {PWSTR} szName The name to be bound.
     * @param {Integer} lHashVal The hash value for the name computed by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-lhashvalofname">LHashValOfName</a>.
     * @param {Pointer<ITypeInfo>} ppTInfo An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> of the type to which the name was bound.
     * @param {Pointer<ITypeComp>} ppTComp Passes a valid pointer, such as the address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> variable.
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
     * <dt><b>S_OK
     * </b></dt>
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
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the arguments is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypecomp-bindtype
     */
    BindType(szName, lHashVal, ppTInfo, ppTComp) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(4, this, "ptr", szName, "uint", lHashVal, "ptr*", ppTInfo, "ptr*", ppTComp, "HRESULT")
        return result
    }
}
