#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ROPARAMIIDHANDLE.ahk" { ROPARAMIIDHANDLE }
#Import ".\IRoMetaDataLocator.ahk" { IRoMetaDataLocator }
#Import "..\HSTRING.ahk" { HSTRING }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IMetaDataDispenserEx.ahk" { IMetaDataDispenserEx }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMetaDataImport2.ahk" { IMetaDataImport2 }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */

;@region Functions
/**
 * Creates a dispenser class.
 * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
 * 
 * This parameter must be <b>CLSID_CorMetaDataDispenser</b>.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * The interface to implement. This parameter can be either <b>IID_IMetaDataDispenser</b> or <b>IID_IMetaDataDispenserEx</b>.
 * @returns {Pointer<Void>} Type: <b>LPVOID*</b>
 * 
 * The dispenser class. The class implements <b>IMetaDataDispenser</b> or <b>IMetaDataDispenserEx.</b>
 * @see https://learn.microsoft.com/windows/win32/api/rometadata/nf-rometadata-metadatagetdispenser
 * @since windows8.0
 */
export MetaDataGetDispenser(rclsid, riid) {
    result := DllCall("RoMetadata.dll\MetaDataGetDispenser", Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * Locates and retrieves the metadata file that describes the Application Binary Interface (ABI) for the specified typename.
 * @remarks
 * The caller can optionally pass-in a metadata dispenser for the <b>RoGetMetaDataFile</b> function to open the metadata files through the <b>IMetaDataDispenserEx::OpenScope</b> method. 
 * 
 * If the metadata dispenser parameter is set to <b>nullptr</b>, the function creates an internal instance of the refactored metadata reader and uses that reader’s <b>IMetaDataDispenserEx::OpenScope</b> method.
 * 
 * 
 * 
 * The <b>RoGetMetaDataFile</b> function is guaranteed to be thread-safe if you pass-in <b>nullptr</b> to the metadata dispenser parameter, as the function creates an internal read-only metadata reader. This guarantee also holds if you pass in the read-only metadata reader, like  RoMetadata to the function.
 * 
 * 
 * 
 * All three output parameters are optional and none of them needs to be specified. Calling the <b>RoGetMetaDataFile</b> function with <b>nullptr</b> for all output parameters is equivalent to asking whether the input typename or namespace is defined.
 * 
 * 
 * 
 * The metadata reader object reference and the TypeDef token parameters paired, so both must be set together or be set to  <b>nullptr</b>.  
 * 
 * 
 * There are three possible type resolution scenarios:
 * 
 * <table>
 * <tr>
 * <td>
 * Scenario #1
 * 
 * </td>
 * <td>
 * <b>Typename input string is a type defined in a WinMD file.</b>
 * 
 * <ul>
 * <li>
 * Return Value
 * 
 * <b>S_OK</b>
 * 
 * </li>
 * <li>
 * Metadata file path output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it holds the absolute path of the .winmd file that describes the given type's ABI. The caller is responsible for freeing the <b>HSTRING</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a>.
 * 
 * </li>
 * <li>
 * Reference to the metadata reader object output parameter
 * 
 * This is an optional output parameter. If not <b>nullptr</b>, it holds a reference to the metadata reader object (<b>IMetaDataImport2</b>) and the caller is responsible for releasing it. If the caller passes <b>nullptr</b> for this parameter, it means that the caller does not want the metadata reader object, so the function releases the internal reference.
 * 
 * </li>
 * <li>
 * Typedef token output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to the token of the type’s <b>typedef</b> entry. Language projections can use this token to call <b>IMetaDataImport::GetTypeDefProps</b> to get metadata about the type.
 * 
 * </li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Scenario #2
 * 
 * </td>
 * <td><b>Typename input string is actually an existing namespace rather than a typename.</b><ul>
 * <li>
 * Return value
 * 
 * <b>RO_E_METADATA_NAME_IS_NAMESPACE</b>
 * 
 * </li>
 * <li>
 * Metadata file path output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by the caller, it is set to <b>nullptr</b>.
 * 
 * </li>
 * <li>
 * Reference to the metadata reader object output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>nullptr</b>.
 * 
 * </li>
 * <li>
 * Typedef token output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it will is to <b>mdTypeDefNil</b>.
 * 
 * </li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Scenario #3
 * 
 * </td>
 * <td><b>Input string is not a type defined in any examined WinMD file</b><ul>
 * <li>
 * Return value
 * 
 * <b>RO_E_METADATA_NAME_NOT_FOUND</b>
 * 
 * </li>
 * <li>
 * Metadata file path output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>nullptr</b>
 * 
 * </li>
 * <li>
 * Reference to the metadata reader object output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>nullptr</b>
 * 
 * </li>
 * <li>
 * Typedef token output parameter
 * 
 * This is an optional output parameter. If not set to <b>nullptr</b> by caller, it is set to <b>mdTypeDefNil</b>.
 * 
 * </li>
 * </ul>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The <b>RoGetMetaDataFile</b> function resolves an <b>interfacegroup</b>, because the <b>interfacegroup</b> also is a namespace-qualified typename. The <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nf-inspectable-iinspectable-getruntimeclassname">IInspectable::GetRuntimeClassName</a> method returns the string in dot-separated string format for use by <b>RoGetMetaDataFile</b>.
 * 
 * Resolving 3rd-party types from a process that's not in a Windows Store app is not supported. In this case, the function returns error <b>HRESULT_FROM_WIN32(ERROR_NO_PACKAGE)</b> and sets output parameters to <b>nullptr</b>. But Windows types are resolved in a process that's not in a Windows Store app.
 * @param {HSTRING} name Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
 * 
 * The name to resolve, either a typename or a namespace. The name input string must be non-empty and must not contain embedded NUL characters. If the name is a dot-separated string, then the substring to the left of the last dot and the substring to the right of the last dot must be non-empty.
 * @param {IMetaDataDispenserEx} metaDataDispenser Type: <b>IMetaDataDispenserEx*</b>
 * 
 * A metadata dispenser that the caller can optionally pass in for the <b>RoGetMetaDataFile</b> function to be able to open the metadata files through the provided <b>IMetaDataDispenserEx::OpenScope</b> method. If the metadata dispenser parameter is set to <b>nullptr</b>, the function creates an internal instance of the refactored metadata reader (RoMetadata.dll) and uses its <b>IMetaDataDispenserEx::OpenScope</b> method. You can create a metadata dispenser using the <a href="https://docs.microsoft.com/windows/win32/api/rometadata/nf-rometadata-metadatagetdispenser">MetaDataGetDispenser</a> function.
 * @param {Pointer<HSTRING>} metaDataFilePath Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
 * 
 * The absolute path of the metadata (.winmd) file that describes the ABI, unless set to <b>nullptr</b>. The caller is responsible for freeing the <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> method.
 * @param {Pointer<IMetaDataImport2>} metaDataImport Type: <b>IMetaDataImport2**</b>
 * 
 * A pointer to the metadata file reader object. If the caller passes in a <b>nullptr</b> ,  the function releases the <b>IMetaDataImport2</b> reference, otherwise the caller must release the reference. The value is set to <b>nullptr</b> on failure.
 * @param {Pointer<Integer>} typeDefToken Type: <b>mdTypeDef*</b>
 * 
 * If the name input string is resolved successfully as a typename, this parameter is set to the  token of the typename.
 * 
 * On failure, this parameter is set to <b>mdTypeDefNil</b>.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Resolution was successful, which means that the input string represents a type defined in a .winmd file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * At least one of the following properties of the input name string does not hold:
 * 
 * <ul>
 * <li>Not null, not empty</li>
 * <li>Does not contain embedded null characters.</li>
 * <li>If a dot-separated string, the substring to the left of the last dot and the substring to the right of the last dot must be non-empty.</li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RO_E_METADATA_NAME_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The input string is not a type defined in any examined .winmd file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RO_E_METADATA_NAME_IS_NAMESPACE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The input string is an existing namespace rather than a typename.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-rogetmetadatafile
 * @since windows8.0
 */
export RoGetMetaDataFile(name, metaDataDispenser, metaDataFilePath, metaDataImport, typeDefToken) {
    typeDefTokenMarshal := typeDefToken is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-ro-typeresolution-l1-1-0.dll\RoGetMetaDataFile", HSTRING, name, "ptr", metaDataDispenser, HSTRING.Ptr, metaDataFilePath, IMetaDataImport2.Ptr, metaDataImport, typeDefTokenMarshal, typeDefToken, "HRESULT")
    return result
}

/**
 * Parses a type name and existing type parameters, in the case of parameterized types.
 * @remarks
 * The <b>RoParseTypeName</b> function parses the string-encoded  type name and returns an array of <b>HSTRING</b> values. The first element of the array is the base type, and the remaining array elements are the type parameters, if any, in pre-order tree traversal order. <b>S_OK</b> is returned if the parsing was successful. 
 * 
 * Here are examples of different possible input typenames:
 * 
 * <ul>
 * <li>
 * Example 1 (non-namespace-qualified type)
 * 
 * <ul>
 * <li>
 * <b>Input typename</b>
 * 
 * String
 * 
 * </li>
 * <li>
 * <b>Output</b>
 * 
 * Array element 0: String
 * 
 * </li>
 * </ul>
 * </li>
 * <li>
 * Example 2 (non-parameterized namespace-qualified type)
 * 
 * <ul>
 * <li>
 * <b>Input typename</b>
 * 
 * Windows.Foundation.IExtensionInformation
 * 
 * </li>
 * <li>
 * <b>Output</b>
 * 
 * Array element 0: Windows.Foundation.IExtensionInformation
 * 
 * </li>
 * </ul>
 * </li>
 * <li>
 * Example 3 (instantiated parameterized interface type)
 * 
 * <ul>
 * <li>
 * <b>Input typename</b>
 * 
 * Windows.Foundation.Collections.IIterator`1&lt;Windows.Foundation.Collections.IMapView`2&lt;Windows.Foundation.Collections.IVector`1&lt;String&gt;, String&gt;&gt;
 * 
 * </li>
 * <li>
 * <b>Output</b>
 * 
 * Array element 0: Windows.Foundation.Collections.IIterator`1
 * 
 * Array element 1: Windows.Foundation.Collections.IMapView`2
 * 
 * Array element 2: Windows.Foundation.Collections.IVector`1
 * 
 * Array element 3: String
 * 
 * Array element 4: String
 * 
 * </li>
 * </ul>
 * </li>
 * </ul>
 * When parsing a non-parameterized type, the <b>RoParseTypeName</b> function returns an array that has one element. Please refer to example 1 and example 2 above.
 * 
 * The input string must be non-empty and it must not contain any embedded null characters. Otherwise, the API fails with <b>E_INVALIDARG</b>.  If the <i>typename</i> is ill-formed, like  IVector`1&lt;, then the API will fail with  the <b>RO_E_METADATA_INVALID_TYPE_FORMAT</b> error code.
 * 
 * The <b>RoParseTypeName</b> function validates only the format of the <i>typename</i> and not its syntax. For example, the function validates that a namespace-qualified parameterized interface <i>typename</i> follows the format shown in the following table, but it does not impose any requirements on what characters/symbols can be used in the <i>typename</i>, except that it should not contain ` , &lt;, or &gt; characters.
 * 
 * The format for a string-encoded instantiated parameterized interface is as follows:
 * 
 * <table>
 * <tr>
 * <td>
 * Name of parameterized interface
 * 
 * </td>
 * <td>
 * Backtick character
 * (`)
 * 
 * </td>
 * <td>
 * Number of type parameters
 * 
 * </td>
 * <td>
 * Left angle bracket (&lt;)
 * 
 * </td>
 * <td>
 * Namespace qualified name of each type parameter, separated by commas.
 * 
 * </td>
 * <td>
 * Right angle bracket
 * (&gt;)
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Type parameters may be:
 * 
 * <ul>
 * <li>Non-parameterized, non-namespace-qualified types, like  WinRT fundamental types.</li>
 * <li>Non-parameterized namespace-qualified types.</li>
 * <li>Fully-instantiated namespace-qualified parameterized interfaces.</li>
 * </ul>
 * On success, the caller is responsible for deallocating the <i>typenameParts</i> array returned by <b>RoParseTypeName</b> by using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free the array and <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> to free the <b>HSTRING</b> values.
 * @param {HSTRING} typeName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
 * 
 * String-encoded typename. The typename can be a non-namespace-qualified type, a non-parameterized namespace-qualified type or a fully instantiated namespace-qualified parameterized type.
 * @param {Pointer<Integer>} partsCount Type: <b>DWORD*</b>
 * 
 * Number of elements in the <i>typenameParts</i> array.
 * @param {Pointer<Pointer<HSTRING>>} typeNameParts Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
 * 
 * The first element of the array is the specified type, and the remaining array elements are the type parameters (if any) in prewalk tree order.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Parsing was successful.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>typeName</i> contains embedded nulls or is empty.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RO_E_METADATA_INVALID_TYPE_FORMAT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>typename</i> is not well formed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roparsetypename
 * @since windows8.0
 */
export RoParseTypeName(typeName, partsCount, typeNameParts) {
    partsCountMarshal := partsCount is VarRef ? "uint*" : "ptr"
    typeNamePartsMarshal := typeNameParts is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-ro-typeresolution-l1-1-0.dll\RoParseTypeName", HSTRING, typeName, partsCountMarshal, partsCount, typeNamePartsMarshal, typeNameParts, "HRESULT")
    return result
}

/**
 * Determine the direct children, types, and sub-namespaces of the specified Windows Runtime namespace, from any programming language supported by the Windows Runtime.
 * @remarks
 * Use the <b>RoResolveNamespace</b> function to explore Windows Runtime namespace hierarchies.
 * @param {HSTRING} name Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
 * 
 * Full namespace for which we are trying to retrieve direct children. This is a required parameter.
 * 
 * If this namespace is empty or <b>nullptr</b>, the <b>RoResolveNamespace</b> function returns top-level namespaces. Both Windows  and other top-level namespaces are in the package graph.
 * @param {HSTRING} windowsMetaDataDir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
 * 
 * Optional parameter that contains a path to the SDK directory to search for metadata (.winmd) files.
 * 
 * If this parameter is not specified (either empty or <b>nullptr</b>), the function searches in the default Windows metadata directory, %windir%\System32\WinMetadata.
 * @param {Integer} packageGraphDirsCount Type: <b>const DWORD</b>
 * 
 * Count of paths in the <i>packageGraphDirs</i> array.
 * @param {Pointer<HSTRING>} packageGraphDirs Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
 * 
 * Count of package paths in the explicit package dependency graph array. The count is ignored if <i>packageGraphDirs</i> is <b>nullptr</b>.
 * @param {Pointer<Integer>} metaDataFilePathsCount Type: <b>DWORD*</b>
 * 
 * Count of metadata files in the <i>metaDataFilePaths</i> array.
 * @param {Pointer<Pointer<HSTRING>>} metaDataFilePaths Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
 * 
 * Optional output parameter that contains callee-allocated array of absolute file paths of all metadata (.winmd) files that could possibly contain direct children of <i>name</i>.
 * @param {Pointer<Integer>} subNamespacesCount Type: <b>DWORD*</b>
 * 
 * Count of metadata files in the <i>subNamespaces</i> array.
 * @param {Pointer<Pointer<HSTRING>>} subNamespaces Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>**</b>
 * 
 * Optional output parameter that contains a callee-allocated array of names of direct children of the given namespace. This list is a hint of other subnamespaces and is not necessarily complete.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Namespace direct children resolution is successful, which means that at least one file or one subnamespace name was found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RO_E_METADATA_NAME_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates one of the following:
 * 
 * <ul>
 * <li><i>metaDataFilePaths</i> and <i>subNamespaces</i> output parameters are set, but no metadata files and no subnamespaces for the given namespace were found.</li>
 * <li><i>metaDataFilePaths</i> only is set, but no metadata files for the given namespace were found.</li>
 * <li><i>subNamespaces</i> only is set, but no subnamespaces for the given namespace were found.</li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates one of the following:
 * 
 * <ul>
 * <li>Both <i>metaDataFilePaths</i> and <i>subNamespaces</i> are not set.</li>
 * <li>Namespace name has embedded null characters.</li>
 * <li>Namespace is empty or <b>NULL</b> and <i>subNamespaces</i> is not set.</li>
 * <li>Namespace is empty or <b>NULL</b> and <i>metaDataFilePaths</i> is set.</li>
 * </ul>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roresolvenamespace
 * @since windows8.0
 */
export RoResolveNamespace(name, windowsMetaDataDir, packageGraphDirsCount, packageGraphDirs, metaDataFilePathsCount, metaDataFilePaths, subNamespacesCount, subNamespaces) {
    metaDataFilePathsCountMarshal := metaDataFilePathsCount is VarRef ? "uint*" : "ptr"
    metaDataFilePathsMarshal := metaDataFilePaths is VarRef ? "ptr*" : "ptr"
    subNamespacesCountMarshal := subNamespacesCount is VarRef ? "uint*" : "ptr"
    subNamespacesMarshal := subNamespaces is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-ro-typeresolution-l1-1-0.dll\RoResolveNamespace", HSTRING, name, HSTRING, windowsMetaDataDir, "uint", packageGraphDirsCount, HSTRING.Ptr, packageGraphDirs, metaDataFilePathsCountMarshal, metaDataFilePathsCount, metaDataFilePathsMarshal, metaDataFilePaths, subNamespacesCountMarshal, subNamespacesCount, subNamespacesMarshal, subNamespaces, "HRESULT")
    return result
}

/**
 * Returns true or false to indicate whether the API contract with the specified name and major and minor version number is present.
 * @remarks
 * This function was introduced in Windows 10, version 1809 (build 17763).
 * @param {PWSTR} name Type: <b>PCWSTR</b>
 * 
 * The name of the API contract.
 * @param {Integer} majorVersion Type: <b>UINT16</b>
 * 
 * The major version number of the API contract.
 * @param {Integer} minorVersion Type: <b>UINT16</b>
 * 
 * The minor version number of the API contract.
 * @returns {BOOL} Type: <b>BOOL*</b>
 * 
 * True if the specified API contract is present; otherwise, false.
 * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roisapicontractpresent
 * @since windows10.0.10240
 */
export RoIsApiContractPresent(name, majorVersion, minorVersion) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoIsApiContractPresent", "ptr", name, "ushort", majorVersion, "ushort", minorVersion, BOOL.Ptr, &present := 0, "HRESULT")
    return present
}

/**
 * Returns true or false to indicate whether the API contract with the specified name and major version number is present.
 * @remarks
 * This function was introduced in Windows 10, version 1809 (build 17763).
 * @param {PWSTR} name Type: <b>PCWSTR</b>
 * 
 * The name of the API contract.
 * @param {Integer} majorVersion Type: <b>UINT16</b>
 * 
 * The major version number of the API contract.
 * @returns {BOOL} Type: <b>BOOL*</b>
 * 
 * True if the specified API contract is present; otherwise, false.
 * @see https://learn.microsoft.com/windows/win32/api/rometadataresolution/nf-rometadataresolution-roisapicontractmajorversionpresent
 * @since windows10.0.10240
 */
export RoIsApiContractMajorVersionPresent(name, majorVersion) {
    name := name is String ? StrPtr(name) : name

    result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoIsApiContractMajorVersionPresent", "ptr", name, "ushort", majorVersion, BOOL.Ptr, &present := 0, "HRESULT")
    return present
}

/**
 * 
 * @returns {Pointer} 
 */
export RoCreateNonAgilePropertySet() {
    result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoCreateNonAgilePropertySet", "ptr*", &ppPropertySet := 0, "HRESULT")
    return ppPropertySet
}

/**
 * 
 * @returns {Pointer} 
 */
export RoCreatePropertySetSerializer() {
    result := DllCall("api-ms-win-ro-typeresolution-l1-1-1.dll\RoCreatePropertySetSerializer", "ptr*", &ppPropertySetSerializer := 0, "HRESULT")
    return ppPropertySetSerializer
}

/**
 * Computes the interface identifier (IID) of the interface or delegate type that results when a parameterized interface or delegate is instantiated with the specified type arguments.
 * @remarks
 * The <b>RoGetParameterizedTypeInstanceIID</b> function is for use by programming language implementers.
 * 
 * This function is stateless.  The <i>metaDataLocator</i> argument is not preserved between calls and may be released as soon as the call returns.
 * 
 * 
 * 
 * The <b>RoGetParameterizedTypeInstanceIID</b> function does not perform deep semantic analysis.  For instance, if <a href="https://docs.microsoft.com/windows/desktop/api/roparameterizediid/ns-roparameterizediid-irosimplemetadatabuilder">IRoSimpleMetaDataBuilder</a> specifies that a structure contains an interface pointer, this function returns success, even though such metadata is semantically invalid. The value of the returned IID is unspecified in such cases.
 * 
 * This function may recursively invoke the metadata locator provided as an argument.
 * 
 * 
 * 
 * If a call to the <a href="https://docs.microsoft.com/windows/desktop/api/roparameterizediid/ns-roparameterizediid-irosimplemetadatabuilder">IRoSimpleMetaDataBuilder</a> function fails, this function will return that failure code.
 * @param {Integer} nameElementCount Type: <b>UINT32</b>
 * 
 * Number of elements in <i>nameElements.</i>
 * @param {Pointer<PWSTR>} nameElements Type: <b>PCWSTR*</b>
 * 
 * A parsed Windows Runtime type name, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rometadataresolution/nf-rometadataresolution-roparsetypename">RoParseTypeName</a> function.
 * For example, "Windows.Foundation.Collections.IVector`1", and "N1.N2.IFoo".
 * @param {IRoMetaDataLocator} metaDataLocator Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/roparameterizediid/ns-roparameterizediid-irometadatalocator">IRoMetaDataLocator</a></b>
 * 
 * A callback to use for resolving metadata. 
 *                                                                   
 * An implementation should use the <a href="https://docs.microsoft.com/windows/desktop/api/rometadataresolution/nf-rometadataresolution-rogetmetadatafile">RoGetMetaDataFile</a> function to discover the necessary metadata (.winmd) file and examine the metadata to determine the necessary type information. Because the <b>RoGetMetaDataFile</b> function does not cache results, locators should cache the results as appropriate for the programming model being implemented.
 * @param {Pointer<Guid>} iid Type: <b>GUID*</b>
 * 
 * The IID of the interface or delegate that corresponds with <i>nameElements</i>.
 * @returns {ROPARAMIIDHANDLE} Type: <b>ROPARAMIIDHANDLE*</b>
 * 
 * Handle to the IID that corresponds with <i>nameElements</i>.
 * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/nf-roparameterizediid-rogetparameterizedtypeinstanceiid
 * @since windows8.0
 */
export RoGetParameterizedTypeInstanceIID(nameElementCount, nameElements, metaDataLocator, iid) {
    nameElementsMarshal := nameElements is VarRef ? "ptr*" : "ptr"

    pExtra := ROPARAMIIDHANDLE.Owned()
    result := DllCall("api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll\RoGetParameterizedTypeInstanceIID", "uint", nameElementCount, nameElementsMarshal, nameElements, "ptr", metaDataLocator, Guid.Ptr, iid, ROPARAMIIDHANDLE.Ptr, pExtra, "HRESULT")
    return pExtra
}

/**
 * Frees the handle allocated by RoGetParameterizedTypeInstanceIID.
 * @param {ROPARAMIIDHANDLE} extra Type: <b>ROPARAMIIDHANDLE</b>
 * 
 * A handle to the IID.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/nf-roparameterizediid-rofreeparameterizedtypeextra
 * @since windows8.0
 */
export RoFreeParameterizedTypeExtra(extra) {
    DllCall("api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll\RoFreeParameterizedTypeExtra", ROPARAMIIDHANDLE, extra)
}

/**
 * Gets the type signature used to compute the IID from the last call to RoGetParameterizedTypeInstanceIID with the specified handle.
 * @param {ROPARAMIIDHANDLE} extra Type: <b>ROPARAMIIDHANDLE</b>
 * 
 * A handle to the IID.
 * @returns {PSTR} Type: <b>HRESULT</b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/nf-roparameterizediid-roparameterizedtypeextragettypesignature
 * @since windows8.0
 */
export RoParameterizedTypeExtraGetTypeSignature(extra) {
    result := DllCall("api-ms-win-core-winrt-roparameterizediid-l1-1-0.dll\RoParameterizedTypeExtraGetTypeSignature", ROPARAMIIDHANDLE, extra, PSTR)
    return result
}

;@endregion Functions
