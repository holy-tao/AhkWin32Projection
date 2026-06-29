#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\INVOKEKIND.ahk" { INVOKEKIND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICreateTypeInfo.ahk" { ICreateTypeInfo }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides the tools for creating and administering the type information defined through the type description. (ICreateTypeInfo2)
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-icreatetypeinfo2
 * @namespace Windows.Win32.System.Ole
 */
export default struct ICreateTypeInfo2 extends ICreateTypeInfo {
    /**
     * The interface identifier for ICreateTypeInfo2
     * @type {Guid}
     */
    static IID := Guid("{0002040e-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateTypeInfo2 interfaces
    */
    struct Vtbl extends ICreateTypeInfo.Vtbl {
        DeleteFuncDesc           : IntPtr
        DeleteFuncDescByMemId    : IntPtr
        DeleteVarDesc            : IntPtr
        DeleteVarDescByMemId     : IntPtr
        DeleteImplType           : IntPtr
        SetCustData              : IntPtr
        SetFuncCustData          : IntPtr
        SetParamCustData         : IntPtr
        SetVarCustData           : IntPtr
        SetImplTypeCustData      : IntPtr
        SetHelpStringContext     : IntPtr
        SetFuncHelpStringContext : IntPtr
        SetVarHelpStringContext  : IntPtr
        Invalidate               : IntPtr
        SetName                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateTypeInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deletes a function description specified by the index number.
     * @param {Integer} index The index of the function whose description is to be deleted. The index should be in the range of 0 to 1 less than the number of functions in this type.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletefuncdesc
     */
    DeleteFuncDesc(index) {
        result := ComCall(26, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Deletes the specified function description (FUNCDESC).
     * @param {Integer} memid The member identifier of the FUNCDESC to delete.
     * @param {INVOKEKIND} invKind The type of the invocation.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletefuncdescbymemid
     */
    DeleteFuncDescByMemId(memid, invKind) {
        result := ComCall(27, this, "int", memid, INVOKEKIND, invKind, "HRESULT")
        return result
    }

    /**
     * Deletes the specified VARDESC structure. (ICreateTypeInfo2.DeleteVarDesc)
     * @param {Integer} index The index number of the VARDESC structure.
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
     * <dt><b>TYPE_E_IOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot read from the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVDATAREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot read from the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_UNSUPFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library has an old format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library cannot be opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletevardesc
     */
    DeleteVarDesc(index) {
        result := ComCall(28, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Deletes the specified VARDESC structure. (ICreateTypeInfo2.DeleteVarDescByMemId)
     * @param {Integer} memid The member identifier of the VARDESC to be deleted.
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
     * <dt><b>TYPE_E_IOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot read from the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVDATAREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot read from the file.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_UNSUPFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library has an old format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type library cannot be opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletevardescbymemid
     */
    DeleteVarDescByMemId(memid) {
        result := ComCall(29, this, "int", memid, "HRESULT")
        return result
    }

    /**
     * Deletes the IMPLTYPE flags for the indexed interface.
     * @param {Integer} index The index of the interface for which to delete the type flags.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deleteimpltype
     */
    DeleteImplType(index) {
        result := ComCall(30, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Sets a value for custom data.
     * @param {Pointer<Guid>} guid The unique identifier that can be used to identify the data.
     * @param {Pointer<VARIANT>} pVarVal The data to store (any variant except an object).
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setcustdata
     */
    SetCustData(guid, pVarVal) {
        result := ComCall(31, this, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return result
    }

    /**
     * Sets a value for custom data for the specified function.
     * @param {Integer} index The index of the function for which to set the custom data.
     * @param {Pointer<Guid>} guid The unique identifier used to identify the data.
     * @param {Pointer<VARIANT>} pVarVal The data to store (any variant except an object).
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setfunccustdata
     */
    SetFuncCustData(index, guid, pVarVal) {
        result := ComCall(32, this, "uint", index, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return result
    }

    /**
     * Sets a value for the custom data for the specified parameter.
     * @param {Integer} indexFunc The index of the function for which to set the custom data.
     * @param {Integer} indexParam The index of the parameter of the function for which to set the custom data.
     * @param {Pointer<Guid>} guid The globally unique identifier (GUID) used to identify the data.
     * @param {Pointer<VARIANT>} pVarVal The data to store (any variant except an object).
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setparamcustdata
     */
    SetParamCustData(indexFunc, indexParam, guid, pVarVal) {
        result := ComCall(33, this, "uint", indexFunc, "uint", indexParam, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return result
    }

    /**
     * Sets a value for custom data for the specified variable.
     * @param {Integer} index The index of the variable for which to set the custom data.
     * @param {Pointer<Guid>} guid The globally unique ID (GUID) used to identify the data.
     * @param {Pointer<VARIANT>} pVarVal The data to store (any variant except an object).
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setvarcustdata
     */
    SetVarCustData(index, guid, pVarVal) {
        result := ComCall(34, this, "uint", index, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return result
    }

    /**
     * Sets a value for custom data for the specified implementation type.
     * @param {Integer} index The index of the variable for which to set the custom data.
     * @param {Pointer<Guid>} guid The unique identifier used to identify the data.
     * @param {Pointer<VARIANT>} pVarVal The data to store (any variant except an object).
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setimpltypecustdata
     */
    SetImplTypeCustData(index, guid, pVarVal) {
        result := ComCall(35, this, "uint", index, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return result
    }

    /**
     * Sets the context number for the specified Help string.
     * @param {Integer} dwHelpStringContext The Help string context number.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-sethelpstringcontext
     */
    SetHelpStringContext(dwHelpStringContext) {
        result := ComCall(36, this, "uint", dwHelpStringContext, "HRESULT")
        return result
    }

    /**
     * Sets a Help context value for a specified function.
     * @param {Integer} index The index of the function for which to set the help string context.
     * @param {Integer} dwHelpStringContext The Help string context for a localized string.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setfunchelpstringcontext
     */
    SetFuncHelpStringContext(index, dwHelpStringContext) {
        result := ComCall(37, this, "uint", index, "uint", dwHelpStringContext, "HRESULT")
        return result
    }

    /**
     * Sets a Help context value for a specified variable.
     * @param {Integer} index The index of the variable.
     * @param {Integer} dwHelpStringContext The Help string context for a localized string.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setvarhelpstringcontext
     */
    SetVarHelpStringContext(index, dwHelpStringContext) {
        result := ComCall(38, this, "uint", index, "uint", dwHelpStringContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Invalidate() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * Sets the name of the typeinfo.
     * @param {PWSTR} szName The name to be assigned.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setname
     */
    SetName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(40, this, "ptr", szName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICreateTypeInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeleteFuncDesc := CallbackCreate(GetMethod(implObj, "DeleteFuncDesc"), flags, 2)
        this.vtbl.DeleteFuncDescByMemId := CallbackCreate(GetMethod(implObj, "DeleteFuncDescByMemId"), flags, 3)
        this.vtbl.DeleteVarDesc := CallbackCreate(GetMethod(implObj, "DeleteVarDesc"), flags, 2)
        this.vtbl.DeleteVarDescByMemId := CallbackCreate(GetMethod(implObj, "DeleteVarDescByMemId"), flags, 2)
        this.vtbl.DeleteImplType := CallbackCreate(GetMethod(implObj, "DeleteImplType"), flags, 2)
        this.vtbl.SetCustData := CallbackCreate(GetMethod(implObj, "SetCustData"), flags, 3)
        this.vtbl.SetFuncCustData := CallbackCreate(GetMethod(implObj, "SetFuncCustData"), flags, 4)
        this.vtbl.SetParamCustData := CallbackCreate(GetMethod(implObj, "SetParamCustData"), flags, 5)
        this.vtbl.SetVarCustData := CallbackCreate(GetMethod(implObj, "SetVarCustData"), flags, 4)
        this.vtbl.SetImplTypeCustData := CallbackCreate(GetMethod(implObj, "SetImplTypeCustData"), flags, 4)
        this.vtbl.SetHelpStringContext := CallbackCreate(GetMethod(implObj, "SetHelpStringContext"), flags, 2)
        this.vtbl.SetFuncHelpStringContext := CallbackCreate(GetMethod(implObj, "SetFuncHelpStringContext"), flags, 3)
        this.vtbl.SetVarHelpStringContext := CallbackCreate(GetMethod(implObj, "SetVarHelpStringContext"), flags, 3)
        this.vtbl.Invalidate := CallbackCreate(GetMethod(implObj, "Invalidate"), flags, 1)
        this.vtbl.SetName := CallbackCreate(GetMethod(implObj, "SetName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeleteFuncDesc)
        CallbackFree(this.vtbl.DeleteFuncDescByMemId)
        CallbackFree(this.vtbl.DeleteVarDesc)
        CallbackFree(this.vtbl.DeleteVarDescByMemId)
        CallbackFree(this.vtbl.DeleteImplType)
        CallbackFree(this.vtbl.SetCustData)
        CallbackFree(this.vtbl.SetFuncCustData)
        CallbackFree(this.vtbl.SetParamCustData)
        CallbackFree(this.vtbl.SetVarCustData)
        CallbackFree(this.vtbl.SetImplTypeCustData)
        CallbackFree(this.vtbl.SetHelpStringContext)
        CallbackFree(this.vtbl.SetFuncHelpStringContext)
        CallbackFree(this.vtbl.SetVarHelpStringContext)
        CallbackFree(this.vtbl.Invalidate)
        CallbackFree(this.vtbl.SetName)
    }
}
