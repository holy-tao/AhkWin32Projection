#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\CUSTDATA.ahk
#Include .\ITypeInfo.ahk

/**
 * Used for reading information about objects.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypeinfo2
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeInfo2 extends ITypeInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeInfo2
     * @type {Guid}
     */
    static IID => Guid("{00020412-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeKind", "GetTypeFlags", "GetFuncIndexOfMemId", "GetVarIndexOfMemId", "GetCustData", "GetFuncCustData", "GetParamCustData", "GetVarCustData", "GetImplTypeCustData", "GetDocumentation2", "GetAllCustData", "GetAllFuncCustData", "GetAllParamCustData", "GetAllVarCustData", "GetAllImplTypeCustData"]

    /**
     * Returns the TYPEKIND enumeration quickly, without doing any allocations.
     * @returns {Integer} A TYPEKIND value.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-gettypekind
     */
    GetTypeKind() {
        result := ComCall(22, this, "int*", &pTypeKind := 0, "HRESULT")
        return pTypeKind
    }

    /**
     * Returns the type flags without any allocations. This returns a flag that expands the type flags without growing the TYPEATTR (type attribute).
     * @returns {Integer} A TYPEFLAG value.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-gettypeflags
     */
    GetTypeFlags() {
        result := ComCall(23, this, "uint*", &pTypeFlags := 0, "HRESULT")
        return pTypeFlags
    }

    /**
     * Binds to a specific member based on a known DISPID, where the member name is not known (for example, when binding to a default member).
     * @param {Integer} memid The member identifier.
     * @param {Integer} invKind The invoke kind.
     * @returns {Integer} An index into the function.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getfuncindexofmemid
     */
    GetFuncIndexOfMemId(memid, invKind) {
        result := ComCall(24, this, "int", memid, "int", invKind, "uint*", &pFuncIndex := 0, "HRESULT")
        return pFuncIndex
    }

    /**
     * Binds to a specific member based on a known DISPID, where the member name is not known (for example, when binding to a default member).
     * @param {Integer} memid The member identifier.
     * @returns {Integer} The index.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getvarindexofmemid
     */
    GetVarIndexOfMemId(memid) {
        result := ComCall(25, this, "int", memid, "uint*", &pVarIndex := 0, "HRESULT")
        return pVarIndex
    }

    /**
     * Gets the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The custom data.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getcustdata
     */
    GetCustData(guid) {
        pVarVal := VARIANT()
        result := ComCall(26, this, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data from the specified function.
     * @param {Integer} index The index of the function for which to get the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The custom data.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getfunccustdata
     */
    GetFuncCustData(index, guid) {
        pVarVal := VARIANT()
        result := ComCall(27, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data of the specified parameter.
     * @param {Integer} indexFunc The index of the function for which to get the custom data.
     * @param {Integer} indexParam The index of the parameter of this function for which to get the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The retrieved data.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getparamcustdata
     */
    GetParamCustData(indexFunc, indexParam, guid) {
        pVarVal := VARIANT()
        result := ComCall(28, this, "uint", indexFunc, "uint", indexParam, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data of the specified variable.
     * @param {Integer} index The index of the variable for which to get the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The retrieved data.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getvarcustdata
     */
    GetVarCustData(index, guid) {
        pVarVal := VARIANT()
        result := ComCall(29, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Gets the custom data of the implementation type.
     * @param {Integer} index The index of the implementation type for the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The retrieved data.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getimpltypecustdata
     */
    GetImplTypeCustData(index, guid) {
        pVarVal := VARIANT()
        result := ComCall(30, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Retrieves the documentation string, the complete Help file name and path, the localization context to use, and the context ID for the library Help topic in the Help file.
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
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getdocumentation2
     */
    GetDocumentation2(memid, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll) {
        pdwHelpStringContextMarshal := pdwHelpStringContext is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "int", memid, "uint", lcid, "ptr", pbstrHelpString, pdwHelpStringContextMarshal, pdwHelpStringContext, "ptr", pbstrHelpStringDll, "HRESULT")
        return result
    }

    /**
     * Gets all custom data items for the library.
     * @returns {CUSTDATA} The custom data items.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getallcustdata
     */
    GetAllCustData() {
        pCustData := CUSTDATA()
        result := ComCall(32, this, "ptr", pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets all custom data from the specified function.
     * @param {Integer} index The index of the function for which to get the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getallfunccustdata
     */
    GetAllFuncCustData(index) {
        pCustData := CUSTDATA()
        result := ComCall(33, this, "uint", index, "ptr", pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets all of the custom data for the specified function parameter.
     * @param {Integer} indexFunc The index of the function for which to get the custom data.
     * @param {Integer} indexParam The index of the parameter of this function for which to get the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getallparamcustdata
     */
    GetAllParamCustData(indexFunc, indexParam) {
        pCustData := CUSTDATA()
        result := ComCall(34, this, "uint", indexFunc, "uint", indexParam, "ptr", pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets the variable for the custom data.
     * @param {Integer} index The index of the variable for which to get the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getallvarcustdata
     */
    GetAllVarCustData(index) {
        pCustData := CUSTDATA()
        result := ComCall(35, this, "uint", index, "ptr", pCustData, "HRESULT")
        return pCustData
    }

    /**
     * Gets all custom data for the specified implementation type.
     * @param {Integer} index The index of the implementation type for the custom data.
     * @returns {CUSTDATA} The custom data items.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypeinfo2-getallimpltypecustdata
     */
    GetAllImplTypeCustData(index) {
        pCustData := CUSTDATA()
        result := ComCall(36, this, "uint", index, "ptr", pCustData, "HRESULT")
        return pCustData
    }
}
