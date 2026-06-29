#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\PackageInfo3Type.ahk" { PackageInfo3Type }
#Import ".\AppPolicyShowDeveloperDiagnostic.ahk" { AppPolicyShowDeveloperDiagnostic }
#Import "..\..\..\Security\PSID.ahk" { PSID }
#Import ".\PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE.ahk" { PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AddPackageDependencyOptions2.ahk" { AddPackageDependencyOptions2 }
#Import "..\..\..\Foundation\WIN32_ERROR.ahk" { WIN32_ERROR }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\FindPackageDependencyCriteria.ahk" { FindPackageDependencyCriteria }
#Import ".\AppPolicyThreadInitializationType.ahk" { AppPolicyThreadInitializationType }
#Import ".\AppPolicyClrCompat.ahk" { AppPolicyClrCompat }
#Import ".\PackageDependencyLifetimeKind.ahk" { PackageDependencyLifetimeKind }
#Import ".\AppPolicyLifecycleManagement.ahk" { AppPolicyLifecycleManagement }
#Import ".\PACKAGEDEPENDENCY_CONTEXT.ahk" { PACKAGEDEPENDENCY_CONTEXT }
#Import ".\AppPolicyMediaFoundationCodecLoading.ahk" { AppPolicyMediaFoundationCodecLoading }
#Import ".\PACKAGE_ID.ahk" { PACKAGE_ID }
#Import ".\AppPolicyProcessTerminationMethod.ahk" { AppPolicyProcessTerminationMethod }
#Import ".\PackagePathType.ahk" { PackagePathType }
#Import ".\CreatePackageDependencyOptions.ahk" { CreatePackageDependencyOptions }
#Import ".\AddPackageDependencyOptions.ahk" { AddPackageDependencyOptions }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PackageDependencyProcessorArchitectures.ahk" { PackageDependencyProcessorArchitectures }
#Import ".\PACKAGE_VERSION.ahk" { PACKAGE_VERSION }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\_PACKAGE_INFO_REFERENCE.ahk" { _PACKAGE_INFO_REFERENCE }
#Import ".\AppPolicyCreateFileAccess.ahk" { AppPolicyCreateFileAccess }
#Import ".\AppPolicyWindowingModel.ahk" { AppPolicyWindowingModel }
#Import ".\PackageOrigin.ahk" { PackageOrigin }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */

;@region Functions
/**
 * Gets the package identifier (ID) for the calling process.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the structure returned, in bytes.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * The package ID, represented as a <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a> structure.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentpackageid
 * @since windows8.0
 */
export GetCurrentPackageId(bufferLength, _buffer) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetCurrentPackageId", bufferLengthMarshal, bufferLength, "ptr", _buffer, WIN32_ERROR)
    return result
}

/**
 * Gets the package full name for the calling process.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {Pointer<Integer>} packageFullNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFullName</i> buffer, in characters. On output, the size of the package full name returned, in characters, including the null terminator.
 * @param {PWSTR} packageFullName Type: <b>PWSTR</b>
 * 
 * The package full name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFullNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentpackagefullname
 * @since windows8.0
 */
export GetCurrentPackageFullName(packageFullNameLength, packageFullName) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetCurrentPackageFullName", packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, WIN32_ERROR)
    return result
}

/**
 * Gets the package family name for the calling process.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {Pointer<Integer>} packageFamilyNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFamilyName</i> buffer, in characters, including the null terminator. On output, the size of the package family name returned, in characters, including the null terminator.
 * @param {PWSTR} packageFamilyName Type: <b>PWSTR</b>
 * 
 * The package family name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFamilyNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentpackagefamilyname
 * @since windows8.0
 */
export GetCurrentPackageFamilyName(packageFamilyNameLength, packageFamilyName) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetCurrentPackageFamilyName", packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, WIN32_ERROR)
    return result
}

/**
 * Gets the package path for the calling process. (GetCurrentPackagePath)
 * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>path</i> buffer, in characters. On output, the size of the package path returned, in characters, including the null terminator.
 * @param {PWSTR} _path Type: <b>PWSTR</b>
 * 
 * The package path.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>pathLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentpackagepath
 * @since windows8.0
 */
export GetCurrentPackagePath(pathLength, _path) {
    _path := _path is String ? StrPtr(_path) : _path

    pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetCurrentPackagePath", pathLengthMarshal, pathLength, "ptr", _path, WIN32_ERROR)
    return result
}

/**
 * Gets the package identifier (ID) for the specified process.
 * @param {HANDLE} hProcess Type: <b>HANDLE</b>
 * 
 * A handle to the process that has the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the structure returned, in bytes.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * The package ID, represented as a <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a> structure.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackageid
 * @since windows8.0
 */
export GetPackageId(hProcess, bufferLength, _buffer) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackageId", HANDLE, hProcess, bufferLengthMarshal, bufferLength, "ptr", _buffer, WIN32_ERROR)
    return result
}

/**
 * Gets the package full name for the specified process.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {HANDLE} hProcess Type: <b>HANDLE</b>
 * 
 * A handle to the process that has the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @param {Pointer<Integer>} packageFullNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFullName</i> buffer, in characters. On output, the size of the package full name returned, in characters, including the null terminator.
 * @param {PWSTR} packageFullName Type: <b>PWSTR</b>
 * 
 * The package full name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFullNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagefullname
 * @since windows8.0
 */
export GetPackageFullName(hProcess, packageFullNameLength, packageFullName) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackageFullName", HANDLE, hProcess, packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, WIN32_ERROR)
    return result
}

/**
 * Gets the package full name for the specified token.
 * @remarks
 * For info about string size limits, see 
 *      <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {HANDLE} token A token that contains the package identity.
 * @param {Pointer<Integer>} packageFullNameLength On input, the size of the <i>packageFullName</i> buffer, in characters. On output, the 
 *       size of the package full name returned, in characters, including the null terminator.
 * @param {PWSTR} packageFullName The package full name.
 * @returns {WIN32_ERROR} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function 
 *       returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The token has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by 
 *          <i>packageFullNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagefullnamefromtoken
 * @since windows8.0
 */
export GetPackageFullNameFromToken(token, packageFullNameLength, packageFullName) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetPackageFullNameFromToken", HANDLE, token, packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, WIN32_ERROR)
    return result
}

/**
 * Gets the package family name for the specified process.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {HANDLE} hProcess Type: <b>HANDLE</b>
 * 
 * A handle to the process that has the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @param {Pointer<Integer>} packageFamilyNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFamilyName</i> buffer, in characters. On output, the size of the package family name returned, in characters, including the null-terminator.
 * @param {PWSTR} packageFamilyName Type: <b>PWSTR</b>
 * 
 * The package family name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFamilyNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagefamilyname
 * @since windows8.0
 */
export GetPackageFamilyName(hProcess, packageFamilyNameLength, packageFamilyName) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackageFamilyName", HANDLE, hProcess, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, WIN32_ERROR)
    return result
}

/**
 * Gets the package family name for the specified token.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {HANDLE} token Type: <b>HANDLE</b>
 * 
 * A token that contains the package identity.
 * @param {Pointer<Integer>} packageFamilyNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFamilyName</i> buffer, in characters. On output, the size of the package family name returned, in characters, including the null-terminator.
 * @param {PWSTR} packageFamilyName Type: <b>PWSTR</b>
 * 
 * The package family name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The token has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFamilyNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagefamilynamefromtoken
 * @since windows8.0
 */
export GetPackageFamilyNameFromToken(token, packageFamilyNameLength, packageFamilyName) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetPackageFamilyNameFromToken", HANDLE, token, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, WIN32_ERROR)
    return result
}

/**
 * Gets the path for the specified package.
 * @param {Pointer<PACKAGE_ID>} packageId Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a>*</b>
 * 
 * The package identifier.
 * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>path</i> buffer, in characters. On output, the size of the package path returned, in characters, including the null-terminator.
 * @param {PWSTR} _path Type: <b>PWSTR</b>
 * 
 * The package path.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by <i>path</i> is not large enough to hold the data. The required size is specified  by <i>pathLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagepath
 * @since windows8.0
 */
export GetPackagePath(packageId, pathLength, _path) {
    static reserved := 0 ;Reserved parameters must always be NULL

    _path := _path is String ? StrPtr(_path) : _path

    pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackagePath", PACKAGE_ID.Ptr, packageId, "uint", reserved, pathLengthMarshal, pathLength, "ptr", _path, WIN32_ERROR)
    return result
}

