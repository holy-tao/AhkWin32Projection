#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk
#Include .\IMetaDataDispenser.ahk

/**
 * Extends the IMetaDataDispenser interface to provide the capability to control how the metadata APIs operate on the current metadata scope.
 * @see https://learn.microsoft.com/windows/win32/api//content/rometadataapi/nn-rometadataapi-imetadatadispenserex
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataDispenserEx extends IMetaDataDispenser{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataDispenserEx
     * @type {Guid}
     */
    static IID => Guid("{31bcfce2-dafb-11d2-9f81-00c04f79a0a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOption", "GetOption", "OpenScopeOnITypeInfo", "GetCORSystemDirectory", "FindAssembly", "FindAssemblyModule"]

    /**
     * Sets the specified option to a given value for the current metadata scope. The option controls how calls to the current metadata scope are handled.
     * @remarks
     * The following table lists the available GUIDs that the <i>optionId</i> parameter can point to and the corresponding valid values for the <i>pValue</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>GUID</th>
     * <th>Description</th>
     * <th><i>pValue</i> Parameter</th>
     * </tr>
     * <tr>
     * <td>MetaDataCheckDuplicatesFor</td>
     * <td>Controls which items are checked for duplicates.</td>
     * <td>Must be a variant of type UI4, and must contain a combination of the values of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corcheckduplicatesfor-enumeration">CorCheckDuplicatesFor</a> enumeration.</td>
     * </tr>
     * <tr>
     * <td>MetaDataRefToDefCheck
     * </td>
     * <td>Controls which referenced items are converted to definitions. By default, the metadata engine will optimize the code by converting a referenced item to its definition if the referenced item is actually defined in the current scope.
     * </td>
     * <td>Must be a variant of type UI4, and must contain a combination of the values of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/correftodefcheck-enumeration">CorRefToDefCheck</a> enumeration.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataNotificationForTokenMovement
     * </td>
     * <td>Controls which token remaps occurring during a metadata merge generate callbacks. </td>
     * <td>Must be a variant of type UI4, and must contain a combination of the values of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/cornotificationfortokenmovement-enumeration">CorNotificationForTokenMovement</a> enumeration.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataSetENC
     * </td>
     * <td>Controls the behavior of edit-and-continue (ENC). Only one mode of behavior can be set at a time.
     * </td>
     * <td>Must be a variant of type UI4, and must contain a value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corsetenc-enumeration">CorSetENC</a> enumeration. The value is not a bitmask.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataErrorIfEmitOutOfOrder
     * </td>
     * <td>Controls which emitted-out-of-order errors generate callbacks. Emitting metadata out of order is not fatal; however, if you emit metadata in an order that is favored by the metadata engine, the metadata is more compact and therefore can be more efficiently searched.</td>
     * <td>Must be a variant of type UI4, and must contain a combination of the values of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corerrorifemitoutoforder-enumeration">CorErrorIfEmitOutOfOrder</a> enumeration.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataImportOption
     * </td>
     * <td>Controls which kinds of items that were deleted during an ENC are retrieved by an enumerator.
     * </td>
     * <td>Must be a variant of type UI4, and must contain a combination of the values of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corimportoptions-enumeration">CorImportOptions</a> enumeration.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataThreadSafetyOptions
     * </td>
     * <td>Controls whether the metadata engine obtains reader/writer locks, thereby ensuring thread safety. By default, the engine assumes that access is single-threaded by the caller, so no locks are obtained. Clients are responsible for maintaining proper thread synchronization when using the metadata API.
     * </td>
     * <td>Must be a variant of type UI4, and must contain a value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corthreadsafetyoptions-enumeration">CorThreadSafetyOptions</a> enumeration. The value is not a bitmask.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataGenerateTCEAdapters
     * </td>
     * <td>Controls whether the type library importer should generate the tightly coupled event (TCE) adapters for COM connection point containers.
     * </td>
     * <td>Must be a variant of type BOOL. If <i>pValue</i> is set to <b>true</b>, the type library importer generates the TCE adapters.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataTypeLibImportNamespace
     * </td>
     * <td>Specifies a non-default namespace for the type library that is being imported.
     * </td>
     * <td>Must be either a null value or a variant of type BSTR. If <i>pValue</i> is a null value, the current namespace is set to null; otherwise, the current namespace is set to the string that is held in the variant's BSTR type.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataLinkerOptions
     * </td>
     * <td>Controls whether the linker should generate an assembly or a .NET Framework module file.
     * </td>
     * <td>Must be a variant of type UI4, and must contain a combination of the values of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corlinkeroptions-enumeration">CorLinkerOptions</a> enumeration.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataRuntimeVersion
     * </td>
     * <td>Specifies the version of the common language runtime against which this image was built. The version is stored as a string, such as "v1.0.3705".
     * </td>
     * <td>Must be a null value, a VT_EMPTY value, or a variant of type BSTR. If <i>pValue</i> is null, the runtime version is set to null. If <i>pValue</i> is VT_EMPTY, the version is set to a default value, which is drawn from the version of Mscorwks.dll within which the metadata code is running. Otherwise, the runtime version is set to the string that is held in the variant's BSTR type.
     * </td>
     * </tr>
     * <tr>
     * <td>MetaDataMergerOptions
     * </td>
     * <td>Specifies options for merging metadata.
     * </td>
     * <td>Must be a variant of type UI4, and must contain a combination of the values of the MergeFlags enumeration, which is described in the CorHdr.h file.
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} optionid 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rometadataapi/nf-rometadataapi-imetadatadispenserex-setoption
     */
    SetOption(optionid, value) {
        result := ComCall(6, this, "ptr", optionid, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the value of the specified option for the current metadata scope. The option controls how calls to the current metadata scope are handled.
     * @remarks
     * The following list shows the GUIDs that are supported for this method. For descriptions, see the <a href="https://docs.microsoft.com/windows/desktop/api/rometadataapi/nf-rometadataapi-imetadatadispenserex-setoption">SetOption</a> method. If <i>optionId</i> is not in this list, this method returns HRESULT <b>E_INVALIDARG</b>, indicating an incorrect parameter.
     * 
     * <ul>
     * <li>
     * MetaDataCheckDuplicatesFor
     * 
     * </li>
     * <li>
     * MetaDataRefToDefCheck
     * 
     * </li>
     * <li>
     * MetaDataNotificationForTokenMovement
     * 
     * </li>
     * <li>
     * MetaDataSetENC
     * 
     * </li>
     * <li>
     * MetaDataErrorIfEmitOutOfOrder
     * 
     * </li>
     * <li>
     * MetaDataGenerateTCEAdapters
     * 
     * </li>
     * <li>
     * MetaDataLinkerOptions
     * 
     * </li>
     * </ul>
     * @param {Pointer<Guid>} optionid 
     * @param {Pointer<VARIANT>} pvalue 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rometadataapi/nf-rometadataapi-imetadatadispenserex-getoption
     */
    GetOption(optionid, pvalue) {
        result := ComCall(7, this, "ptr", optionid, "ptr", pvalue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Opens the specified scope type.
     * @param {ITypeInfo} pITI Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> interface that provides the type information on which to open the scope.
     * @param {Integer} dwOpenFlags The open mode flags.
     * @param {Pointer<Guid>} riid The desired interface.
     * @returns {IUnknown} Pointer to a pointer to the returned interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/rometadataapi/nf-rometadataapi-imetadatadispenserex-openscopeonitypeinfo
     */
    OpenScopeOnITypeInfo(pITI, dwOpenFlags, riid) {
        result := ComCall(8, this, "ptr", pITI, "uint", dwOpenFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppIUnk)
    }

    /**
     * Gets the directory that holds the current common language runtime (CLR). This method is supported only for use by out-of-process debuggers. If called from another component, it will return E_NOTIMPL.
     * @param {PWSTR} szBuffer The buffer to receive the directory name.
     * @param {Integer} cchBuffer The size, in bytes, of <i>szBuffer</i>.
     * @param {Pointer<Integer>} pchBuffer The number of bytes actually returned in <i>szBuffer</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rometadataapi/nf-rometadataapi-imetadatadispenserex-getcorsystemdirectory
     */
    GetCORSystemDirectory(szBuffer, cchBuffer, pchBuffer) {
        szBuffer := szBuffer is String ? StrPtr(szBuffer) : szBuffer

        pchBufferMarshal := pchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", szBuffer, "uint", cchBuffer, pchBufferMarshal, pchBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the name of the assembly.
     * @param {PWSTR} szAppBase Not used.
     * @param {PWSTR} szPrivateBin Not used.
     * @param {PWSTR} szGlobalBin Not used.
     * @param {PWSTR} szAssemblyName The name of the assembly to find.
     * @param {PWSTR} szName The simple name of the assembly.
     * @param {Integer} cchName The size, in bytes, of <i>szName</i>.
     * @param {Pointer<Integer>} pcName 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rometadataapi/nf-rometadataapi-imetadatadispenserex-findassembly
     */
    FindAssembly(szAppBase, szPrivateBin, szGlobalBin, szAssemblyName, szName, cchName, pcName) {
        szAppBase := szAppBase is String ? StrPtr(szAppBase) : szAppBase
        szPrivateBin := szPrivateBin is String ? StrPtr(szPrivateBin) : szPrivateBin
        szGlobalBin := szGlobalBin is String ? StrPtr(szGlobalBin) : szGlobalBin
        szAssemblyName := szAssemblyName is String ? StrPtr(szAssemblyName) : szAssemblyName
        szName := szName is String ? StrPtr(szName) : szName

        pcNameMarshal := pcName is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", szAppBase, "ptr", szPrivateBin, "ptr", szGlobalBin, "ptr", szAssemblyName, "ptr", szName, "uint", cchName, pcNameMarshal, pcName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Finds the name of the assembly module.
     * @param {PWSTR} szAppBase Not used.
     * @param {PWSTR} szPrivateBin Not used.
     * @param {PWSTR} szGlobalBin Not used.
     * @param {PWSTR} szAssemblyName The assembly to be found.
     * @param {PWSTR} szModuleName The name of the module.
     * @param {PWSTR} szName The simple name of the assembly.
     * @param {Integer} cchName The size, in bytes, of <i>szName</i>.
     * @param {Pointer<Integer>} pcName The number of characters actually returned in <i>szName</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rometadataapi/nf-rometadataapi-imetadatadispenserex-findassemblymodule
     */
    FindAssemblyModule(szAppBase, szPrivateBin, szGlobalBin, szAssemblyName, szModuleName, szName, cchName, pcName) {
        szAppBase := szAppBase is String ? StrPtr(szAppBase) : szAppBase
        szPrivateBin := szPrivateBin is String ? StrPtr(szPrivateBin) : szPrivateBin
        szGlobalBin := szGlobalBin is String ? StrPtr(szGlobalBin) : szGlobalBin
        szAssemblyName := szAssemblyName is String ? StrPtr(szAssemblyName) : szAssemblyName
        szModuleName := szModuleName is String ? StrPtr(szModuleName) : szModuleName
        szName := szName is String ? StrPtr(szName) : szName

        pcNameMarshal := pcName is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", szAppBase, "ptr", szPrivateBin, "ptr", szGlobalBin, "ptr", szAssemblyName, "ptr", szModuleName, "ptr", szName, "uint", cchName, pcNameMarshal, pcName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
