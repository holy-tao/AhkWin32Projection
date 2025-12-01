#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class Appx {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FULL_NAME_MIN_LENGTH => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FULL_NAME_MAX_LENGTH => 127

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FAMILY_NAME_MIN_LENGTH => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FAMILY_NAME_MAX_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_GRAPH_MAX_SIZE => 641

    /**
     * @type {Integer (UInt32)}
     */
    static APPLICATION_USER_MODEL_ID_MIN_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static APPLICATION_USER_MODEL_ID_MAX_LENGTH => 130

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_FRAMEWORK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_RESOURCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_BUNDLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_OPTIONAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_HEAD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_DIRECT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_RESOURCE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_BUNDLE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_INFORMATION_BASIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_INFORMATION_FULL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_DEVELOPMENT_MODE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_OPTIONAL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_IS_IN_RELATED_SET => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_IS_IN_RELATED_SET => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_STATIC => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_STATIC => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_DYNAMIC => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_DYNAMIC => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PROPERTY_HOSTRUNTIME => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_HOSTRUNTIME => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FILTER_ALL_LOADED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_DEPENDENCY_RANK_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_ARCHITECTURE_MIN_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_ARCHITECTURE_MAX_LENGTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_VERSION_MIN_LENGTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_VERSION_MAX_LENGTH => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_NAME_MIN_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_NAME_MAX_LENGTH => 50

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PUBLISHER_MIN_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PUBLISHER_MAX_LENGTH => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PUBLISHERID_MIN_LENGTH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_PUBLISHERID_MAX_LENGTH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_RESOURCEID_MIN_LENGTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_RESOURCEID_MAX_LENGTH => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_MIN_DEPENDENCIES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_MAX_DEPENDENCIES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FAMILY_MIN_RESOURCE_PACKAGES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_FAMILY_MAX_RESOURCE_PACKAGES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_GRAPH_MIN_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_APPLICATIONS_MIN_COUNT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_APPLICATIONS_MAX_COUNT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_RELATIVE_APPLICATION_ID_MIN_LENGTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PACKAGE_RELATIVE_APPLICATION_ID_MAX_LENGTH => 65
;@endregion Constants