/**
 * Gets the path of the specified package. (GetPackagePathByFullName)
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of the package.
 * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package path string, which includes the null-terminator. 
 * 
 * First you pass <b>NULL</b> to <i>path</i> to get the number of characters. You use this number to allocate memory space for <i>path</i>. Then you pass the address of this memory space to fill <i>path</i>.
 * @param {PWSTR} _path Type: <b>PWSTR</b>
 * 
 * A pointer to memory space that receives  the package path string, which includes the null-terminator.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by <i>path</i> is not large enough to hold the data. The required size is specified  by <i>pathLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagepathbyfullname
 * @since windows8.1
 */
export GetPackagePathByFullName(packageFullName, pathLength, _path) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
    _path := _path is String ? StrPtr(_path) : _path

    pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackagePathByFullName", "ptr", packageFullName, pathLengthMarshal, pathLength, "ptr", _path, WIN32_ERROR)
    return result
}

/**
 * Gets the path of the specified staged package. (GetStagedPackagePathByFullName)
 * @remarks
 * This function succeeds if the package is staged, regardless of the user context or if the package is registered for the current user.
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of the staged package.
 * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package path string, which includes the null-terminator. 
 * 
 * First you pass <b>NULL</b> to <i>path</i> to get the number of characters. You use this number to allocate memory space for <i>path</i>. Then you pass the address of this memory space to fill <i>path</i>.
 * @param {PWSTR} _path Type: <b>PWSTR</b>
 * 
 * A pointer to memory space that receives  the package path string, which includes the null-terminator.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by <i>path</i> is not large enough to hold the data. The required size is specified  by <i>pathLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getstagedpackagepathbyfullname
 * @since windows8.1
 */
export GetStagedPackagePathByFullName(packageFullName, pathLength, _path) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
    _path := _path is String ? StrPtr(_path) : _path

    pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetStagedPackagePathByFullName", "ptr", packageFullName, pathLengthMarshal, pathLength, "ptr", _path, WIN32_ERROR)
    return result
}

/**
 * Gets the path of the specified package. (GetPackagePathByFullName2)
 * @remarks
 * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of the package.
 * @param {PackagePathType} _packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
 * 
 * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
 * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package path string, which includes the null-terminator. 
 * 
 * First you pass <b>NULL</b> to <i>path</i> to get the number of characters. You use this number to allocate memory space for <i>path</i>. Then you pass the address of this memory space to fill <i>path</i>.
 * @param {PWSTR} _path Type: <b>PWSTR</b>
 * 
 * A pointer to memory space that receives  the package path string, which includes the null-terminator.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by <i>path</i> is not large enough to hold the data. The required size is specified  by <i>pathLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagepathbyfullname2
 * @since windows10.0.10240
 */
export GetPackagePathByFullName2(packageFullName, _packagePathType, pathLength, _path) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
    _path := _path is String ? StrPtr(_path) : _path

    pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetPackagePathByFullName2", "ptr", packageFullName, PackagePathType, _packagePathType, pathLengthMarshal, pathLength, "ptr", _path, WIN32_ERROR)
    return result
}

/**
 * Gets the path of the specified staged package. (GetStagedPackagePathByFullName2)
 * @remarks
 * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of the staged package.
 * @param {PackagePathType} _packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
 * 
 * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
 * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package path string, which includes the null-terminator. 
 * 
 * First you pass <b>NULL</b> to <i>path</i> to get the number of characters. You use this number to allocate memory space for <i>path</i>. Then you pass the address of this memory space to fill <i>path</i>.
 * @param {PWSTR} _path Type: <b>PWSTR</b>
 * 
 * A pointer to memory space that receives  the package path string, which includes the null-terminator.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by <i>path</i> is not large enough to hold the data. The required size is specified  by <i>pathLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getstagedpackagepathbyfullname2
 * @since windows10.0.10240
 */
export GetStagedPackagePathByFullName2(packageFullName, _packagePathType, pathLength, _path) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
    _path := _path is String ? StrPtr(_path) : _path

    pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetStagedPackagePathByFullName2", "ptr", packageFullName, PackagePathType, _packagePathType, pathLengthMarshal, pathLength, "ptr", _path, WIN32_ERROR)
    return result
}

/**
 * Gets the package information for the calling process. (GetCurrentPackageInfo2)
 * @remarks
 * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
 * @param {Integer} flags Type: <b>const UINT32</b>
 * 
 * The [package constants](/windows/desktop/appxpkg/package-constants) that specify how package information is retrieved. The <b>PACKAGE_FILTER_*</b> flags are supported.
 * @param {PackagePathType} _packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
 * 
 * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the array of structures returned, in bytes.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * The package information, represented as an array of <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_info">PACKAGE_INFO</a> structures.
 * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
 * 
 * The number of structures in the buffer.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentpackageinfo2
 * @since windows10.0.10240
 */
export GetCurrentPackageInfo2(flags, _packagePathType, bufferLength, _buffer, count) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetCurrentPackageInfo2", "uint", flags, PackagePathType, _packagePathType, bufferLengthMarshal, bufferLength, "ptr", _buffer, countMarshal, count, WIN32_ERROR)
    return result
}

/**
 * Gets the package path for the calling process. (GetCurrentPackagePath2)
 * @remarks
 * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
 * @param {PackagePathType} _packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
 * 
 * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
 * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>path</i> buffer, in characters. On output, the size of the package path returned, in characters, including the null terminator.
 * @param {PWSTR} _path Type: <b>PWSTR</b>
 * 
 * The package path.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>pathLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentpackagepath2
 * @since windows10.0.10240
 */
export GetCurrentPackagePath2(_packagePathType, pathLength, _path) {
    _path := _path is String ? StrPtr(_path) : _path

    pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetCurrentPackagePath2", PackagePathType, _packagePathType, pathLengthMarshal, pathLength, "ptr", _path, WIN32_ERROR)
    return result
}

/**
 * Gets the application user model ID for the current process.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {Pointer<Integer>} applicationUserModelIdLength On input, the size of the  <i>applicationUserModelId</i> buffer, in wide characters. On success, the size of the buffer used, including the null terminator.
 * @param {PWSTR} applicationUserModelId A pointer to a buffer that receives the application user model ID.
 * @returns {WIN32_ERROR} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_APPLICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no application identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>applicationUserModelIdLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentapplicationusermodelid
 */
export GetCurrentApplicationUserModelId(applicationUserModelIdLength, applicationUserModelId) {
    applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

    applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetCurrentApplicationUserModelId", applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, WIN32_ERROR)
    return result
}

/**
 * Gets the application user model ID for the specified process.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {HANDLE} hProcess A handle to the process. This handle must have the <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more info, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @param {Pointer<Integer>} applicationUserModelIdLength On input, the size of the  <i>applicationUserModelId</i> buffer, in wide characters. On success, the size of the buffer used, including the null terminator.
 * @param {PWSTR} applicationUserModelId A pointer to a buffer that receives the application user model ID.
 * @returns {WIN32_ERROR} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_APPLICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no application identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>applicationUserModelIdLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getapplicationusermodelid
 */
export GetApplicationUserModelId(hProcess, applicationUserModelIdLength, applicationUserModelId) {
    applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

    applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetApplicationUserModelId", HANDLE, hProcess, applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, WIN32_ERROR)
    return result
}

/**
 * Gets the application user model ID for the specified token.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {HANDLE} token A token that contains the application identity. This handle must have the <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more info, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
 * @param {Pointer<Integer>} applicationUserModelIdLength On input, the size of the  <i>applicationUserModelId</i> buffer, in wide characters. On success, the size of the buffer used, including the null terminator.
 * @param {PWSTR} applicationUserModelId A pointer to a buffer that receives the application user model ID.
 * @returns {WIN32_ERROR} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_APPLICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The token has no application identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>applicationUserModelIdLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getapplicationusermodelidfromtoken
 */
