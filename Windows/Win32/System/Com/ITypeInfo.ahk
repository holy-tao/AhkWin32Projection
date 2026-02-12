#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeComp.ahk
#Include .\ITypeInfo.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUnknown.ahk

/**
 * Used for reading information about objects. (ITypeInfo)
 * @remarks
 * Type information interfaces are intended to describe the parts of the application that can be called by outside clients, rather than those that might be used internally to build an application.
 * 
 * The <b>ITypeInfo</b> interface provides access to the following:  
 * 
 * <ul>
 * <li>
 * The set of function descriptions associated with the type. For interfaces, this contains the set of member functions in the interface.
 * 
 * </li>
 * <li>
 * The set of data member descriptions associated with the type. For structures, this contains the set of fields of the type.
 * 
 * </li>
 * <li>
 * The general attributes of the type, such as whether it describes a structure, an interface, and so on.
 * 
 * </li>
 * </ul>
 * The type description of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface can be used to implement the interface. For more information, see the description of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-createstddispatch">CreateStdDispatch</a> in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/dispatch-interfaces">Dispatch Interface and API Functions</a>. 
 * 
 * An instance of <b>ITypeInfo</b> provides various information about the type of an object, and is used in different ways. A compiler can use an <b>ITypeInfo</b> to compile references to members of the type. A type interface browser can use it to find information about each member of the type. An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> implementer can use it to provide automatic delegation of <b>IDispatch</b> calls to an interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nn-oaidl-itypeinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeInfo
     * @type {Guid}
     */
    static IID => Guid("{00020401-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeAttr", "GetTypeComp", "GetFuncDesc", "GetVarDesc", "GetNames", "GetRefTypeOfImplType", "GetImplTypeFlags", "GetIDsOfNames", "Invoke", "GetDocumentation", "GetDllEntry", "GetRefTypeInfo", "AddressOfMember", "CreateInstance", "GetMops", "GetContainingTypeLib", "ReleaseTypeAttr", "ReleaseFuncDesc", "ReleaseVarDesc"]

    /**
     * Retrieves a TYPEATTR structure that contains the attributes of the type description.
     * @remarks
     * To free the TYPEATTR structure, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-releasetypeattr">ITypeInfo::ReleaseTypeAttr</a>.
     * @returns {Pointer<TYPEATTR>} The attributes of this type description.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-gettypeattr
     */
    GetTypeAttr() {
        result := ComCall(3, this, "ptr*", &ppTypeAttr := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppTypeAttr
    }

    /**
     * Retrieves the ITypeComp interface for the type description, which enables a client compiler to bind to the type description's members.
     * @remarks
     * A client compiler can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> interface to bind to members of the type.
     * @returns {ITypeComp} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> of the containing type library.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-gettypecomp
     */
    GetTypeComp() {
        result := ComCall(4, this, "ptr*", &ppTComp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITypeComp(ppTComp)
    }

    /**
     * Retrieves the FUNCDESC structure that contains information about a specified function.
     * @remarks
     * The function <b>ITypeInfo::GetFuncDesc</b> provides access to a FUNCDESC structure that describes the function with the specified <i>index</i>. The FUNCDESC structure should be freed with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-releasefuncdesc">ITypeInfo::ReleaseFuncDesc</a>. The number of functions in the type is one of the attributes contained in the TYPEATTR structure.
     * @param {Integer} index The index of the function whose description is to be returned. The <i>index</i> should be in the range of 0 to 1 less than the number of functions in this type.
     * @returns {Pointer<FUNCDESC>} A FUNCDESC structure that describes the specified function.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getfuncdesc
     */
    GetFuncDesc(index) {
        result := ComCall(5, this, "uint", index, "ptr*", &ppFuncDesc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppFuncDesc
    }

    /**
     * Retrieves a VARDESC structure that describes the specified variable.
     * @remarks
     * To free the VARDESC structure, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-releasevardesc">ReleaseVarDesc</a>.
     * @param {Integer} index The index of the variable whose description is to be returned. The index should be in the range of 0 to 1 less than the number of variables in this type.
     * @returns {Pointer<VARDESC>} A VARDESC that describes the specified variable.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getvardesc
     */
    GetVarDesc(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &ppVarDesc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVarDesc
    }

    /**
     * Retrieves the variable with the specified member ID or the name of the property or method and the parameters that correspond to the specified function ID.
     * @remarks
     * The caller must release the returned BSTR array.
     * 
     * 
     * 
     * If the member ID identifies a property that is implemented with property functions, the property name is returned. For property get functions, the names of the function and its parameters are always returned.
     * 
     * 
     * 
     * For property put and put reference functions, the right side of the assignment is unnamed. If <i>cMaxNames</i> is less than is required to return all of the names of the parameters of a function, then only the names of the first <i>cMaxNames</i> - 1 parameters are returned. The names of the parameters are returned in the array in the same order that they appear elsewhere in the interface (for example, the same order in the parameter array associated with the FUNCDESC enumeration).
     * 
     * 
     * 
     * If the type description inherits from another type description, this function is recursive to the base type description, if necessary, to find the item with the requested member ID.
     * @param {Integer} memid The ID of the member whose name (or names) is to be returned.
     * @param {Pointer<BSTR>} rgBstrNames The caller-allocated array. On return, each of the elements contains the name (or names) associated with the member.
     * @param {Integer} cMaxNames The length of the passed-in <i>rgBstrNames</i> array.
     * @param {Pointer<Integer>} pcNames The number of names in the <i>rgBstrNames</i> array.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getnames
     */
    GetNames(memid, rgBstrNames, cMaxNames, pcNames) {
        pcNamesMarshal := pcNames is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "int", memid, "ptr", rgBstrNames, "uint", cMaxNames, pcNamesMarshal, pcNames, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * If a type description describes a COM class, it retrieves the type description of the implemented interface types.
     * @remarks
     * If the TKIND_DISPATCH type description is for a dual interface, the TKIND_INTERFACE type description can be obtained by calling <b>GetRefTypeOfImplType</b> with an <i>index</i> of –1, and by passing the returned <i>pRefTypehandle</i> to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-getreftypeinfo">GetRefTypeInfo</a> to retrieve the type information.
     * @param {Integer} index The index of the implemented type whose handle is returned. The valid range is 0 to the <b>cImplTypes</b> field in the TYPEATTR structure.
     * @returns {Integer} A handle for the implemented interface (if any). This handle can be passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-getreftypeinfo">ITypeInfo::GetRefTypeInfo</a> to get the type description.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getreftypeofimpltype
     */
    GetRefTypeOfImplType(index) {
        result := ComCall(8, this, "uint", index, "uint*", &pRefType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRefType
    }

    /**
     * Retrieves the IMPLTYPEFLAGS enumeration for one implemented interface or base interface in a type description.
     * @remarks
     * The flags are associated with the act of inheritance, and not with the inherited interface.
     * @param {Integer} index The index of the implemented interface or base interface for which to get the flags.
     * @returns {Integer} The IMPLTYPEFLAGS enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getimpltypeflags
     */
    GetImplTypeFlags(index) {
        result := ComCall(9, this, "uint", index, "int*", &pImplTypeFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pImplTypeFlags
    }

    /**
     * Maps between member names and member IDs, and parameter names and parameter IDs.
     * @remarks
     * The function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-getidsofnames">GetIDsOfNames</a> maps the name of a member (<b>rgszNames</b>[0]) and its parameters (<b>rgszNames</b>[1] ...<b>rgszNames</b>[<b>cNames</b>- 1]) to the ID of the member (<b>pMemId</b>[0]), and to the IDs of the specified parameters (<b>pMemId</b>[1] ... <b>pMemId</b>[<b>cNames</b>- 1]). The IDs of parameters are 0 for the first parameter in the member function's argument list, 1 for the second, and so on.
     * 
     * 
     * 
     * If the type description inherits from another type description, this function is recursive to the base type description, if necessary, to find the item with the requested member ID.
     * @param {Pointer<PWSTR>} rgszNames An array of names to be mapped.
     * @param {Integer} cNames The count of the names to be mapped.
     * @returns {Integer} Caller-allocated array in which name mappings are placed.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getidsofnames
     */
    GetIDsOfNames(rgszNames, cNames) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, rgszNamesMarshal, rgszNames, "uint", cNames, "int*", &pMemId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pMemId
    }

    /**
     * Invokes a method, or accesses a property of an object, that implements the interface described by the type description.
     * @remarks
     * Use the function <b>ITypeInfo::Invoke</b> to access a member of an object or invoke a method that implements the interface described by this type description. For objects that support the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface, you can use <b>Invoke</b> to implement <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a>.
     * 
     * 
     * 
     * <b>ITypeInfo::Invoke</b> takes a pointer to an instance of the class. Otherwise, its parameters are the same as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a>, except that <b>ITypeInfo::Invoke</b> omits the <i>refiid</i> and <i>lcid</i> parameters. When called, <b>ITypeInfo::Invoke</b> performs the actions described by the <b>IDispatch::Invoke</b> parameters on the specified instance.
     * 
     * 
     * 
     * For VTBL interface members, <b>ITypeInfo::Invoke</b> passes the LCID of the type information into parameters tagged with the lcid attribute, and the returned value into the retval attribute.
     * 
     * 
     * 
     * If the type description inherits from another type description, this function recurses on the base type description to find the item with the requested member ID.
     * @param {Pointer<Void>} pvInstance An instance of the interface described by this type description.
     * @param {Integer} memid The interface member.
     * @param {Integer} wFlags Flags describing the context of the invoke call.
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
     * The member is accessed as a method. If there is ambiguity, both this and the DISPATCH_PROPERTYGET flag can be set.
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
     * The member is changed by using a reference assignment, rather than a value assignment. This flag is valid only when the property accepts a reference to an object.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DISPPARAMS>} pDispParams An array of arguments, an array of DISPIDs for named arguments, and counts of the number of elements in each array.
     * @param {Pointer<VARIANT>} pVarResult The result. Should be null if the caller does not expect any result. If <i>wFlags</i> specifies DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF, <i>pVarResultis</i> is ignored.
     * @param {Pointer<EXCEPINFO>} pExcepInfo An exception information structure, which is filled in only if DISP_E_EXCEPTION is returned. If <i>pExcepInfo</i> is null on input, only an HRESULT error will be returned.
     * @param {Pointer<Integer>} puArgErr If Invoke returns DISP_E_TYPEMISMATCH, <i>puArgErr</i> indicates the index (within <i>rgvarg</i>) of the argument with incorrect type. If more than one argument returns an error, <i>puArgErr</i> indicates only the first argument with an error. Arguments in pDispParams-&gt;rgvarg appear in reverse order, so the first argument is the one having the highest index in the array. This parameter cannot be null.
     * @returns {HRESULT} <table>
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
     * <dt><b>DISP_E_EXCEPTION
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member being invoked has returned an error HRESULT. If the member implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a>, details are available in the error object. Otherwise, the <i>pExcepInfo</i> parameter contains details. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Any of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a> errors may also be returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-invoke
     */
    Invoke(pvInstance, memid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr) {
        pvInstanceMarshal := pvInstance is VarRef ? "ptr" : "ptr"
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pvInstanceMarshal, pvInstance, "int", memid, "ushort", wFlags, "ptr", pDispParams, "ptr", pVarResult, "ptr", pExcepInfo, puArgErrMarshal, puArgErr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the documentation string, the complete Help file name and path, and the context ID for the Help topic for a specified type description.
     * @remarks
     * The function <b>GetDocumentation</b> provides access to the documentation for the member specified by the <i>memid</i> parameter. If the passed-in <i>memid</i> is MEMBERID_NIL, then the documentation for the type description is returned.
     * 
     * 
     * 
     * If the type description inherits from another type description, this function is recursive to the base type description, if necessary, to find the item with the requested member ID.
     * 
     * 
     * 
     * The caller should use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the BSTRs referenced by <i>pBstrName</i>, <i>pBstrDocString</i>, and <i>pBstrHelpFile</i>.
     * @param {Integer} memid The ID of the member whose documentation is to be returned.
     * @param {Pointer<BSTR>} pBstrName The name of the specified item. If the caller does not need the item name, <i>pBstrName</i> can be null.
     * @param {Pointer<BSTR>} pBstrDocString The documentation string for the specified item. If the caller does not need the documentation string, <i>pBstrDocString</i> can be null.
     * @param {Pointer<Integer>} pdwHelpContext The Help localization context. If the caller does not need the Help context, it can be null.
     * @param {Pointer<BSTR>} pBstrHelpFile The fully qualified name of the file containing the DLL used for Help file. If the caller does not need the file name, it can be null.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getdocumentation
     */
    GetDocumentation(memid, pBstrName, pBstrDocString, pdwHelpContext, pBstrHelpFile) {
        pdwHelpContextMarshal := pdwHelpContext is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "int", memid, "ptr", pBstrName, "ptr", pBstrDocString, pdwHelpContextMarshal, pdwHelpContext, "ptr", pBstrHelpFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a description or specification of an entry point for a function in a DLL.
     * @remarks
     * The caller passes in a member ID, which represents the member function whose entry description is desired. If the function has a DLL entry point, the name of the DLL that contains the function, as well as its name or ordinal identifier, are placed in the passed-in pointers allocated by the caller. If there is no DLL entry point for the function, an error is returned.
     * 
     * 
     * 
     * If the type description inherits from another type description, this function is recursive to the base type description, if necessary, to find the item with the requested member ID.
     * 
     * 
     * 
     * The caller should use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the BSTRs referenced by <i>pBstrName</i> and <i>pBstrDllName</i>.
     * @param {Integer} memid The ID of the member function whose DLL entry description is to be returned.
     * @param {Integer} invKind The kind of member identified by <i>memid</i>. This is important for properties, because one <i>memid</i> can identify up to three separate functions.
     * @param {Pointer<BSTR>} pBstrDllName If not null, the function sets <i>pBstrDllName</i> to the name of the DLL.
     * @param {Pointer<BSTR>} pBstrName If not null, the function sets <i>pBstrName</i> to the name of the entry point. If the entry point is specified by an ordinal, this argument is null.
     * @param {Pointer<Integer>} pwOrdinal If not null, and if the function is defined by an ordinal, the function sets <i>pwOrdinal</i> to the ordinal.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getdllentry
     */
    GetDllEntry(memid, invKind, pBstrDllName, pBstrName, pwOrdinal) {
        pwOrdinalMarshal := pwOrdinal is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, "int", memid, "int", invKind, "ptr", pBstrDllName, "ptr", pBstrName, pwOrdinalMarshal, pwOrdinal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * If a type description references other type descriptions, it retrieves the referenced type descriptions.
     * @remarks
     * On return, the second parameter contains a pointer to a pointer to a type description that is referenced by this type description. A type description must have a reference to each type description that occurs as the type of any of its variables, function parameters, or function return types. For example, if the type of a data member is a record type, the type description for that data member contains the <i>hRefType</i> of a referenced type description. To get a pointer to the type description, the reference is passed to <b>GetRefTypeInfo</b>.
     * @param {Integer} hRefType A handle to the referenced type description to return.
     * @returns {ITypeInfo} The referenced type description.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getreftypeinfo
     */
    GetRefTypeInfo(hRefType) {
        result := ComCall(14, this, "uint", hRefType, "ptr*", &ppTInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITypeInfo(ppTInfo)
    }

    /**
     * Retrieves the addresses of static functions or variables, such as those defined in a DLL.
     * @remarks
     * The addresses are valid until the caller releases its reference to the type description. The <i>invKind</i> parameter can be ignored unless the address of a property function is being requested.
     * 
     * If the type description inherits from another type description, this function is recursive to the base type description, if necessary, to find the item with the requested member ID.
     * @param {Integer} memid The member ID of the static member whose address is to be retrieved. The member ID is defined by the DISPID.
     * @param {Integer} invKind Indicates whether the member is a property, and if so, what kind.
     * @returns {Pointer<Void>} The static member.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-addressofmember
     */
    AddressOfMember(memid, invKind) {
        result := ComCall(15, this, "int", memid, "int", invKind, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Creates a new instance of a type that describes a component object class (coclass).
     * @remarks
     * For types that describe a component object class (coclass), <b>CreateInstance</b> creates a new instance of the class. Normally, <b>CreateInstance</b> calls <b>CoCreateInstance</b> with the type description's GUID. For an Application object, it first calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-getactiveobject">GetActiveObject</a>. If the application is active, <b>GetActiveObject</b> returns the active object; otherwise, if <b>GetActiveObject</b> fails, <b>CreateInstance</b> calls <b>CoCreateInstance</b>.
     * @param {IUnknown} pUnkOuter The controlling <b>IUnknown</b>. If Null, then a stand-alone instance is created. If valid, then an aggregate object is created.
     * @param {Pointer<Guid>} riid An ID for the interface that the caller will use to communicate with the resulting object.
     * @returns {Pointer<Pointer<Void>>} An instance of the created object.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-createinstance
     */
    CreateInstance(pUnkOuter, riid) {
        result := ComCall(16, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", &ppvObj := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvObj
    }

    /**
     * Retrieves marshaling information.
     * @remarks
     * If the passed-in member ID is MEMBERID_NIL, the function returns the opcode string for marshaling the fields of the structure described by the type description. Otherwise, it returns the opcode string for marshaling the function specified by the index.
     * 
     * 
     * 
     * If the type description inherits from another type description, this function recurses on the base type description, if necessary, to find the item with the requested member ID.
     * @param {Integer} memid The member ID that indicates which marshaling information is needed.
     * @returns {BSTR} The opcode string used in marshaling the fields of the structure described by the referenced type description, or null if there is no information to return.
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getmops
     */
    GetMops(memid) {
        pBstrMops := BSTR()
        result := ComCall(17, this, "int", memid, "ptr", pBstrMops, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBstrMops
    }

    /**
     * Retrieves the containing type library and the index of the type description within that type library.
     * @param {Pointer<ITypeLib>} ppTLib The containing type library.
     * @param {Pointer<Integer>} pIndex The index of the type description within the containing type library.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * OLE could not find an implementation of one or more required interfaces.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-getcontainingtypelib
     */
    GetContainingTypeLib(ppTLib, pIndex) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr*", ppTLib, pIndexMarshal, pIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Releases a TYPEATTR previously returned by ITypeInfo::GetTypeAttr.
     * @param {Pointer<TYPEATTR>} pTypeAttr The TYPEATTR to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-releasetypeattr
     */
    ReleaseTypeAttr(pTypeAttr) {
        ComCall(19, this, "ptr", pTypeAttr)
    }

    /**
     * Releases a FUNCDESC previously returned by ITypeInfo::GetFuncDesc.
     * @param {Pointer<FUNCDESC>} pFuncDesc The FUNCDESC to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-releasefuncdesc
     */
    ReleaseFuncDesc(pFuncDesc) {
        ComCall(20, this, "ptr", pFuncDesc)
    }

    /**
     * Releases a VARDESC previously returned by ITypeInfo::GetVarDesc.
     * @param {Pointer<VARDESC>} pVarDesc The VARDESC to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/oaidl/nf-oaidl-itypeinfo-releasevardesc
     */
    ReleaseVarDesc(pVarDesc) {
        ComCall(21, this, "ptr", pVarDesc)
    }
}