;@region Methods
    /**
     * Gets the package identifier (ID) for the calling process.
     * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
     * 
     * On input, the size of <i>buffer</i>, in bytes. On output, the size of the structure returned, in bytes.
     * @param {Pointer} buffer_R 
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetCurrentPackageId(bufferLength, buffer_R) {
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetCurrentPackageId", bufferLengthMarshal, bufferLength, "ptr", buffer_R, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetCurrentPackageFullName(packageFullNameLength, packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetCurrentPackageFullName", packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetCurrentPackageFamilyName(packageFamilyNameLength, packageFamilyName) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetCurrentPackageFamilyName", packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, "uint")
        return result
    }

    /**
     * Gets the package path for the calling process. (GetCurrentPackagePath)
     * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
     * 
     * On input, the size of the <i>path</i> buffer, in characters. On output, the size of the package path returned, in characters, including the null terminator.
     * @param {PWSTR} path Type: <b>PWSTR</b>
     * 
     * The package path.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetCurrentPackagePath(pathLength, path) {
        path := path is String ? StrPtr(path) : path

        pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetCurrentPackagePath", pathLengthMarshal, pathLength, "ptr", path, "uint")
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
     * @param {Pointer} buffer_R 
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackageId(hProcess, bufferLength, buffer_R) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackageId", "ptr", hProcess, bufferLengthMarshal, bufferLength, "ptr", buffer_R, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackageFullName(hProcess, packageFullNameLength, packageFullName) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackageFullName", "ptr", hProcess, packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, "uint")
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
     * @returns {Integer} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function 
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
    static GetPackageFullNameFromToken(token, packageFullNameLength, packageFullName) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetPackageFullNameFromToken", "ptr", token, packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackageFamilyName(hProcess, packageFamilyNameLength, packageFamilyName) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackageFamilyName", "ptr", hProcess, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackageFamilyNameFromToken(token, packageFamilyNameLength, packageFamilyName) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetPackageFamilyNameFromToken", "ptr", token, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, "uint")
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
     * @param {PWSTR} path Type: <b>PWSTR</b>
     * 
     * The package path.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackagePath(packageId, pathLength, path) {
        static reserved := 0 ;Reserved parameters must always be NULL

        path := path is String ? StrPtr(path) : path

        pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackagePath", "ptr", packageId, "uint", reserved, pathLengthMarshal, pathLength, "ptr", path, "uint")
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
     * @param {PWSTR} path Type: <b>PWSTR</b>
     * 
     * A pointer to memory space that receives  the package path string, which includes the null-terminator.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackagePathByFullName(packageFullName, pathLength, path) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        path := path is String ? StrPtr(path) : path

        pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackagePathByFullName", "ptr", packageFullName, pathLengthMarshal, pathLength, "ptr", path, "uint")
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
     * @param {PWSTR} path Type: <b>PWSTR</b>
     * 
     * A pointer to memory space that receives  the package path string, which includes the null-terminator.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetStagedPackagePathByFullName(packageFullName, pathLength, path) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        path := path is String ? StrPtr(path) : path

        pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetStagedPackagePathByFullName", "ptr", packageFullName, pathLengthMarshal, pathLength, "ptr", path, "uint")
        return result
    }

    /**
     * Gets the path of the specified package. (GetPackagePathByFullName2)
     * @remarks
     * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
     * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
     * 
     * The full name of the package.
     * @param {Integer} packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
     * 
     * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
     * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
     * 
     * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package path string, which includes the null-terminator. 
     * 
     * First you pass <b>NULL</b> to <i>path</i> to get the number of characters. You use this number to allocate memory space for <i>path</i>. Then you pass the address of this memory space to fill <i>path</i>.
     * @param {PWSTR} path Type: <b>PWSTR</b>
     * 
     * A pointer to memory space that receives  the package path string, which includes the null-terminator.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackagePathByFullName2(packageFullName, packagePathType, pathLength, path) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        path := path is String ? StrPtr(path) : path

        pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetPackagePathByFullName2", "ptr", packageFullName, "int", packagePathType, pathLengthMarshal, pathLength, "ptr", path, "uint")
        return result
    }

    /**
     * Gets the path of the specified staged package. (GetStagedPackagePathByFullName2)
     * @remarks
     * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
     * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
     * 
     * The full name of the staged package.
     * @param {Integer} packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
     * 
     * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
     * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
     * 
     * A pointer to a variable that holds the number of characters (<b>WCHAR</b>s) in the package path string, which includes the null-terminator. 
     * 
     * First you pass <b>NULL</b> to <i>path</i> to get the number of characters. You use this number to allocate memory space for <i>path</i>. Then you pass the address of this memory space to fill <i>path</i>.
     * @param {PWSTR} path Type: <b>PWSTR</b>
     * 
     * A pointer to memory space that receives  the package path string, which includes the null-terminator.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetStagedPackagePathByFullName2(packageFullName, packagePathType, pathLength, path) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        path := path is String ? StrPtr(path) : path

        pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetStagedPackagePathByFullName2", "ptr", packageFullName, "int", packagePathType, pathLengthMarshal, pathLength, "ptr", path, "uint")
        return result
    }

    /**
     * Gets the package information for the calling process. (GetCurrentPackageInfo2)
     * @remarks
     * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
     * @param {Integer} flags Type: <b>const UINT32</b>
     * 
     * The [package constants](/windows/desktop/appxpkg/package-constants) that specify how package information is retrieved. The <b>PACKAGE_FILTER_*</b> flags are supported.
     * @param {Integer} packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
     * 
     * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
     * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
     * 
     * On input, the size of <i>buffer</i>, in bytes. On output, the size of the array of structures returned, in bytes.
     * @param {Pointer} buffer_R 
     * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
     * 
     * The number of structures in the buffer.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetCurrentPackageInfo2(flags, packagePathType, bufferLength, buffer_R, count) {
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetCurrentPackageInfo2", "uint", flags, "int", packagePathType, bufferLengthMarshal, bufferLength, "ptr", buffer_R, countMarshal, count, "uint")
        return result
    }

    /**
     * Gets the package path for the calling process. (GetCurrentPackagePath2)
     * @remarks
     * The *packagePathType* parameter is useful for applications that use the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in their package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
     * @param {Integer} packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
     * 
     * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
     * @param {Pointer<Integer>} pathLength Type: <b>UINT32*</b>
     * 
     * On input, the size of the <i>path</i> buffer, in characters. On output, the size of the package path returned, in characters, including the null terminator.
     * @param {PWSTR} path Type: <b>PWSTR</b>
     * 
     * The package path.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetCurrentPackagePath2(packagePathType, pathLength, path) {
        path := path is String ? StrPtr(path) : path

        pathLengthMarshal := pathLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetCurrentPackagePath2", "int", packagePathType, pathLengthMarshal, pathLength, "ptr", path, "uint")
        return result
    }

    /**
     * Gets the application user model ID for the current process.
     * @remarks
     * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
     * @param {Pointer<Integer>} applicationUserModelIdLength On input, the size of the  <i>applicationUserModelId</i> buffer, in wide characters. On success, the size of the buffer used, including the null terminator.
     * @param {PWSTR} applicationUserModelId A pointer to a buffer that receives the application user model ID.
     * @returns {Integer} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
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
    static GetCurrentApplicationUserModelId(applicationUserModelIdLength, applicationUserModelId) {
        applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

        applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetCurrentApplicationUserModelId", applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, "uint")
        return result
    }

    /**
     * Gets the application user model ID for the specified process.
     * @remarks
     * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more info, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Integer>} applicationUserModelIdLength On input, the size of the  <i>applicationUserModelId</i> buffer, in wide characters. On success, the size of the buffer used, including the null terminator.
     * @param {PWSTR} applicationUserModelId A pointer to a buffer that receives the application user model ID.
     * @returns {Integer} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
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
    static GetApplicationUserModelId(hProcess, applicationUserModelIdLength, applicationUserModelId) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

        applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetApplicationUserModelId", "ptr", hProcess, applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, "uint")
        return result
    }

    /**
     * Gets the application user model ID for the specified token.
     * @remarks
     * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
     * @param {HANDLE} token A token that contains the application identity. This handle must have the <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more info, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Integer>} applicationUserModelIdLength On input, the size of the  <i>applicationUserModelId</i> buffer, in wide characters. On success, the size of the buffer used, including the null terminator.
     * @param {PWSTR} applicationUserModelId A pointer to a buffer that receives the application user model ID.
     * @returns {Integer} If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code. The possible error codes include the following.
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
    static GetApplicationUserModelIdFromToken(token, applicationUserModelIdLength, applicationUserModelId) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token
        applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

        applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetApplicationUserModelIdFromToken", "ptr", token, applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {Integer} 
     */
    static VerifyPackageFullName(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageFullName", "ptr", packageFullName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFamilyName 
     * @returns {Integer} 
     */
    static VerifyPackageFamilyName(packageFamilyName) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageFamilyName", "ptr", packageFamilyName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PACKAGE_ID>} packageId 
     * @returns {Integer} 
     */
    static VerifyPackageId(packageId) {
        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageId", "ptr", packageId, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} applicationUserModelId 
     * @returns {Integer} 
     */
    static VerifyApplicationUserModelId(applicationUserModelId) {
        applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyApplicationUserModelId", "ptr", applicationUserModelId, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageRelativeApplicationId 
     * @returns {Integer} 
     */
    static VerifyPackageRelativeApplicationId(packageRelativeApplicationId) {
        packageRelativeApplicationId := packageRelativeApplicationId is String ? StrPtr(packageRelativeApplicationId) : packageRelativeApplicationId

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\VerifyPackageRelativeApplicationId", "ptr", packageRelativeApplicationId, "uint")
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
     * @param {Pointer} buffer_R 
     * @returns {Integer} Type: <b>LONG</b>
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
    static PackageIdFromFullName(packageFullName, flags, bufferLength, buffer_R) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\PackageIdFromFullName", "ptr", packageFullName, "uint", flags, bufferLengthMarshal, bufferLength, "ptr", buffer_R, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static PackageFullNameFromId(packageId, packageFullNameLength, packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        packageFullNameLengthMarshal := packageFullNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\PackageFullNameFromId", "ptr", packageId, packageFullNameLengthMarshal, packageFullNameLength, "ptr", packageFullName, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static PackageFamilyNameFromId(packageId, packageFamilyNameLength, packageFamilyName) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\PackageFamilyNameFromId", "ptr", packageId, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static PackageFamilyNameFromFullName(packageFullName, packageFamilyNameLength, packageFamilyName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\PackageFamilyNameFromFullName", "ptr", packageFullName, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static PackageNameAndPublisherIdFromFamilyName(packageFamilyName, packageNameLength, packageName, packagePublisherIdLength, packagePublisherId) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
        packageName := packageName is String ? StrPtr(packageName) : packageName
        packagePublisherId := packagePublisherId is String ? StrPtr(packagePublisherId) : packagePublisherId

        packageNameLengthMarshal := packageNameLength is VarRef ? "uint*" : "ptr"
        packagePublisherIdLengthMarshal := packagePublisherIdLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\PackageNameAndPublisherIdFromFamilyName", "ptr", packageFamilyName, packageNameLengthMarshal, packageNameLength, "ptr", packageName, packagePublisherIdLengthMarshal, packagePublisherIdLength, "ptr", packagePublisherId, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static FormatApplicationUserModelId(packageFamilyName, packageRelativeApplicationId, applicationUserModelIdLength, applicationUserModelId) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
        packageRelativeApplicationId := packageRelativeApplicationId is String ? StrPtr(packageRelativeApplicationId) : packageRelativeApplicationId
        applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId

        applicationUserModelIdLengthMarshal := applicationUserModelIdLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\FormatApplicationUserModelId", "ptr", packageFamilyName, "ptr", packageRelativeApplicationId, applicationUserModelIdLengthMarshal, applicationUserModelIdLength, "ptr", applicationUserModelId, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static ParseApplicationUserModelId(applicationUserModelId, packageFamilyNameLength, packageFamilyName, packageRelativeApplicationIdLength, packageRelativeApplicationId) {
        applicationUserModelId := applicationUserModelId is String ? StrPtr(applicationUserModelId) : applicationUserModelId
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
        packageRelativeApplicationId := packageRelativeApplicationId is String ? StrPtr(packageRelativeApplicationId) : packageRelativeApplicationId

        packageFamilyNameLengthMarshal := packageFamilyNameLength is VarRef ? "uint*" : "ptr"
        packageRelativeApplicationIdLengthMarshal := packageRelativeApplicationIdLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\ParseApplicationUserModelId", "ptr", applicationUserModelId, packageFamilyNameLengthMarshal, packageFamilyNameLength, "ptr", packageFamilyName, packageRelativeApplicationIdLengthMarshal, packageRelativeApplicationIdLength, "ptr", packageRelativeApplicationId, "uint")
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
     * @param {PWSTR} buffer_R 
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackagesByPackageFamily(packageFamilyName, count, packageFullNames, bufferLength, buffer_R) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
        buffer_R := buffer_R is String ? StrPtr(buffer_R) : buffer_R

        countMarshal := count is VarRef ? "uint*" : "ptr"
        packageFullNamesMarshal := packageFullNames is VarRef ? "ptr*" : "ptr"
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackagesByPackageFamily", "ptr", packageFamilyName, countMarshal, count, packageFullNamesMarshal, packageFullNames, bufferLengthMarshal, bufferLength, "ptr", buffer_R, "uint")
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
     * @param {PWSTR} buffer_R 
     * @param {Pointer<Integer>} packageProperties Type: <b>UINT32*</b>
     * 
     * A pointer to memory space that receives  the <a href="https://docs.microsoft.com/windows/desktop/appxpkg/package-constants">package properties</a> for all of the packages that were found.
     * @returns {Integer} Type: <b>LONG</b>
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
    static FindPackagesByPackageFamily(packageFamilyName, packageFilters, count, packageFullNames, bufferLength, buffer_R, packageProperties) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
        buffer_R := buffer_R is String ? StrPtr(buffer_R) : buffer_R

        countMarshal := count is VarRef ? "uint*" : "ptr"
        packageFullNamesMarshal := packageFullNames is VarRef ? "ptr*" : "ptr"
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
        packagePropertiesMarshal := packageProperties is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\FindPackagesByPackageFamily", "ptr", packageFamilyName, "uint", packageFilters, countMarshal, count, packageFullNamesMarshal, packageFullNames, bufferLengthMarshal, bufferLength, "ptr", buffer_R, packagePropertiesMarshal, packageProperties, "uint")
        return result
    }

    /**
     * Gets the origin of the specified package.
     * @param {PWSTR} packageFullName Type: <b>PCWSTR</b>
     * 
     * The full name of the package.
     * @param {Pointer<Integer>} origin Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-packageorigin">PackageOrigin</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-packageorigin">PackageOrigin</a>-typed value that indicates the origin of the package specified by <i>packageFullName</i>.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetStagedPackageOrigin(packageFullName, origin) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        originMarshal := origin is VarRef ? "int*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\GetStagedPackageOrigin", "ptr", packageFullName, originMarshal, origin, "uint")
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
     * @param {Pointer} buffer_R 
     * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
     * 
     * The number of structures in the buffer.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetCurrentPackageInfo(flags, bufferLength, buffer_R, count) {
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetCurrentPackageInfo", "uint", flags, bufferLengthMarshal, bufferLength, "ptr", buffer_R, countMarshal, count, "uint")
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
     * @returns {Integer} Type: <b>LONG</b>
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
    static OpenPackageInfoByFullName(packageFullName, packageInfoReference) {
        static reserved := 0 ;Reserved parameters must always be NULL

        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        packageInfoReferenceMarshal := packageInfoReference is VarRef ? "ptr*" : "ptr"

        result := DllCall("KERNEL32.dll\OpenPackageInfoByFullName", "ptr", packageFullName, "uint", reserved, packageInfoReferenceMarshal, packageInfoReference, "uint")
        return result
    }

    /**
     * 
     * @param {PSID} userSid 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<Pointer<_PACKAGE_INFO_REFERENCE>>} packageInfoReference 
     * @returns {Integer} 
     */
    static OpenPackageInfoByFullNameForUser(userSid, packageFullName, packageInfoReference) {
        static reserved := 0 ;Reserved parameters must always be NULL

        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        packageInfoReferenceMarshal := packageInfoReference is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-1.dll\OpenPackageInfoByFullNameForUser", "ptr", userSid, "ptr", packageFullName, "uint", reserved, packageInfoReferenceMarshal, packageInfoReference, "uint")
        return result
    }

    /**
     * Closes a reference to the specified package information.
     * @param {Pointer<_PACKAGE_INFO_REFERENCE>} packageInfoReference Type: <b>PACKAGE_INFO_REFERENCE</b>
     * 
     * A reference to package information.
     * @returns {Integer} Type: <b>LONG</b>
     * 
     * If the function succeeds it returns <b>ERROR_SUCCESS</b>. Otherwise, the function returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-closepackageinfo
     * @since windows8.0
     */
    static ClosePackageInfo(packageInfoReference) {
        result := DllCall("KERNEL32.dll\ClosePackageInfo", "ptr", packageInfoReference, "uint")
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
     * @param {Pointer} buffer_R 
     * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
     * 
     * The number of packages in the buffer.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackageInfo(packageInfoReference, flags, bufferLength, buffer_R, count) {
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackageInfo", "ptr", packageInfoReference, "uint", flags, bufferLengthMarshal, bufferLength, "ptr", buffer_R, countMarshal, count, "uint")
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
     * @param {Pointer} buffer_R 
     * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
     * 
     * A pointer to a variable that receives the number of app IDs in <i>buffer</i>.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackageApplicationIds(packageInfoReference, bufferLength, buffer_R, count) {
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetPackageApplicationIds", "ptr", packageInfoReference, bufferLengthMarshal, bufferLength, "ptr", buffer_R, countMarshal, count, "uint")
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
     * @param {Integer} packagePathType Type: [**PackagePathType**](ne-appmodel-packagepathtype.md)
     * 
     * Indicates the type of folder path to retrieve for the package (the original install folder or the mutable folder).
     * @param {Pointer<Integer>} bufferLength Type: <b>UINT32*</b>
     * 
     * On input, the size of <i>buffer</i>, in bytes. On output, the size of the package information returned, in bytes.
     * @param {Pointer} buffer_R 
     * @param {Pointer<Integer>} count Type: <b>UINT32*</b>
     * 
     * The number of packages in the buffer.
     * @returns {Integer} Type: <b>LONG</b>
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
    static GetPackageInfo2(packageInfoReference, flags, packagePathType, bufferLength, buffer_R, count) {
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-3.dll\GetPackageInfo2", "ptr", packageInfoReference, "uint", flags, "int", packagePathType, bufferLengthMarshal, bufferLength, "ptr", buffer_R, countMarshal, count, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @returns {BOOL} 
     */
    static CheckIsMSIXPackage(packageFullName) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        result := DllCall("KERNEL32.dll\CheckIsMSIXPackage", "ptr", packageFullName, "int*", &isMSIXPackage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {Integer} packageDependencyProcessorArchitectures Type: <b><a href="ne-appmodel-packagedependencyprocessorarchitectures.md">PackageDependencyProcessorArchitectures</a></b>
     * 
     * The processor architectures of the package dependency.
     * @param {Integer} lifetimeKind Type: <b><a href="ne-appmodel-packagedependencylifetimekind.md">PackageDependencyLifetimeKind</a></b>
     * 
     * The type of artifact to use to define the lifetime of the package dependency. For more information, see the remarks.
     * @param {PWSTR} lifetimeArtifact Type: <b>PCWSTR</b>
     * 
     * The name of the artifact used to define the lifetime of the package dependency. Must be NULL if the *lifetimeKind* parameter is [PackageDependencyLifetimeKind_Process](ne-appmodel-packagedependencylifetimekind.md). For more information, see the remarks.
     * @param {Integer} options Type: <b><a href="ne-appmodel-createpackagedependencyoptions.md">CreatePackageDependencyOptions</a></b>
     * 
     * The options to apply when creating the package dependency.
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode string that specifies the ID of the new package dependency. The caller is responsible for freeing this resource once it is no longer needed by calling [HeapFree](/windows/win32/api/heapapi/nf-heapapi-heapfree).
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-trycreatepackagedependency
     */
    static TryCreatePackageDependency(user, packageFamilyName, minVersion, packageDependencyProcessorArchitectures, lifetimeKind, lifetimeArtifact, options) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
        lifetimeArtifact := lifetimeArtifact is String ? StrPtr(lifetimeArtifact) : lifetimeArtifact

        result := DllCall("KERNELBASE.dll\TryCreatePackageDependency", "ptr", user, "ptr", packageFamilyName, "ptr", minVersion, "int", packageDependencyProcessorArchitectures, "int", lifetimeKind, "ptr", lifetimeArtifact, "int", options, "ptr*", &packageDependencyId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return packageDependencyId
    }

    /**
     * 
     * @param {PSID} user 
     * @param {PWSTR} packageFamilyName 
     * @param {PACKAGE_VERSION} minVersion 
     * @param {Integer} packageDependencyProcessorArchitectures 
     * @param {Integer} lifetimeKind 
     * @param {PWSTR} lifetimeArtifact 
     * @param {Integer} options 
     * @param {Pointer<FILETIME>} lifetimeExpiration 
     * @returns {PWSTR} 
     */
    static TryCreatePackageDependency2(user, packageFamilyName, minVersion, packageDependencyProcessorArchitectures, lifetimeKind, lifetimeArtifact, options, lifetimeExpiration) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName
        lifetimeArtifact := lifetimeArtifact is String ? StrPtr(lifetimeArtifact) : lifetimeArtifact

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\TryCreatePackageDependency2", "ptr", user, "ptr", packageFamilyName, "ptr", minVersion, "int", packageDependencyProcessorArchitectures, "int", lifetimeKind, "ptr", lifetimeArtifact, "int", options, "ptr", lifetimeExpiration, "ptr*", &packageDependencyId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static DeletePackageDependency(packageDependencyId) {
        packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

        result := DllCall("KERNELBASE.dll\DeletePackageDependency", "ptr", packageDependencyId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {Integer} options Type: <b><a href="ne-appmodel-addpackagedependencyoptions.md">AddPackageDependencyOptions</a></b>
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
    static AddPackageDependency(packageDependencyId, rank, options, packageDependencyContext, packageFullName) {
        packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

        packageDependencyContextMarshal := packageDependencyContext is VarRef ? "ptr*" : "ptr"
        packageFullNameMarshal := packageFullName is VarRef ? "ptr*" : "ptr"

        result := DllCall("KERNELBASE.dll\AddPackageDependency", "ptr", packageDependencyId, "int", rank, "int", options, packageDependencyContextMarshal, packageDependencyContext, packageFullNameMarshal, packageFullName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} packageDependencyId 
     * @param {Integer} rank 
     * @param {Integer} options 
     * @param {Pointer<PACKAGEDEPENDENCY_CONTEXT>} packageDependencyContext 
     * @param {Pointer<PWSTR>} packageFullName 
     * @returns {HRESULT} 
     */
    static AddPackageDependency2(packageDependencyId, rank, options, packageDependencyContext, packageFullName) {
        packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

        packageDependencyContextMarshal := packageDependencyContext is VarRef ? "ptr*" : "ptr"
        packageFullNameMarshal := packageFullName is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\AddPackageDependency2", "ptr", packageDependencyId, "int", rank, "int", options, packageDependencyContextMarshal, packageDependencyContext, packageFullNameMarshal, packageFullName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static RemovePackageDependency(packageDependencyContext) {
        result := DllCall("KERNELBASE.dll\RemovePackageDependency", "ptr", packageDependencyContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static GetResolvedPackageFullNameForPackageDependency(packageDependencyId) {
        packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

        result := DllCall("KERNELBASE.dll\GetResolvedPackageFullNameForPackageDependency", "ptr", packageDependencyId, "ptr*", &packageFullName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return packageFullName
    }

    /**
     * 
     * @param {PWSTR} packageDependencyId 
     * @returns {PWSTR} 
     */
    static GetResolvedPackageFullNameForPackageDependency2(packageDependencyId) {
        packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\GetResolvedPackageFullNameForPackageDependency2", "ptr", packageDependencyId, "ptr*", &packageFullName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static GetIdForPackageDependencyContext(packageDependencyContext) {
        result := DllCall("KERNELBASE.dll\GetIdForPackageDependencyContext", "ptr", packageDependencyContext, "ptr*", &packageDependencyId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return packageDependencyId
    }

    /**
     * 
     * @returns {Integer} 
     */
    static GetPackageGraphRevisionId() {
        result := DllCall("api-ms-win-appmodel-runtime-l1-1-6.dll\GetPackageGraphRevisionId", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<FindPackageDependencyCriteria>} findPackageDependencyCriteria 
     * @param {Pointer<Integer>} packageDependencyIdsCount 
     * @param {Pointer<Pointer<PWSTR>>} packageDependencyIds 
     * @returns {HRESULT} 
     */
    static FindPackageDependency(findPackageDependencyCriteria, packageDependencyIdsCount, packageDependencyIds) {
        packageDependencyIdsCountMarshal := packageDependencyIdsCount is VarRef ? "uint*" : "ptr"
        packageDependencyIdsMarshal := packageDependencyIds is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\FindPackageDependency", "ptr", findPackageDependencyCriteria, packageDependencyIdsCountMarshal, packageDependencyIdsCount, packageDependencyIdsMarshal, packageDependencyIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} packageDependencyId 
     * @param {Pointer<PSID>} user 
     * @param {Pointer<PWSTR>} packageFamilyName 
     * @param {Pointer<PACKAGE_VERSION>} minVersion 
     * @param {Pointer<Integer>} packageDependencyProcessorArchitectures 
     * @param {Pointer<Integer>} lifetimeKind 
     * @param {Pointer<PWSTR>} lifetimeArtifact 
     * @param {Pointer<Integer>} options 
     * @param {Pointer<FILETIME>} lifetimeExpiration 
     * @returns {HRESULT} 
     */
    static GetPackageDependencyInformation(packageDependencyId, user, packageFamilyName, minVersion, packageDependencyProcessorArchitectures, lifetimeKind, lifetimeArtifact, options, lifetimeExpiration) {
        packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

        userMarshal := user is VarRef ? "ptr*" : "ptr"
        packageFamilyNameMarshal := packageFamilyName is VarRef ? "ptr*" : "ptr"
        packageDependencyProcessorArchitecturesMarshal := packageDependencyProcessorArchitectures is VarRef ? "int*" : "ptr"
        lifetimeKindMarshal := lifetimeKind is VarRef ? "int*" : "ptr"
        lifetimeArtifactMarshal := lifetimeArtifact is VarRef ? "ptr*" : "ptr"
        optionsMarshal := options is VarRef ? "int*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\GetPackageDependencyInformation", "ptr", packageDependencyId, userMarshal, user, packageFamilyNameMarshal, packageFamilyName, "ptr", minVersion, packageDependencyProcessorArchitecturesMarshal, packageDependencyProcessorArchitectures, lifetimeKindMarshal, lifetimeKind, lifetimeArtifactMarshal, lifetimeArtifact, optionsMarshal, options, "ptr", lifetimeExpiration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
    static GetProcessesUsingPackageDependency(packageDependencyId, user, scopeIsSystem, processIdsCount, processIds) {
        packageDependencyId := packageDependencyId is String ? StrPtr(packageDependencyId) : packageDependencyId

        processIdsCountMarshal := processIdsCount is VarRef ? "uint*" : "ptr"
        processIdsMarshal := processIds is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-appmodel-runtime-l1-1-7.dll\GetProcessesUsingPackageDependency", "ptr", packageDependencyId, "ptr", user, "int", scopeIsSystem, processIdsCountMarshal, processIdsCount, processIdsMarshal, processIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a value indicating whether a process can be suspended/resumed by the Process Lifecycle Manager (PLM).
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="../appmodel/ne-appmodel-apppolicylifecyclemanagement.md">AppPolicyLifecycleManagement</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating whether the identified process is lifecycle-managed or not.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known lifecycle management policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetlifecyclemanagement
     */
    static AppPolicyGetLifecycleManagement(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetLifecycleManagement", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * Retrieves a value indicating whether a process uses a CoreWindow-based, or a HWND-based, windowing model. You can use the value to decide how to register for window state change notifications (size changed, visibility changed, etc.).
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicywindowingmodel">AppPolicyWindowingModel</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating the windowing model of the identified process.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known windowing model policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetwindowingmodel
     */
    static AppPolicyGetWindowingModel(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetWindowingModel", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * Retrieves a value indicating whether a process’s policy allows it to load non-Windows (third-party) plugins. You can use the value to decide whether or not to allow non-Windows (third-party) plugins.
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="../appmodel/ne-appmodel-apppolicymediafoundationcodecloading.md">AppPolicyMediaFoundationCodecLoading</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating the codec-loading policy of the identified process.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known codec-loading policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetmediafoundationcodecloading
     */
    static AppPolicyGetMediaFoundationCodecLoading(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetMediaFoundationCodecLoading", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * Retrieves a value indicating the application type of a process so that you can determine whether to enable private reflection and/or make managed objects agile.
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="../appmodel/ne-appmodel-apppolicyclrcompat.md">AppPolicyClrCompat</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating the application type of the identified process.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known application type was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetclrcompat
     */
    static AppPolicyGetClrCompat(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetClrCompat", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * Retrieves the kind of initialization that should be automatically performed for a process when beginthread[ex] creates a thread.
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicythreadinitializationtype">AppPolicyThreadInitializationType</a> enumerated type. When the function returns successfully, the variable contains a value indicating the kind of initialization that should be automatically performed for the process when beginthread[ex] creates a thread.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known thread initialization policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetthreadinitializationtype
     */
    static AppPolicyGetThreadInitializationType(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetThreadInitializationType", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * Retrieves the method used for a process to surface developer information, such as asserts, to the user.
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicyshowdeveloperdiagnostic">AppPolicyShowDeveloperDiagnostic</a> enumerated type. When the function returns successfully, the variable contains a value indicating the method used for the process to surface developer information, such as asserts, to the user.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known developer information  policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetshowdeveloperdiagnostic
     */
    static AppPolicyGetShowDeveloperDiagnostic(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetShowDeveloperDiagnostic", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * Retrieves the method used to end a process.
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicyprocessterminationmethod">AppPolicyProcessTerminationMethod</a> enumerated type. When the function returns successfully, the variable contains a value indicating the method used to end the process.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known process termination policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetprocessterminationmethod
     */
    static AppPolicyGetProcessTerminationMethod(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetProcessTerminationMethod", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * Retrieves a value indicating whether a process has full or restricted access to the IO devices (file, file stream, directory, physical disk, volume, console buffer, tape drive, communications resource, mailslot, and pipe).
     * @param {HANDLE} processToken A handle that identifies the access token for a process.
     * @param {Pointer<Integer>} policy A pointer to a variable of the <a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ne-appmodel-apppolicycreatefileaccess">AppPolicyCreateFileAccess</a> enumerated type. When the function returns successfully, the variable contains an enumerated constant value indicating whether the process has full or restricted access to the IO devices.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If no known create file access policy was found for the process token, the function raises a STATUS_ASSERTION_FAILURE exception and returns ERROR_NOT_FOUND.
     * 
     * If either processToken or policy are null, the function returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/appmodel/nf-appmodel-apppolicygetcreatefileaccess
     */
    static AppPolicyGetCreateFileAccess(processToken, policy) {
        processToken := processToken is Win32Handle ? NumGet(processToken, "ptr") : processToken

        policyMarshal := policy is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\AppPolicyGetCreateFileAccess", "ptr", processToken, policyMarshal, policy, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFamilyName 
     * @returns {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} 
     */
    static CreatePackageVirtualizationContext(packageFamilyName) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        result := DllCall("KERNEL32.dll\CreatePackageVirtualizationContext", "ptr", packageFamilyName, "ptr*", &context := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return context
    }

    /**
     * 
     * @param {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} context 
     * @returns {Pointer} 
     */
    static ActivatePackageVirtualizationContext(context) {
        result := DllCall("KERNEL32.dll\ActivatePackageVirtualizationContext", "ptr", context, "ptr*", &cookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} context 
     * @returns {String} Nothing - always returns an empty string
     */
    static ReleasePackageVirtualizationContext(context) {
        DllCall("KERNEL32.dll\ReleasePackageVirtualizationContext", "ptr", context)
    }

    /**
     * 
     * @param {Pointer} cookie 
     * @returns {String} Nothing - always returns an empty string
     */
    static DeactivatePackageVirtualizationContext(cookie) {
        DllCall("KERNEL32.dll\DeactivatePackageVirtualizationContext", "ptr", cookie)
    }

    /**
     * 
     * @param {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} sourceContext 
     * @returns {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} 
     */
    static DuplicatePackageVirtualizationContext(sourceContext) {
        result := DllCall("KERNEL32.dll\DuplicatePackageVirtualizationContext", "ptr", sourceContext, "ptr*", &destContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return destContext
    }

    /**
     * 
     * @returns {PACKAGE_VIRTUALIZATION_CONTEXT_HANDLE} 
     */
    static GetCurrentPackageVirtualizationContext() {
        result := DllCall("KERNEL32.dll\GetCurrentPackageVirtualizationContext", "ptr")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFamilyName 
     * @param {Pointer<Integer>} count 
     * @param {Pointer<Pointer<HANDLE>>} processes 
     * @returns {HRESULT} 
     */
    static GetProcessesInVirtualizationContext(packageFamilyName, count, processes) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        countMarshal := count is VarRef ? "uint*" : "ptr"
        processesMarshal := processes is VarRef ? "ptr*" : "ptr"

        result := DllCall("KERNEL32.dll\GetProcessesInVirtualizationContext", "ptr", packageFamilyName, countMarshal, count, processesMarshal, processes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the package graph's current generation ID.
     * @remarks
     * This function does not have an associated header file or library file. Your application can call [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) with the DLL name (`Kernel32.dll`) to obtain a module handle. It can then call [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) with the module handle and the name of this function to get the function address.
     * @param {Integer} flags Type: **const UINT32**
     * 
     * The [package constants](/windows/desktop/appxpkg/package-constants) that specify how package information is retrieved. The **PACKAGE_FILTER_\*** flags are supported.
     * @param {Integer} packageInfoType Type: **PackageInfo3Type**
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
     * @param {Pointer} buffer_R 
     * @returns {Integer} Type: **UINT32\***
     * 
     * The number of structures in the buffer.
     * @see https://learn.microsoft.com/windows/win32/appxpkg/appmodel/nf-appmodel-getcurrentpackageinfo3
     */
    static GetCurrentPackageInfo3(flags, packageInfoType, bufferLength, buffer_R) {
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetCurrentPackageInfo3", "uint", flags, "int", packageInfoType, bufferLengthMarshal, bufferLength, "ptr", buffer_R, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

;@endregion Methods
}