export GetApplicationUserModelIdFromToken(token, applicationUserModelIdLength, applicationUserModelId) {
    applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

    applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetApplicationUserModelIdFromToken", HANDLE, token, applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PWSTR} packageFullName 
 * @returns {WIN32_ERROR} 
 */
export VerifyPackageFullName(packageFullName) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageFullName", "ptr", packageFullName, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PWSTR} packageFamilyName 
 * @returns {WIN32_ERROR} 
 */
export VerifyPackageFamilyName(packageFamilyName) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageFamilyName", "ptr", packageFamilyName, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {Pointer<PACKAGE_ID>} packageId 
 * @returns {WIN32_ERROR} 
 */
export VerifyPackageId(packageId) {
    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageId", PACKAGE_ID.Ptr, packageId, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PWSTR} applicationUserModelId 
 * @returns {WIN32_ERROR} 
 */
export VerifyApplicationUserModelId(applicationUserModelId) {
    applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyApplicationUserModelId", "ptr", applicationUserModelId, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PWSTR} packageRelativeApplicationId 
 * @returns {WIN32_ERROR} 
 */
export VerifyPackageRelativeApplicationId(packageRelativeApplicationId) {
    packageRelativeApplicationId := packageRelativeApplicationId is String ? StrPtr(packageRelativeApplicationId) : packageRelativeApplicationId

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageRelativeApplicationId", "ptr", packageRelativeApplicationId, WIN32_ERROR)
    return result
}

/**
 * Gets the package identifier (ID) for the specified package full name.
 * @remarks
 * If <i>flags</i> specifies <b>PACKAGE_INFORMATION_BASIC</b>, the following fields are retrieved:
 * 
 * <ul>
 * <li><b>name</b></li>
 * <li><b>processorArchitecture</b></li>
 * <li><b>publisherId</b></li>
 * <li><b>resourceId</b></li>
 * <li><b>version</b></li>
 * </ul>
 * If <i>flags</i> specifies <b>PACKAGE_INFORMATION_FULL</b>, the following fields are retrieved:
 * 
 * <ul>
 * <li><b>name</b></li>
 * <li><b>processorArchitecture</b></li>
 * <li><b>publisher</b></li>
 * <li><b>publisherId</b></li>
 * <li><b>resourceId</b></li>
 * <li><b>version</b></li>
 * </ul>
 * A request for <b>PACKAGE_INFORMATION_FULL</b> succeeds only if the package corresponding to <i>packageFullName</i> is installed for and accessible to the current user. If the package full name is syntactically correct but does not correspond to a package that is installed for and accessible to the current user, the function returns <b>ERROR_NOT_FOUND</b>.
 * 
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of a package.
 * @param {Integer} flags Type: <b>const UINT32</b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/appxpkg/package-constants">package constants</a> that specify how package information is retrieved. The <b>PACKAGE_INFORMATION_*</b> flags are supported.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the data returned, in bytes.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * The package ID, represented as a <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a> structure.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The package is not installed for the user.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-packageidfromfullname
 * @since windows8.0
 */
export PackageIdFromFullName(packageFullName, flags, bufferLength, _buffer) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\PackageIdFromFullName", "ptr", packageFullName, "uint", flags, bufferLengthMarshal, bufferLength, "ptr", _buffer, WIN32_ERROR)
    return result
}

/**
 * Gets the package full name for the specified package identifier (ID).
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {Pointer<PACKAGE_ID>} packageId Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a>*</b>
 * 
 * The package ID.
 * @param {Pointer<Integer>} packageFullNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFullName</i> buffer, in characters. On output, the size of the package full name returned, in characters, including the null terminator.
 * @param {PWSTR} packageFullName Type: <b>PWSTR</b>
 * 
 * The package full name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFullNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-packagefullnamefromid
 * @since windows8.0
 */
export PackageFullNameFromId(packageId, packageFullNameLength, packageFullName) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\PackageFullNameFromId", PACKAGE_ID.Ptr, packageId, packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, WIN32_ERROR)
    return result
}

/**
 * Gets the package family name for the specified package identifier.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {Pointer<PACKAGE_ID>} packageId Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_id">PACKAGE_ID</a>*</b>
 * 
 * The package identifier.
 * @param {Pointer<Integer>} packageFamilyNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFamilyName</i> buffer, in characters. On output, the size of the package family name returned, in characters, including the null terminator.
 * @param {PWSTR} packageFamilyName Type: <b>PWSTR</b>
 * 
 * The package family name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFamilyNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-packagefamilynamefromid
 * @since windows8.0
 */
export PackageFamilyNameFromId(packageId, packageFamilyNameLength, packageFamilyName) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\PackageFamilyNameFromId", PACKAGE_ID.Ptr, packageId, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, WIN32_ERROR)
    return result
}

/**
 * Gets the package family name for the specified package full name.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of a package.
 * @param {Pointer<Integer>} packageFamilyNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageFamilyName</i> buffer, in characters. On output, the size of the package family name returned, in characters, including the null terminator.
 * @param {PWSTR} packageFamilyName Type: <b>PWSTR</b>
 * 
 * The package family name.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>packageFamilyNameLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-packagefamilynamefromfullname
 * @since windows8.0
 */
export PackageFamilyNameFromFullName(packageFullName, packageFamilyNameLength, packageFamilyName) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\PackageFamilyNameFromFullName", "ptr", packageFullName, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, WIN32_ERROR)
    return result
}

/**
 * Gets the package name and publisher identifier (ID) for the specified package family name.
 * @remarks
 * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
 * @param {PWSTR} packageFamilyName Type: <b>PCWSTR</b>
 * 
 * The family name of a package.
 * @param {Pointer<Integer>} packageNameLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packageName</i> buffer, in characters. On output, the size of the package name returned, in characters, including the null-terminator.
 * @param {PWSTR} packageName Type: <b>PWSTR</b>
 * 
 * The package name.
 * @param {Pointer<Integer>} packagePublisherIdLength Type: <b>UINT32*</b>
 * 
 * On input, the size of the <i>packagePublishId</i> buffer, in characters. On output, the size of the publisher ID returned, in characters, including the null-terminator.
 * @param {PWSTR} packagePublisherId Type: <b>PWSTR</b>
 * 
 * The package publisher ID.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the buffers is not large enough to hold the data. The required sizes are specified  by <i>packageNameLength</i> and <i>packagePublisherIdLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-packagenameandpublisheridfromfamilyname
 * @since windows8.0
 */
export PackageNameAndPublisherIdFromFamilyName(packageFamilyName, packageNameLength, packageName, packagePublisherIdLength, packagePublisherId) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
    packageName := packageName is String ? StrPtr(packageName) : packageName
    packagePublisherId := packagePublisherId is String ? StrPtr(packagePublisherId) : packagePublisherId

    packageNameLengthMarshal := packageNameLength is VarRef ? "uint*" : "ptr"
    packagePublisherIdLengthMarshal := packagePublisherIdLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\PackageNameAndPublisherIdFromFamilyName", "ptr", packageFamilyName, packageNameLengthMarshal, packageNameLength, "ptr", packageName, packagePublisherIdLengthMarshal, packagePublisherIdLength, "ptr", packagePublisherId, WIN32_ERROR)
    return result
}

/**
 * Constructs an application user model ID from the package family name and the package relative application ID (PRAID).
 * @param {PWSTR} packageFamilyName Type: <b>PCWSTR</b>
 * 
 * The package family name.
 * @param {PWSTR} packageRelativeApplicationId Type: <b>PCWSTR</b>
 * 
 * The package-relative app ID (PRAID).
 * @param {Pointer<Integer>} applicationUserModelIdLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the app user model ID string, which includes the null-terminator. 
 * 
 * First you pass <b>NULL</b> to <i>applicationUserModelId</i> to get the number of characters. You use this number to allocate memory space for <i>applicationUserModelId</i>. Then you pass the address of this memory space to fill <i>applicationUserModelId</i>.
 * @param {PWSTR} applicationUserModelId Type: <b>PWSTR</b>
 * 
 * A pointer to memory space that receives  the app user model ID string, which includes the null-terminator.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>packageFamilyName</i> or <i>packageRelativeApplicationId</i> parameter isn't valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by <i>applicationUserModelId</i> is not large enough to hold the data; the required buffer size, in <b>WCHAR</b>s, is stored in the variable pointed to by <i>applicationUserModelIdLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-formatapplicationusermodelid
 * @since windows8.1
 */
