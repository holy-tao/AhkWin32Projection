#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ITypeComp interface provides a fast way to access information that compilers need when binding to and instantiating structures and interfaces.
 * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nn-oaidl-itypecomp
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
     * @remarks
     * Use <b>Bind</b> for binding to the variables and methods of a type, or for binding to the global variables and methods in a type library. The returned DESCKIND pointer <i>pDescKind</i> indicates whether the name was bound to a VARDESC, a FUNCDESC, or to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> instance. The returned <i>pBindPtr</i> points to the VARDESC, FUNCDESC, or <b>ITypeComp</b>.
     * 
     * If a data member or method is bound to, then ppTInfopoints to the type description that contains the method or data member.
     * 
     * 
     * 
     * If <b>Bind</b> binds the name to a nested binding context, it returns a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> instance in <i>pBindPtr</i> and a null type description pointer in <i>ppTInfo</i>. For example, if the name of a type description is passed for a module (TKIND_MODULE), enumeration (TKIND_ENUM), or coclass (TKIND_COCLASS), Bind returns the <b>ITypeComp</b> instance of the type description for the module, enumeration, or coclass. This feature supports languages such as Visual Basic that allow references to members of a type description to be qualified by the name of the type description. For example, a function in a module can be referenced by <i>modulename</i>.<i>functionname.</i>
     * 
     * The members of TKIND_ENUM, TKIND_MODULE, and TKIND_COCLASS types marked as Application objects can be bound to directly from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a>, without specifying the name of the module. The <b>ITypeComp</b> of a coclass defers to the <b>ITypeComp</b> of its default interface.
     * 
     * 
     * 
     * As with other methods of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a>, and <b>ITypeInfo</b>, the calling code is responsible for releasing the returned object instances or structures. If a VARDESC or FUNCDESC is returned, the caller is responsible for deleting it with the returned type description and releasing the type description instance itself. Otherwise, if an <b>ITypeComp</b> instance is returned, the caller must release it.
     * 
     * 
     * 
     * Special rules apply if you call a type library's <b>Bind</b> method, passing it the name of a member of an Application object class (a class that has the TYPEFLAG_FAPPOBJECT flag set). In this case, Bind returns DESCKIND_IMPLICITAPPOBJ in <i>pDescKind</i>, a VARDESC that describes the Application object in <i>pBindPtr</i>, and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> of the Application object class in <i>ppTInfo</i>. To bind to the object, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-gettypecomp">ITypeInfo::GetTypeComp</a> must make a call to get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> of the Application object class, and then reinvoke its <b>Bind</b> method with the name initially passed to the type library's <b>ITypeComp</b>.
     * 
     * 
     * 
     * The caller should use the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> pointer (<i>ppTInfo</i>) to get the address of the member.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The <i>wflags</i> parameter is the same as the <i>wflags</i> parameter in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a>.
     * </div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypecomp-bind
     */
    Bind(szName, lHashVal, wFlags, ppTInfo, pDescKind, pBindPtr) {
        szName := szName is String ? StrPtr(szName) : szName

        pDescKindMarshal := pDescKind is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", szName, "uint", lHashVal, "ushort", wFlags, "ptr*", ppTInfo, pDescKindMarshal, pDescKind, "ptr", pBindPtr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Binds to the type descriptions contained within a type library.
     * @remarks
     * Use the function <b>BindType</b> for binding a type name to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> that describes the type. This function is invoked on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> that is returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypelib-gettypecomp">ITypeLib::GetTypeComp</a> to bind to types defined within that library. It can also be used in the future for binding to nested types.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypecomp-bindtype
     */
    BindType(szName, lHashVal, ppTInfo, ppTComp) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(4, this, "ptr", szName, "uint", lHashVal, "ptr*", ppTInfo, "ptr*", ppTComp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
