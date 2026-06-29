#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITypeInfo.ahk" { ITypeInfo }
#Import ".\TYPEKIND.ahk" { TYPEKIND }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\CUSTDATA.ahk" { CUSTDATA }
#Import ".\INVOKEKIND.ahk" { INVOKEKIND }

/**
 * Used for reading information about objects. (ITypeInfo2)
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-itypeinfo2
 * @namespace Windows.Win32.System.Com
 */
export default struct ITypeInfo2 extends ITypeInfo {
    /**
     * The interface identifier for ITypeInfo2
     * @type {Guid}
     */
    static IID := Guid("{00020412-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITypeInfo2 interfaces
    */
    struct Vtbl extends ITypeInfo.Vtbl {
        GetTypeKind            : IntPtr
        GetTypeFlags           : IntPtr
        GetFuncIndexOfMemId    : IntPtr
        GetVarIndexOfMemId     : IntPtr
        GetCustData            : IntPtr
        GetFuncCustData        : IntPtr
        GetParamCustData       : IntPtr
        GetVarCustData         : IntPtr
        GetImplTypeCustData    : IntPtr
        GetDocumentation2      : IntPtr
        GetAllCustData         : IntPtr
        GetAllFuncCustData     : IntPtr
        GetAllParamCustData    : IntPtr
        GetAllVarCustData      : IntPtr
        GetAllImplTypeCustData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITypeInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the TYPEKIND enumeration quickly, without doing any allocations.
     * @returns {TYPEKIND} A TYPEKIND value.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-gettypekind
     */
    GetTypeKind() {
        result := ComCall(22, this, "int*", &pTypeKind := 0, "HRESULT")
        return pTypeKind
    }

    /**
     * Returns the type flags without any allocations. This returns a flag that expands the type flags without growing the TYPEATTR (type attribute).
     * @returns {Integer} A TYPEFLAG value.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-gettypeflags
     */
    GetTypeFlags() {
        result := ComCall(23, this, "uint*", &pTypeFlags := 0, "HRESULT")
        return pTypeFlags
    }

    /**
     * Binds to a specific member based on a known DISPID, where the member name is not known (for example, when binding to a default member). (ITypeInfo2.GetFuncIndexOfMemId)
     * @param {Integer} memid The member identifier.
     * @param {INVOKEKIND} invKind The invoke kind.
     * @returns {Integer} An index into the function.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getfuncindexofmemid
     */
    GetFuncIndexOfMemId(memid, invKind) {
        result := ComCall(24, this, "int", memid, INVOKEKIND, invKind, "uint*", &pFuncIndex := 0, "HRESULT")
        return pFuncIndex
    }

    /**
     * Binds to a specific member based on a known DISPID, where the member name is not known (for example, when binding to a default member). (ITypeInfo2.GetVarIndexOfMemId)
     * @param {Integer} memid The member identifier.
     * @returns {Integer} The index.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getvarindexofmemid
     */
    GetVarIndexOfMemId(memid) {
        result := ComCall(25, this, "int", memid, "uint*", &pVarIndex := 0, "HRESULT")
        return pVarIndex
    }

    /**
     * Gets the custom data. (ITypeInfo2.GetCustData)
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The custom data.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getcustdata
     */
    GetCustData(guid) {
        pVarVal := VARIANT()
        result := ComCall(26, this, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data from the specified function.
     * @param {Integer} index The index of the function for which to get the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The custom data.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getfunccustdata
     */
    GetFuncCustData(index, guid) {
        pVarVal := VARIANT()
        result := ComCall(27, this, "uint", index, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data of the specified parameter.
     * @param {Integer} indexFunc The index of the function for which to get the custom data.
     * @param {Integer} indexParam The index of the parameter of this function for which to get the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The retrieved data.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getparamcustdata
     */
    GetParamCustData(indexFunc, indexParam, guid) {
        pVarVal := VARIANT()
        result := ComCall(28, this, "uint", indexFunc, "uint", indexParam, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data of the specified variable.
     * @param {Integer} index The index of the variable for which to get the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The retrieved data.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getvarcustdata
     */
    GetVarCustData(index, guid) {
        pVarVal := VARIANT()
        result := ComCall(29, this, "uint", index, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data of the implementation type.
     * @param {Integer} index The index of the implementation type for the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The retrieved data.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getimpltypecustdata
     */
    GetImplTypeCustData(index, guid) {
        pVarVal := VARIANT()
        result := ComCall(30, this, "uint", index, Guid.Ptr, guid, VARIANT.Ptr, pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Retrieves the documentation string, the complete Help file name and path, the localization context to use, and the context ID for the library Help topic in the Help file.
     * @remarks
     * Gets information at the type information level (about the type information and its members). The caller should free the BSTR parameters.
     * 
     * This function will call <b>_DLLGetDocumentation</b> in the specified DLL to retrieve the desired Help string, if there is a Help string context for this item. If no Help string context exists or an error occurs, then it will defer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-getdocumentation">GetDocumentation</a> method and return the associated documentation string.
     * @param {Integer} memid The member identifier for the type description.
     * @param {Integer} lcid The locale identifier.
     * @param {Pointer<BSTR>} pbstrHelpString The name of the specified item. If the caller does not need the item name, then <i>pbstrHelpString</i> can be null.
     * @param {Pointer<Integer>} pdwHelpStringContext The Help localization context. If the caller does not need the Help context, it can be null.
     * @param {Pointer<BSTR>} pbstrHelpStringDll The fully qualified name of the file containing the DLL used for Help file. If the caller does not need the file name, it can be null.
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
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getdocumentation2
     */
    GetDocumentation2(memid, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll) {
        pdwHelpStringContextMarshal := pdwHelpStringContext is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "int", memid, "uint", lcid, BSTR.Ptr, pbstrHelpString, pdwHelpStringContextMarshal, pdwHelpStringContext, BSTR.Ptr, pbstrHelpStringDll, "HRESULT")
        return result
    }

    /**
     * Gets all custom data items for the library. (ITypeInfo2.GetAllCustData)
     * @remarks
     * After the call, the caller needs to release memory used to hold the custom data item by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-clearcustdata">ClearCustData</a>.
     * @returns {CUSTDATA} The custom data items.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallcustdata
     */
    GetAllCustData() {
        pCustData := CUSTDATA()
        result := ComCall(32, this, CUSTDATA.Ptr, pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets all custom data from the specified function.
     * @remarks
     * After the call, the caller needs to release memory used to hold the custom data item by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-clearcustdata">ClearCustData</a>.
     * @param {Integer} index The index of the function for which to get the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallfunccustdata
     */
    GetAllFuncCustData(index) {
        pCustData := CUSTDATA()
        result := ComCall(33, this, "uint", index, CUSTDATA.Ptr, pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets all of the custom data for the specified function parameter.
     * @param {Integer} indexFunc The index of the function for which to get the custom data.
     * @param {Integer} indexParam The index of the parameter of this function for which to get the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallparamcustdata
     */
    GetAllParamCustData(indexFunc, indexParam) {
        pCustData := CUSTDATA()
        result := ComCall(34, this, "uint", indexFunc, "uint", indexParam, CUSTDATA.Ptr, pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets the variable for the custom data.
     * @param {Integer} index The index of the variable for which to get the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallvarcustdata
     */
    GetAllVarCustData(index) {
        pCustData := CUSTDATA()
        result := ComCall(35, this, "uint", index, CUSTDATA.Ptr, pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets all custom data for the specified implementation type.
     * @param {Integer} index The index of the implementation type for the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallimpltypecustdata
     */
    GetAllImplTypeCustData(index) {
        pCustData := CUSTDATA()
        result := ComCall(36, this, "uint", index, CUSTDATA.Ptr, pCustData, "HRESULT")
        return pCustData
    }

    Query(iid) {
        if (ITypeInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTypeKind := CallbackCreate(GetMethod(implObj, "GetTypeKind"), flags, 2)
        this.vtbl.GetTypeFlags := CallbackCreate(GetMethod(implObj, "GetTypeFlags"), flags, 2)
        this.vtbl.GetFuncIndexOfMemId := CallbackCreate(GetMethod(implObj, "GetFuncIndexOfMemId"), flags, 4)
        this.vtbl.GetVarIndexOfMemId := CallbackCreate(GetMethod(implObj, "GetVarIndexOfMemId"), flags, 3)
        this.vtbl.GetCustData := CallbackCreate(GetMethod(implObj, "GetCustData"), flags, 3)
        this.vtbl.GetFuncCustData := CallbackCreate(GetMethod(implObj, "GetFuncCustData"), flags, 4)
        this.vtbl.GetParamCustData := CallbackCreate(GetMethod(implObj, "GetParamCustData"), flags, 5)
        this.vtbl.GetVarCustData := CallbackCreate(GetMethod(implObj, "GetVarCustData"), flags, 4)
        this.vtbl.GetImplTypeCustData := CallbackCreate(GetMethod(implObj, "GetImplTypeCustData"), flags, 4)
        this.vtbl.GetDocumentation2 := CallbackCreate(GetMethod(implObj, "GetDocumentation2"), flags, 6)
        this.vtbl.GetAllCustData := CallbackCreate(GetMethod(implObj, "GetAllCustData"), flags, 2)
        this.vtbl.GetAllFuncCustData := CallbackCreate(GetMethod(implObj, "GetAllFuncCustData"), flags, 3)
        this.vtbl.GetAllParamCustData := CallbackCreate(GetMethod(implObj, "GetAllParamCustData"), flags, 4)
        this.vtbl.GetAllVarCustData := CallbackCreate(GetMethod(implObj, "GetAllVarCustData"), flags, 3)
        this.vtbl.GetAllImplTypeCustData := CallbackCreate(GetMethod(implObj, "GetAllImplTypeCustData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTypeKind)
        CallbackFree(this.vtbl.GetTypeFlags)
        CallbackFree(this.vtbl.GetFuncIndexOfMemId)
        CallbackFree(this.vtbl.GetVarIndexOfMemId)
        CallbackFree(this.vtbl.GetCustData)
        CallbackFree(this.vtbl.GetFuncCustData)
        CallbackFree(this.vtbl.GetParamCustData)
        CallbackFree(this.vtbl.GetVarCustData)
        CallbackFree(this.vtbl.GetImplTypeCustData)
        CallbackFree(this.vtbl.GetDocumentation2)
        CallbackFree(this.vtbl.GetAllCustData)
        CallbackFree(this.vtbl.GetAllFuncCustData)
        CallbackFree(this.vtbl.GetAllParamCustData)
        CallbackFree(this.vtbl.GetAllVarCustData)
        CallbackFree(this.vtbl.GetAllImplTypeCustData)
    }
}