export FormatApplicationUserModelId(packageFamilyName, packageRelativeApplicationId, applicationUserModelIdLength, applicationUserModelId) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
    packageRelativeApplicationId := packageRelativeApplicationId is String ? StrPtr(packageRelativeApplicationId) : packageRelativeApplicationId
    applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

    applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\FormatApplicationUserModelId", "ptr", packageFamilyName, "ptr", packageRelativeApplicationId, applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, WIN32_ERROR)
    return result
}

/**
 * Deconstructs an application user model ID to its package family name and package relative application ID (PRAID).
 * @param {PWSTR} applicationUserModelId Type: <b>PCWSTR</b>
 * 
 * The app user model ID.
 * @param {Pointer<Integer>} packageFamilyNameLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package family name string, which includes the null-terminator. 
 * 
 * First you pass <b>NULL</b> to <i>packageFamilyName</i> to get the number of characters. You use this number to allocate memory space for <i>packageFamilyName</i>. Then you pass the address of this memory space to fill <i>packageFamilyName</i>.
 * @param {PWSTR} packageFamilyName Type: <b>PWSTR</b>
 * 
 * A pointer to memory space that receives  the package family name string, which includes the null-terminator.
 * @param {Pointer<Integer>} packageRelativeApplicationIdLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package-relative app ID string, which includes the null-terminator. 
 * 
 * First you pass <b>NULL</b> to <i>packageRelativeApplicationId</i> to get the number of characters. You use this number to allocate memory space for <i>packageRelativeApplicationId</i>. Then you pass the address of this memory space to fill <i>packageRelativeApplicationId</i>.
 * @param {PWSTR} packageRelativeApplicationId Type: <b>PWSTR</b>
 * 
 * A pointer to memory space that receives  the package-relative app ID (PRAID) string, which includes the null-terminator.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>applicationUserModelId</i> parameter isn't valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer specified by <i>packageFamilyName</i> or <i>packageRelativeApplicationId</i> is not large enough to hold the data; the required buffer size, in <b>WCHAR</b>s, is stored in the variable pointed to by <i>packageFamilyNameLength</i> or <i>packageRelativeApplicationIdLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-parseapplicationusermodelid
 * @since windows8.1
 */
export ParseApplicationUserModelId(applicationUserModelId, packageFamilyNameLength, packageFamilyName, packageRelativeApplicationIdLength, packageRelativeApplicationId) {
    applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
    packageRelativeApplicationId := packageRelativeApplicationId is String ? StrPtr(packageRelativeApplicationId) : packageRelativeApplicationId

    packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"
    packageRelativeApplicationIdLengthMarshal := packageRelativeApplicationIdLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\ParseApplicationUserModelId", "ptr", applicationUserModelId, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, packageRelativeApplicationIdLengthMarshal, packageRelativeApplicationIdLength, "ptr", packageRelativeApplicationId, WIN32_ERROR)
    return result
}

/**
 * Gets the packages with the specified family name for the current user.
 * @param {PWSTR} packageFamilyName Type: <b>PCWSTR</b>
 * 
 * The package family name.
 * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of package full names. 
 * 
 * First you pass <b>NULL</b> to <i>packageFullNames</i> to get the number of package full names. You use this number to allocate memory space for <i>packageFullNames</i>. Then you pass the address of this number to fill <i>packageFullNames</i>.
 * @param {Pointer<PWSTR>} packageFullNames Type: <b>PWSTR*</b>
 * 
 * A pointer to the strings of package full names.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters in the string of package full names. 
 * 
 * First you pass <b>NULL</b> to <i>buffer</i> to get the number of characters. You use this number to allocate memory space for <i>buffer</i>. Then you pass the address of this number to fill <i>buffer</i>.
 * @param {PWSTR} _buffer Type: <b>WCHAR*</b>
 * 
 * The string of characters for all of the package full names.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more buffer is not large enough to hold the data. The required size is specified  by either <i>count</i> or <i>buffer</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackagesbypackagefamily
 * @since windows8.0
 */
export GetPackagesByPackageFamily(packageFamilyName, count, packageFullNames, bufferLength, _buffer) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
    _buffer := _buffer is String ? StrPtr(_buffer) : _buffer

    countMarshal := count is VarRef ? "uint*" : "ptr"
    packageFullNamesMarshal := packageFullNames is VarRef ? "ptr*" : "ptr"
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackagesByPackageFamily", "ptr", packageFamilyName, countMarshal, count, packageFullNamesMarshal, packageFullNames, bufferLengthMarshal, bufferLength, "ptr", _buffer, WIN32_ERROR)
    return result
}

/**
 * Finds the packages with the specified family name for the current user.
 * @param {PWSTR} packageFamilyName Type: <b>PCWSTR</b>
 * 
 * The package family name.
 * @param {Integer} packageFilters Type: <b>UINT32</b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/appxpkg/package-constants">package constants</a> that specify how package information is retrieved. All package constants except <b>PACKAGE_FILTER_ALL_LOADED</b> are supported.
 * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of package full names that were found. 
 * 
 * First you pass <b>NULL</b> to <i>packageFullNames</i> to get the number of package full names that were found. You use this number to allocate memory space for <i>packageFullNames</i>. Then you pass the address of this memory space to fill <i>packageFullNames</i>.
 * @param {Pointer<PWSTR>} packageFullNames Type: <b>PWSTR*</b>
 * 
 * A pointer to memory space that receives  the strings of package full names that were found.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the number of characters in the string of package full names. 
 * 
 * First you pass <b>NULL</b> to <i>buffer</i> to get the number of characters. You use this number to allocate memory space for <i>buffer</i>. Then you pass the address of this memory space to fill <i>buffer</i>.
 * @param {PWSTR} _buffer Type: <b>WCHAR*</b>
 * 
 * A pointer to memory space that receives  the string of characters for all of the package full names.
 * @param {Pointer<Integer>} packageProperties Type: <b>UINT32*</b>
 * 
 * A pointer to memory space that receives  the <a href="https://docs.microsoft.com/windows/desktop/appxpkg/package-constants">package properties</a> for all of the packages that were found.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more buffer is not large enough to hold the data. The required size is specified  by either <i>count</i> or <i>buffer</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-findpackagesbypackagefamily
 * @since windows8.1
 */
export FindPackagesByPackageFamily(packageFamilyName, packageFilters, count, packageFullNames, bufferLength, _buffer, packageProperties) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
    _buffer := _buffer is String ? StrPtr(_buffer) : _buffer

    countMarshal := count is VarRef ? "uint*" : "ptr"
    packageFullNamesMarshal := packageFullNames is VarRef ? "ptr*" : "ptr"
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
    packagePropertiesMarshal := packageProperties is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\FindPackagesByPackageFamily", "ptr", packageFamilyName, "uint", packageFilters, countMarshal, count, packageFullNamesMarshal, packageFullNames, bufferLengthMarshal, bufferLength, "ptr", _buffer, packagePropertiesMarshal, packageProperties, WIN32_ERROR)
    return result
}

/**
 * Gets the origin of the specified package.
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of the package.
 * @param {Pointer<PackageOrigin>} origin Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-packageorigin">PackageOrigin</a>*</b>
 * 
 * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-packageorigin">PackageOrigin</a>-typed value that indicates the origin of the package specified by <i>packageFullName</i>.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>packageFullName</i> parameter isn't valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getstagedpackageorigin
 * @since windows8.1
 */
export GetStagedPackageOrigin(packageFullName, origin) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    originMarshal := origin is VarRef ? "int*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetStagedPackageOrigin", "ptr", packageFullName, originMarshal, origin, WIN32_ERROR)
    return result
}

/**
 * Gets the package information for the calling process. (GetCurrentPackageInfo)
 * @param {Integer} flags Type: <b>const UINT32</b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/appxpkg/package-constants">package constants</a> that specify how package information is retrieved. The <b>PACKAGE_FILTER_*</b> flags are supported.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the array of structures returned, in bytes.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * The package information, represented as an array of <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_info">PACKAGE_INFO</a> structures.
 * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
 * 
 * The number of structures in the buffer.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>APPMODEL_ERROR_NO_PACKAGE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process has no package identity.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getcurrentpackageinfo
 * @since windows8.0
 */
export GetCurrentPackageInfo(flags, bufferLength, _buffer, count) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetCurrentPackageInfo", "uint", flags, bufferLengthMarshal, bufferLength, "ptr", _buffer, countMarshal, count, WIN32_ERROR)
    return result
}

