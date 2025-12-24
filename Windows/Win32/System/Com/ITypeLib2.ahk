#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\CUSTDATA.ahk
#Include .\ITypeLib.ahk

/**
 * Represents a type library, the data that describes a set of objects.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypelib2
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeLib2 extends ITypeLib{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeLib2
     * @type {Guid}
     */
    static IID => Guid("{00020411-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCustData", "GetLibStatistics", "GetDocumentation2", "GetAllCustData"]

    /**
     * Gets the custom data.
     * @param {Pointer<Guid>} guid The GUID used to identify the data.
     * @returns {VARIANT} The retrieved data.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib2-getcustdata
     */
    GetCustData(guid) {
        pVarVal := VARIANT()
        result := ComCall(13, this, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return pVarVal
    }

    /**
     * Returns statistics about a type library that are required for efficient sizing of hash tables.
     * @param {Pointer<Integer>} pcUniqueNames A count of unique names. If the caller does not need this information, set to NULL.
     * @param {Pointer<Integer>} pcchUniqueNames A change in the count of unique names.
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
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib2-getlibstatistics
     */
    GetLibStatistics(pcUniqueNames, pcchUniqueNames) {
        pcUniqueNamesMarshal := pcUniqueNames is VarRef ? "uint*" : "ptr"
        pcchUniqueNamesMarshal := pcchUniqueNames is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pcUniqueNamesMarshal, pcUniqueNames, pcchUniqueNamesMarshal, pcchUniqueNames, "HRESULT")
        return result
    }

    /**
     * Retrieves the library's documentation string, the complete Help file name and path, the localization context to use, and the context ID for the library Help topic in the Help file.
     * @param {Integer} index The index of the type description whose documentation is to be returned. If <i>index</i> is -1, then the documentation for the library is returned.
     * @param {Integer} lcid The locale identifier.
     * @param {Pointer<BSTR>} pbstrHelpString The name of the specified item. If the caller does not need the item name, then <i>pbstrHelpString</i> can be null
     * @param {Pointer<Integer>} pdwHelpStringContext The Help localization context. If the caller does not need the Help context, then it can be null.
     * @param {Pointer<BSTR>} pbstrHelpStringDll The fully qualified name of the file containing the DLL used for Help file. If the caller does not need the file name, then it can be null.
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
     * <dt><b>STG_E_INSUFFICIENTMEMORY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib2-getdocumentation2
     */
    GetDocumentation2(index, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll) {
        pdwHelpStringContextMarshal := pdwHelpStringContext is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "int", index, "uint", lcid, "ptr", pbstrHelpString, pdwHelpStringContextMarshal, pdwHelpStringContext, "ptr", pbstrHelpStringDll, "HRESULT")
        return result
    }

    /**
     * Gets all custom data items for the library.
     * @returns {CUSTDATA} The custom data items.
     * @see https://docs.microsoft.com/windows/win32/api//oaidl/nf-oaidl-itypelib2-getallcustdata
     */
    GetAllCustData() {
        pCustData := CUSTDATA()
        result := ComCall(16, this, "ptr", pCustData, "HRESULT")
        return pCustData
    }
}