/**
 * Opens the package information of the specified package.
 * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
 * 
 * The full name of the package.
 * @param {Pointer<Pointer<_PACKAGE_INFO_REFERENCE>>} packageInfoReference Type: <b>PACKAGE_INFO_REFERENCE*</b>
 * 
 * A reference to package information.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The package is not installed for the current user.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-openpackageinfobyfullname
 * @since windows8.0
 */
export OpenPackageInfoByFullName(packageFullName, packageInfoReference) {
    static reserved := 0 ;Reserved parameters must always be NULL

    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    packageInfoReferenceMarshal := packageInfoReference is VarRef ? "ptr*" : "ptr"

    result := DllCall("KERNEL32.dll\OpenPackageInfoByFullName", "ptr", packageFullName, "uint", reserved, packageInfoReferenceMarshal, packageInfoReference, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PSID} userSid 
 * @param {PWSTR} packageFullName 
 * @param {Pointer<Pointer<_PACKAGE_INFO_REFERENCE>>} packageInfoReference 
 * @returns {WIN32_ERROR} 
 */
export OpenPackageInfoByFullNameForUser(userSid, packageFullName, packageInfoReference) {
    static reserved := 0 ;Reserved parameters must always be NULL

    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    packageInfoReferenceMarshal := packageInfoReference is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\OpenPackageInfoByFullNameForUser", PSID, userSid, "ptr", packageFullName, "uint", reserved, packageInfoReferenceMarshal, packageInfoReference, WIN32_ERROR)
    return result
}

/**
 * Closes a reference to the specified package information.
 * @param {Pointer<_PACKAGE_INFO_REFERENCE>} packageInfoReference Type: <b>PACKAGE_INFO_REFERENCE</b>
 * 
 * A reference to package information.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-closepackageinfo
 * @since windows8.0
 */
export ClosePackageInfo(packageInfoReference) {
    result := DllCall("KERNEL32.dll\ClosePackageInfo", _PACKAGE_INFO_REFERENCE.Ptr, packageInfoReference, WIN32_ERROR)
    return result
}

/**
 * Gets the package information for the specified package. (GetPackageInfo)
 * @param {Pointer<_PACKAGE_INFO_REFERENCE>} packageInfoReference Type: <b>PACKAGE_INFO_REFERENCE</b>
 * 
 * A reference to package information.
 * @param {Integer} flags Type: <b>const UINT32</b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/appxpkg/package-constants">package constants</a> that specify how package information is retrieved.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the package information returned, in bytes.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * The package information, represented as an array of <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_info">PACKAGE_INFO</a> structures.
 * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
 * 
 * The number of packages in the buffer.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackageinfo
 * @since windows8.0
 */
export GetPackageInfo(packageInfoReference, flags, bufferLength, _buffer, count) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackageInfo", _PACKAGE_INFO_REFERENCE.Ptr, packageInfoReference, "uint", flags, bufferLengthMarshal, bufferLength, "ptr", _buffer, countMarshal, count, WIN32_ERROR)
    return result
}

/**
 * Gets the IDs of apps in the specified package.
 * @param {Pointer<_PACKAGE_INFO_REFERENCE>} packageInfoReference Type: <b>PACKAGE_INFO_REFERENCE</b>
 * 
 * A reference to package information.
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that holds the size of <i>buffer</i>, in bytes. 
 * 
 * First you pass <b>NULL</b> to <i>buffer</i> to get the required size of <i>buffer</i>. You use this number to allocate memory space for <i>buffer</i>. Then you pass the address of this memory space to fill <i>buffer</i>.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * A pointer to memory space that receives  the app IDs.
 * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
 * 
 * A pointer to a variable that receives the number of app IDs in <i>buffer</i>.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackageapplicationids
 * @since windows8.1
 */
export GetPackageApplicationIds(packageInfoReference, bufferLength, _buffer, count) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetPackageApplicationIds", _PACKAGE_INFO_REFERENCE.Ptr, packageInfoReference, bufferLengthMarshal, bufferLength, "ptr", _buffer, countMarshal, count, WIN32_ERROR)
    return result
}

/**
 * Gets the package information for the specified package. (GetPackageInfo2)
 * @remarks
 * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
 * @param {Pointer<_PACKAGE_INFO_REFERENCE>} packageInfoReference Type: <b>PACKAGE_INFO_REFERENCE</b>
 * 
 * A reference to package information.
 * @param {Integer} flags Type: <b>const UINT32</b>
 * 
 * The [package constants](/windows/desktop/appxpkg/package-constants) that specify how package information is retrieved.
 * @param {PackagePathType} _packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
 * 
 * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
 * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the package information returned, in bytes.
 * @param {Integer} _buffer Type: <b>BYTE*</b>
 * 
 * The package information, represented as an array of [PACKAGE_INFO](./ns-appmodel-package_info.md) structures.
 * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
 * 
 * The number of packages in the buffer.
 * @returns {WIN32_ERROR} Type: <b>LONG</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is not large enough to hold the data. The required size is specified  by <i>bufferLength</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getpackageinfo2
 * @since windows10.0.10240
 */
export GetPackageInfo2(packageInfoReference, flags, _packagePathType, bufferLength, _buffer, count) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetPackageInfo2", _PACKAGE_INFO_REFERENCE.Ptr, packageInfoReference, "uint", flags, PackagePathType, _packagePathType, bufferLengthMarshal, bufferLength, "ptr", _buffer, countMarshal, count, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PWSTR} packageFullName 
 * @returns {BOOL} 
 */
export CheckIsMSIXPackage(packageFullName) {
    packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

    result := DllCall("KERNEL32.dll\CheckIsMSIXPackage", "ptr", packageFullName, BOOL.Ptr, &isMSIXPackage := 0, "HRESULT")
    return isMSIXPackage
}

/**
 * Creates an install-time reference for a framework package dependency for the current app, using the specified package family name, minimum version, and additional criteria.
 * @remarks
 * In your app's installer or during the first run of your app, call this method to specify a set of criteria for a framework package you want to use in your app. This informs the OS that your app has a dependency upon a framework package that meets the specified criteria. If one or more framework packages are installed that meet the criteria, Windows will ensure that at least one of these framework packages will remain installed until the install-time reference is deleted. For more information, see [Use the dynamic dependency API to reference MSIX packages at run time](/windows/apps/desktop/modernize/framework-packages/use-the-dynamic-dependency-api).
 * 
 * This function fails if the specified dependency criteria cannot be resolved to a specific package. This package resolution check is skipped if [CreatePackageDependencyOptions_DoNotVerifyDependencyResolution](ne-appmodel-createpackagedependencyoptions.md) is specified for the *options* parameter. This is useful for installers running as user contexts other than the target user (for example, installers running as LocalSystem).
 * @param {PSID} user Type: <b>PSID</b>
 * 
 * The user scope of the package dependency. If NULL, the caller's user context is used. Must be NULL if [CreatePackageDependencyOptions_ScopeIsSystem](ne-appmodel-createpackagedependencyoptions.md) is specified.
 * @param {PWSTR} packageFamilyName Type: <b>PCWSTR</b>
 * 
 * The package family name of the framework package on which to take dependency.
 * @param {PACKAGE_VERSION} minVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_version">PACKAGE_VERSION</a></b>
 * 
 * The minimum version of the framework package on which to take dependency.
 * @param {PackageDependencyProcessorArchitectures} _packageDependencyProcessorArchitectures Type: <b><a href="ne-appmodel-packagedependencyprocessorarchitectures.md">PackageDependencyProcessorArchitectures</a></b>
 * 
 * The processor architectures of the package dependency.
 * @param {PackageDependencyLifetimeKind} lifetimeKind Type: <b><a href="ne-appmodel-packagedependencylifetimekind.md">PackageDependencyLifetimeKind</a></b>
 * 
 * The type of artifact to use to define the lifetime of the package dependency. For more information, see the remarks.
 * @param {PWSTR} lifetimeArtifact Type: <b>PCWSTR</b>
 * 
 * The name of the artifact used to define the lifetime of the package dependency. Must be NULL if the *lifetimeKind* parameter is [PackageDependencyLifetimeKind_Process](ne-appmodel-packagedependencylifetimekind.md). For more information, see the remarks.
 * @param {CreatePackageDependencyOptions} options Type: <b><a href="ne-appmodel-createpackagedependencyoptions.md">CreatePackageDependencyOptions</a></b>
 * 
 * The options to apply when creating the package dependency.
 * @returns {PWSTR} Type: <b>PWSTR*</b>
 * 
 * When this method returns, contains the address of a pointer to a null-terminated Unicode string that specifies the ID of the new package dependency. The caller is responsible for freeing this resource once it is no longer needed by calling [HeapFree](/windows/win32/api/heapapi/nf-heapapi-heapfree).
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-trycreatepackagedependency
 */
export TryCreatePackageDependency(user, packageFamilyName, minVersion, _packageDependencyProcessorArchitectures, lifetimeKind, lifetimeArtifact, options) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
    lifetimeArtifact := lifetimeArtifact is String ? StrPtr(lifetimeArtifact) : lifetimeArtifact

    result := DllCall("KERNELBASE.dll\TryCreatePackageDependency", PSID, user, "ptr", packageFamilyName, PACKAGE_VERSION, minVersion, PackageDependencyProcessorArchitectures, _packageDependencyProcessorArchitectures, PackageDependencyLifetimeKind, lifetimeKind, "ptr", lifetimeArtifact, CreatePackageDependencyOptions, options, PWSTR.Ptr, &packageDependencyId := 0, "HRESULT")
    return packageDependencyId
}

/**
 * 
 * @param {PSID} user 
 * @param {PWSTR} packageFamilyName 
 * @param {PACKAGE_VERSION} minVersion 
 * @param {PackageDependencyProcessorArchitectures} _packageDependencyProcessorArchitectures 
 * @param {PackageDependencyLifetimeKind} lifetimeKind 
 * @param {PWSTR} lifetimeArtifact 
 * @param {CreatePackageDependencyOptions} options 
 * @param {Pointer<FILETIME>} lifetimeExpiration 
 * @returns {PWSTR} 
 */
export TryCreatePackageDependency2(user, packageFamilyName, minVersion, _packageDependencyProcessorArchitectures, lifetimeKind, lifetimeArtifact, options, lifetimeExpiration) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
    lifetimeArtifact := lifetimeArtifact is String ? StrPtr(lifetimeArtifact) : lifetimeArtifact

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\TryCreatePackageDependency2", PSID, user, "ptr", packageFamilyName, PACKAGE_VERSION, minVersion, PackageDependencyProcessorArchitectures, _packageDependencyProcessorArchitectures, PackageDependencyLifetimeKind, lifetimeKind, "ptr", lifetimeArtifact, CreatePackageDependencyOptions, options, FILETIME.Ptr, lifetimeExpiration, PWSTR.Ptr, &packageDependencyId := 0, "HRESULT")
    return packageDependencyId
}

/**
 * Deletes the install-time reference for the framework package dependency you created earlier by using the TryCreatePackageDependency method. This method informs the OS that it is safe to remove the framework package if no other apps have a dependency on it.
 * @remarks
 * Removing a package dependency is typically done when an app is uninstalled. A package dependency is implicitly removed if its lifetime artifact (specified via the *lifetimeArtifact* parameter of the [TryCreatePackageDependency](nf-appmodel-trycreatepackagedependency.md) function) is deleted. Package dependencies that are not referenced by other packages are elegible to be removed.
 * 
 * The caller of this function must have administrative privileges if the package dependency was created using [CreatePackageDependencyOptions_ScopeIsSystem](ne-appmodel-createpackagedependencyoptions.md).
 * @param {PWSTR} packageDependencyId Type: <b>PCWSTR</b>
 * 
 * The ID of the package dependency to remove.
 * @returns {HRESULT} | Return code | Description |
 * |-------------|-------------|
 * | E_INVALIDARG | The *packageDependencyId* parameter is NULL on input. |
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-deletepackagedependency
 */
export DeletePackageDependency(packageDependencyId) {
    packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

    result := DllCall("KERNELBASE.dll\DeletePackageDependency", "ptr", packageDependencyId, "HRESULT")
    return result
}

/**
 * Resolves a previously defined PackageDependency to a specific package and adds it to the invoking process' package graph. After the dependency has been added, other code-loading methods (such as LoadLibrary and CoCreateInstance) can find the binaries in the resolved package.
 * @remarks
 * Calling this method resolves the framework package dependency to a specific package on the system. It also informs the OS that the framework package is in active use and to handle any version updates in a side-by-side manner (effectively delay uninstalling or otherwise servicing the older version until after your app is done using it). Package resolution is specific to a user and can return different values for different users on a system.
 * 
 * Each successful **AddPackageDependency** call adds the resolved package to the calling process' package graph, even if already present. There is no duplicate detection or filtering applied by the API (that is, multiple references from a package is not harmful). After resolution is complete, the package dependency stays resolved for that user until the last reference across all processes for that user is removed via [RemovePackageDependency](nf-appmodel-removepackagedependency.md) or the process is terminated.
 * 
 * After this method successfully returns, your app can activate types and use content from the framework package until [RemovePackageDependency](nf-appmodel-removepackagedependency.md) is called.
 * 
 * If multiple packages are present in the package graph with the same rank as the call to **AddPackageDependency**, the resolved package is (by default) added after others of the same rank. To add a package before others of the same rank, specify [AddPackageDependencyOptions_PrependIfRankCollision](ne-appmodel-addpackagedependencyoptions.md) for the *options* parameter.
 * 
 * For more information, see [Use the dynamic dependency API to reference MSIX packages at run time](/windows/apps/desktop/modernize/framework-packages/use-the-dynamic-dependency-api).
 * @param {PWSTR} packageDependencyId Type: <b>PCWSTR</b>
 * 
 * The ID of the package dependency to be resolved and added to the invoking process' package graph. This parameter must match a package dependency defined by using the [TryCreatePackageDependency](nf-appmodel-trycreatepackagedependency.md) function for the calling user or the system (via the [CreatePackageDependencyOptions_ScopeIsSystem](ne-appmodel-createpackagedependencyoptions.md) option), or else an error is returned.
 * @param {Integer} rank Type: <b>INT32</b>
 * 
 * The rank to use to add the resolved package to the caller's package graph. For more information, see the remarks.
 * @param {AddPackageDependencyOptions} options Type: <b><a href="ne-appmodel-addpackagedependencyoptions.md">AddPackageDependencyOptions</a></b>
 * 
 * The options to apply when adding the package dependency.
 * @param {Pointer<PACKAGEDEPENDENCY_CONTEXT>} packageDependencyContext Type: <b>PACKAGEDEPENDENCY_CONTEXT*</b>
 * 
 * The handle of the added package dependency. This handle is valid until it is passed to <a href="nf-appmodel-removepackagedependency.md">RemovePackageDependency</a>.
 * @param {Pointer<PWSTR>} packageFullName Type: <b>PCWSTR*</b>
 * 
 * When this method returns, contains the address of a pointer to a null-terminated Unicode string that specifies the full name of the package to which the dependency has been resolved. The caller is responsible for freeing this resource once it is no longer needed by calling [HeapFree](/windows/win32/api/heapapi/nf-heapapi-heapfree).
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * | Return code | Description |
 * |-------------|-------------|
 * | E_INVALIDARG | The *packageDependencyId* or *packageDependencyContext* parameter is NULL on input. |
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-addpackagedependency
 */
export AddPackageDependency(packageDependencyId, rank, options, packageDependencyContext, packageFullName) {
    packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

    packageDependencyContextMarshal := packageDependencyContext is VarRef ? "ptr*" : "ptr"
    packageFullNameMarshal := packageFullName is VarRef ? "ptr*" : "ptr"

    result := DllCall("KERNELBASE.dll\AddPackageDependency", "ptr", packageDependencyId, "int", rank, AddPackageDependencyOptions, options, packageDependencyContextMarshal, packageDependencyContext, packageFullNameMarshal, packageFullName, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} packageDependencyId 
 * @param {Integer} rank 
 * @param {AddPackageDependencyOptions2} options 
 * @param {Pointer<PACKAGEDEPENDENCY_CONTEXT>} packageDependencyContext 
 * @param {Pointer<PWSTR>} packageFullName 
 * @returns {HRESULT} 
 */
export AddPackageDependency2(packageDependencyId, rank, options, packageDependencyContext, packageFullName) {
    packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

    packageDependencyContextMarshal := packageDependencyContext is VarRef ? "ptr*" : "ptr"
    packageFullNameMarshal := packageFullName is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\AddPackageDependency2", "ptr", packageDependencyId, "int", rank, AddPackageDependencyOptions2, options, packageDependencyContextMarshal, packageDependencyContext, packageFullNameMarshal, packageFullName, "HRESULT")
    return result
}

/**
 * Removes a resolved package dependency from the current process' package graph (that is, a run-time reference for a framework package dependency that was added by using the AddPackageDependency function).
 * @remarks
 * This function does not unload loaded resources such as DLLs. After removing a package dependency, any files loaded from the package can continue
 * to be used. Future file resolution will fail to see the removed package dependency.
 * @param {PACKAGEDEPENDENCY_CONTEXT} packageDependencyContext Type: <b>PACKAGEDEPENDENCY_CONTEXT</b>
 * 
 * The handle of the package dependency to remove.
 * @returns {HRESULT} Type: <b>HRESULT</b>
 * 
 * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
 * 
 * | Return code | Description |
 * |-------------|-------------|
 * | E_INVALIDARG | The *packageDependencyContext* parameter is NULL on input. |
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-removepackagedependency
 */
export RemovePackageDependency(packageDependencyContext) {
    result := DllCall("KERNELBASE.dll\RemovePackageDependency", PACKAGEDEPENDENCY_CONTEXT, packageDependencyContext, "HRESULT")
    return result
}

/**
 * Returns the package full name that would be used if the package dependency were to be resolved. This function does not add the package to the process graph.
 * @remarks
 * To add the package to the invoking process' package graph, use the [AddPackageDependency](nf-appmodel-addpackagedependency.md) function.
 * @param {PWSTR} packageDependencyId Type: <b>PCWSTR</b>
 * 
 * The ID of the package dependency to be resolved. This parameter must match a package dependency defined by using the [TryCreatePackageDependency](nf-appmodel-trycreatepackagedependency.md) function for the calling user or the system (via the [CreatePackageDependencyOptions_ScopeIsSystem](ne-appmodel-createpackagedependencyoptions.md) option), or else an error is returned.
 * @returns {PWSTR} Type: <b>PCWSTR*</b>
 * 
 * The full name of the package to which the dependency has been resolved. If the package dependency cannot be resolved, the function succeeds but this parameter is **nullptr** on output. Use the [HeapAlloc](/windows/win32/api/heapapi/nf-heapapi-heapalloc) function to allocate memory for this parameter, and use [HeapFree](/windows/win32/api/heapapi/nf-heapapi-heapfree) to deallocate the memory.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getresolvedpackagefullnameforpackagedependency
 */
export GetResolvedPackageFullNameForPackageDependency(packageDependencyId) {
    packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

    result := DllCall("KERNELBASE.dll\GetResolvedPackageFullNameForPackageDependency", "ptr", packageDependencyId, PWSTR.Ptr, &packageFullName := 0, "HRESULT")
    return packageFullName
}

/**
 * 
 * @param {PWSTR} packageDependencyId 
 * @returns {PWSTR} 
 */
export GetResolvedPackageFullNameForPackageDependency2(packageDependencyId) {
    packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\GetResolvedPackageFullNameForPackageDependency2", "ptr", packageDependencyId, PWSTR.Ptr, &packageFullName := 0, "HRESULT")
    return packageFullName
}

/**
 * Returns the package dependency for the specified context handle.
 * @param {PACKAGEDEPENDENCY_CONTEXT} packageDependencyContext Type: <b>PACKAGEDEPENDENCY_CONTEXT</b>
 * 
 * The handle of the package dependency to return.
 * @returns {PWSTR} Type: <b>PCWSTR*</b>
 * 
 * The ID of the package dependency for the specified context handle. If the package dependency cannot be resolved, the function succeeds but this parameter is **nullptr** on output. Use the [HeapAlloc](/windows/win32/api/heapapi/nf-heapapi-heapalloc) function to allocate memory for this parameter, and use [HeapFree](/windows/win32/api/heapapi/nf-heapapi-heapfree) to deallocate the memory.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-getidforpackagedependencycontext
 */
export GetIdForPackageDependencyContext(packageDependencyContext) {
    result := DllCall("KERNELBASE.dll\GetIdForPackageDependencyContext", PACKAGEDEPENDENCY_CONTEXT, packageDependencyContext, PWSTR.Ptr, &packageDependencyId := 0, "HRESULT")
    return packageDependencyId
}

/**
 * 
 * @returns {Integer} 
 */
export GetPackageGraphRevisionId() {
    result := DllCall("api-ms-win-appmodel-runtime-l1-1-6.dll\GetPackageGraphRevisionId", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<FindPackageDependencyCriteria>} _findPackageDependencyCriteria 
 * @param {Pointer<Integer>} packageDependencyIdsCount 
 * @param {Pointer<Pointer<PWSTR>>} packageDependencyIds 
 * @returns {HRESULT} 
 */
export FindPackageDependency(_findPackageDependencyCriteria, packageDependencyIdsCount, packageDependencyIds) {
    packageDependencyIdsCountMarshal := packageDependencyIdsCount is VarRef ? "uint*" : "ptr"
    packageDependencyIdsMarshal := packageDependencyIds is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\FindPackageDependency", FindPackageDependencyCriteria.Ptr, _findPackageDependencyCriteria, packageDependencyIdsCountMarshal, packageDependencyIdsCount, packageDependencyIdsMarshal, packageDependencyIds, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} packageDependencyId 
 * @param {Pointer<PSID>} user 
 * @param {Pointer<PWSTR>} packageFamilyName 
 * @param {Pointer<PACKAGE_VERSION>} minVersion 
 * @param {Pointer<PackageDependencyProcessorArchitectures>} _packageDependencyProcessorArchitectures 
 * @param {Pointer<PackageDependencyLifetimeKind>} lifetimeKind 
 * @param {Pointer<PWSTR>} lifetimeArtifact 
 * @param {Pointer<CreatePackageDependencyOptions>} options 
 * @param {Pointer<FILETIME>} lifetimeExpiration 
 * @returns {HRESULT} 
 */
export GetPackageDependencyInformation(packageDependencyId, user, packageFamilyName, minVersion, _packageDependencyProcessorArchitectures, lifetimeKind, lifetimeArtifact, options, lifetimeExpiration) {
    packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

    userMarshal := user is VarRef ? "ptr*" : "ptr"
    packageFamilyNameMarshal := packageFamilyName is VarRef ? "ptr*" : "ptr"
    _packageDependencyProcessorArchitecturesMarshal := _packageDependencyProcessorArchitectures is VarRef ? "int*" : "ptr"
    lifetimeKindMarshal := lifetimeKind is VarRef ? "int*" : "ptr"
    lifetimeArtifactMarshal := lifetimeArtifact is VarRef ? "ptr*" : "ptr"
    optionsMarshal := options is VarRef ? "int*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\GetPackageDependencyInformation", "ptr", packageDependencyId, userMarshal, user, packageFamilyNameMarshal, packageFamilyName, PACKAGE_VERSION.Ptr, minVersion, _packageDependencyProcessorArchitecturesMarshal, _packageDependencyProcessorArchitectures, lifetimeKindMarshal, lifetimeKind, lifetimeArtifactMarshal, lifetimeArtifact, optionsMarshal, options, FILETIME.Ptr, lifetimeExpiration, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} packageDependencyId 
 * @param {PSID} user 
 * @param {BOOL} scopeIsSystem 
 * @param {Pointer<Integer>} processIdsCount 
 * @param {Pointer<Pointer<Integer>>} processIds 
 * @returns {HRESULT} 
 */
export GetProcessesUsingPackageDependency(packageDependencyId, user, scopeIsSystem, processIdsCount, processIds) {
    packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

    processIdsCountMarshal := processIdsCount is VarRef ? "uint*" : "ptr"
    processIdsMarshal := processIds is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\GetProcessesUsingPackageDependency", "ptr", packageDependencyId, PSID, user, BOOL, scopeIsSystem, processIdsCountMarshal, processIdsCount, processIdsMarshal, processIds, "HRESULT")
    return result
}

/**
 * Retrieves a value indicating whether a process can be suspended/resumed by the Process Lifecycle Manager (PLM).
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyLifecycleManagement>} policy A pointer to a variable of the <a href="../appmodel/ne-appmodel-apppolicylifecyclemanagement.md">AppPolicyLifecycleManagement</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating whether the identified process is lifecycle-managed or not.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known lifecycle management policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetlifecyclemanagement
 */
export AppPolicyGetLifecycleManagement(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetLifecycleManagement", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * Retrieves a value indicating whether a process uses a CoreWindow-based, or a HWND-based, windowing model. You can use the value to decide how to register for window state change notifications (size changed, visibility changed, etc.).
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyWindowingModel>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicywindowingmodel">AppPolicyWindowingModel</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating the windowing model of the identified process.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known windowing model policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetwindowingmodel
 */
export AppPolicyGetWindowingModel(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetWindowingModel", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * Retrieves a value indicating whether a process’s policy allows it to load non-Windows (third-party) plugins. You can use the value to decide whether or not to allow non-Windows (third-party) plugins.
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyMediaFoundationCodecLoading>} policy A pointer to a variable of the <a href="../appmodel/ne-appmodel-apppolicymediafoundationcodecloading.md">AppPolicyMediaFoundationCodecLoading</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating the codec-loading policy of the identified process.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known codec-loading policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetmediafoundationcodecloading
 */
export AppPolicyGetMediaFoundationCodecLoading(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetMediaFoundationCodecLoading", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * Retrieves a value indicating the application type of a process so that you can determine whether to enable private reflection and/or make managed objects agile.
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyClrCompat>} policy A pointer to a variable of the <a href="../appmodel/ne-appmodel-apppolicyclrcompat.md">AppPolicyClrCompat</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating the application type of the identified process.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known application type was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetclrcompat
 */
export AppPolicyGetClrCompat(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetClrCompat", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * Retrieves the kind of initialization that should be automatically performed for a process when beginthread[ex] creates a thread.
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyThreadInitializationType>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicythreadinitializationtype">AppPolicyThreadInitializationType</a> enumerated type. When the function returns successfully, the variable contains a value indicating the kind of initialization that should be automatically performed for the process when beginthread[ex] creates a thread.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known thread initialization policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetthreadinitializationtype
 */
export AppPolicyGetThreadInitializationType(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetThreadInitializationType", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * Retrieves the method used for a process to surface developer information, such as asserts, to the user.
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyShowDeveloperDiagnostic>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicyshowdeveloperdiagnostic">AppPolicyShowDeveloperDiagnostic</a> enumerated type. When the function returns successfully, the variable contains a value indicating the method used for the process to surface developer information, such as asserts, to the user.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known developer information  policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetshowdeveloperdiagnostic
 */
export AppPolicyGetShowDeveloperDiagnostic(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetShowDeveloperDiagnostic", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * Retrieves the method used to end a process.
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyProcessTerminationMethod>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicyprocessterminationmethod">AppPolicyProcessTerminationMethod</a> enumerated type. When the function returns successfully, the variable contains a value indicating the method used to end the process.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known process termination policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetprocessterminationmethod
 */
export AppPolicyGetProcessTerminationMethod(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetProcessTerminationMethod", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * Retrieves a value indicating whether a process has full or restricted access to the IO devices (file, file stream, directory, physical disk, volume, console buffer, tape drive, communications resource, mailslot, and pipe).
 * @param {HANDLE} processToken A handle that identifies the access token for a process.
 * @param {Pointer<AppPolicyCreateFileAccess>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicycreatefileaccess">AppPolicyCreateFileAccess</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating whether the process has full or restricted access to the IO devices.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 
 * If no known create file access policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
 * 
 * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetcreatefileaccess
 */
export AppPolicyGetCreateFileAccess(processToken, policy) {
    policyMarshal := policy is VarRef ? "int*" : "ptr"

    result := DllCall("KERNEL32.dll\AppPolicyGetCreateFileAccess", HANDLE, processToken, policyMarshal, policy, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PWSTR} packageFamilyName 
 * @returns {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} 
 */
export CreatePackageVirtualizationContext(packageFamilyName) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    result := DllCall("KERNEL32.dll\CreatePackageVirtualizationContext", "ptr", packageFamilyName, PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE.Ptr, &_context := 0, "HRESULT")
    return _context
}

/**
 * 
 * @param {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} _context 
 * @returns {Pointer} 
 */
export ActivatePackageVirtualizationContext(_context) {
    result := DllCall("KERNEL32.dll\ActivatePackageVirtualizationContext", PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE, _context, "ptr*", &cookie := 0, "HRESULT")
    return cookie
}

/**
 * 
 * @param {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} _context 
 * @returns {String} Nothing - always returns an empty string
 */
export ReleasePackageVirtualizationContext(_context) {
    DllCall("KERNEL32.dll\ReleasePackageVirtualizationContext", PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE, _context)
}

/**
 * 
 * @param {Pointer} cookie 
 * @returns {String} Nothing - always returns an empty string
 */
export DeactivatePackageVirtualizationContext(cookie) {
    DllCall("KERNEL32.dll\DeactivatePackageVirtualizationContext", "ptr", cookie)
}

/**
 * 
 * @param {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} sourceContext 
 * @returns {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} 
 */
export DuplicatePackageVirtualizationContext(sourceContext) {
    result := DllCall("KERNEL32.dll\DuplicatePackageVirtualizationContext", PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE, sourceContext, PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE.Ptr, &destContext := 0, "HRESULT")
    return destContext
}

/**
 * 
 * @returns {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} 
 */
export GetCurrentPackageVirtualizationContext() {
    result := DllCall("KERNEL32.dll\GetCurrentPackageVirtualizationContext", PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE)
    return result
}

/**
 * 
 * @param {PWSTR} packageFamilyName 
 * @param {Pointer<Integer>} count 
 * @param {Pointer<Pointer<HANDLE>>} processes 
 * @returns {HRESULT} 
 */
export GetProcessesInVirtualizationContext(packageFamilyName, count, processes) {
    packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

    countMarshal := count is VarRef ? "uint*" : "ptr"
    processesMarshal := processes is VarRef ? "ptr*" : "ptr"

    result := DllCall("KERNEL32.dll\GetProcessesInVirtualizationContext", "ptr", packageFamilyName, countMarshal, count, processesMarshal, processes, "HRESULT")
    return result
}

/**
 * Retrieves the package graph's current generation ID.
 * @remarks
 * This function does not have an associated header file or library file. Your application can call [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) with the DLL name (`Kernel32.dll`) to obtain a module handle. It can then call [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) with the module handle and the name of this function to get the function address.
 * @param {Integer} flags Type: **const UINT32**
 * 
 * The [package constants](/windows/desktop/appxpkg/package-constants) that specify how package information is retrieved. The **PACKAGE_FILTER_\*** flags are supported.
 * @param {PackageInfo3Type} packageInfoType Type: **PackageInfo3Type**
 * 
 * ```cpp
 * enum PackageInfo3Type
 * {
 * 	PackageInfo3Type_PackageInfoGeneration = 16,
 * } PackageInfoType;
 * ```
 * 
 * Declare **PackageInfo3Type** as shown above, and pass **PackageInfo3Type::PackageInfo3Type_PackageInfoGeneration**.
 * @param {Pointer<Integer>} bufferLength Type: **UINT32\***
 * 
 * On input, the size of <i>buffer</i>, in bytes. On output, the size of the array of structures returned, in bytes.
 * @param {Integer} _buffer Type: **BYTE\***
 * 
 * The package graph's current generation ID, represented as an array of <a href="https://docs.microsoft.com/windows/win32/api/appmodel/ns-appmodel-package_info">PACKAGE_INFO</a> structures.
 * @returns {Integer} Type: **UINT32\***
 * 
 * The number of structures in the buffer.
 * @see https://learn.microsoft.com/windows/win32/appxpkg/appmodel/nf-appmodel-getcurrentpackageinfo3
 */
export GetCurrentPackageInfo3(flags, packageInfoType, bufferLength, _buffer) {
    bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

    result := DllCall("KERNEL32.dll\GetCurrentPackageInfo3", "uint", flags, PackageInfo3Type, packageInfoType, bufferLengthMarshal, bufferLength, "ptr", _buffer, "uint*", &count := 0, "HRESULT")
    return count
}

;@endregion Functions
