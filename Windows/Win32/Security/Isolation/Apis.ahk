#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Security.Isolation
 * @version v4.0.30319
 */
class Isolation {

;@region Constants

    /**
     * @type {String}
     */
    static WDAG_CLIPBOARD_TAG => "CrossIsolatedEnvironmentContent"
;@endregion Constants

;@region Methods
    /**
     * Retrieves the named object path for the app container.
     * @param {HANDLE} Token A handle pertaining to the token. If <b>NULL</b> is passed in and no <i>AppContainerSid</i> parameter is passed in, the caller's current process token is used, or the thread token if impersonating.
     * @param {PSID} AppContainerSid The SID of the app container.
     * @param {Integer} ObjectPathLength The length of the buffer.
     * @param {PWSTR} ObjectPath Buffer that is filled with the named object path.
     * @param {Pointer<UInt32>} ReturnLength Returns the length required to accommodate the length of the named object path.
     * @returns {BOOL} If the function succeeds, the function returns a value of <b>TRUE</b>. 
     * 
     * If the function fails, it returns a value of <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securityappcontainer/nf-securityappcontainer-getappcontainernamedobjectpath
     * @since windows8.0
     */
    static GetAppContainerNamedObjectPath(Token, AppContainerSid, ObjectPathLength, ObjectPath, ReturnLength) {
        ObjectPath := ObjectPath is String ? StrPtr(ObjectPath) : ObjectPath
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetAppContainerNamedObjectPath", "ptr", Token, "ptr", AppContainerSid, "uint", ObjectPathLength, "ptr", ObjectPath, "uint*", ReturnLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<BOOL>} isProcessInWDAGContainer 
     * @returns {HRESULT} 
     * @deprecated
     */
    static IsProcessInWDAGContainer(Reserved, isProcessInWDAGContainer) {
        result := DllCall("api-ms-win-security-isolatedcontainer-l1-1-1.dll\IsProcessInWDAGContainer", "ptr", Reserved, "ptr", isProcessInWDAGContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isProcessInIsolatedContainer 
     * @returns {HRESULT} 
     * @deprecated
     */
    static IsProcessInIsolatedContainer(isProcessInIsolatedContainer) {
        result := DllCall("api-ms-win-security-isolatedcontainer-l1-1-0.dll\IsProcessInIsolatedContainer", "ptr", isProcessInIsolatedContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isProcessInIsolatedWindowsEnvironment 
     * @returns {HRESULT} 
     */
    static IsProcessInIsolatedWindowsEnvironment(isProcessInIsolatedWindowsEnvironment) {
        result := DllCall("IsolatedWindowsEnvironmentUtils.dll\IsProcessInIsolatedWindowsEnvironment", "ptr", isProcessInIsolatedWindowsEnvironment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isCrossIsolatedEnvironmentClipboardContent 
     * @returns {HRESULT} 
     */
    static IsCrossIsolatedEnvironmentClipboardContent(isCrossIsolatedEnvironmentClipboardContent) {
        result := DllCall("IsolatedWindowsEnvironmentUtils.dll\IsCrossIsolatedEnvironmentClipboardContent", "ptr", isCrossIsolatedEnvironmentClipboardContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a per-user, per-app profile for Windows Store apps.
     * @param {PWSTR} pszAppContainerName The name of the app container. To ensure uniqueness, it is recommended that this string contains the app name as well as the publisher. This string can be up to 64 characters in length.  Further, it must fit into the pattern described by the regular expression "[-_. A-Za-z0-9]+".
     * @param {PWSTR} pszDisplayName The display name. This string can be up to 512 characters in length.
     * @param {PWSTR} pszDescription A description for the app container. This string can be up to 2048 characters in length.
     * @param {Pointer<SID_AND_ATTRIBUTES>} pCapabilities The SIDs that define the requested capabilities.
     * @param {Integer} dwCapabilityCount The number of SIDs in <i>pCapabilities</i>.
     * @param {Pointer<PSID>} ppSidAppContainerSid The SID for the profile. This buffer must be freed using the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-freesid">FreeSid</a> function.
     * @returns {HRESULT} If this function succeeds, it returns a standard HRESULT code, including the following:
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
     * The data store was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to create the profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application data store already exists.
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
     * The container name   is <b>NULL</b>,  or the container name,   the display name, or the description strings exceed their specified respective limits for length.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-createappcontainerprofile
     * @since windows8.0
     */
    static CreateAppContainerProfile(pszAppContainerName, pszDisplayName, pszDescription, pCapabilities, dwCapabilityCount, ppSidAppContainerSid) {
        pszAppContainerName := pszAppContainerName is String ? StrPtr(pszAppContainerName) : pszAppContainerName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := DllCall("USERENV.dll\CreateAppContainerProfile", "ptr", pszAppContainerName, "ptr", pszDisplayName, "ptr", pszDescription, "ptr", pCapabilities, "uint", dwCapabilityCount, "ptr", ppSidAppContainerSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes the specified per-user, per-app profile.
     * @param {PWSTR} pszAppContainerName The name given to the profile in the call to the <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createappcontainerprofile">CreateAppContainerProfile</a> function. This string is at most 64 characters in length, and  fits into the pattern described by the regular expression "[-_. A-Za-z0-9]+".
     * @returns {HRESULT} If this function succeeds, it returns a standard HRESULT code, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the method is called from within an app container.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile was deleted successfully.
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
     * If the container name   is <b>NULL</b>, or if it exceeds its specified limit for length.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-deleteappcontainerprofile
     * @since windows8.0
     */
    static DeleteAppContainerProfile(pszAppContainerName) {
        pszAppContainerName := pszAppContainerName is String ? StrPtr(pszAppContainerName) : pszAppContainerName

        result := DllCall("USERENV.dll\DeleteAppContainerProfile", "ptr", pszAppContainerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the location of the registry storage associated with an app container.
     * @param {Integer} desiredAccess Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/messages">REGSAM</a></b>
     * 
     * The desired registry access.
     * @param {Pointer<HKEY>} phAppContainerKey Type: <b>PHKEY</b>
     * 
     * A pointer to an HKEY that, when this function returns successfully, receives the registry storage location for the current profile.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function returns an <b>HRESULT</b> code, including but not limited to the following:
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
     * The operation completed successfully.
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
     * The caller is not running as or impersonating a user who can access this profile.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-getappcontainerregistrylocation
     * @since windows8.0
     */
    static GetAppContainerRegistryLocation(desiredAccess, phAppContainerKey) {
        result := DllCall("USERENV.dll\GetAppContainerRegistryLocation", "uint", desiredAccess, "ptr", phAppContainerKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the path of the local app data folder for the specified app container.
     * @param {PWSTR} pszAppContainerSid A pointer to the SID of the app container.
     * @param {Pointer<PWSTR>} ppszPath The address of a pointer to a string that, when this function returns successfully, receives the path of the local folder. It is the responsibility of the caller to free this string when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} This function returns an <b>HRESULT</b> code, including but not limited to the following:
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
     * The operation completed successfully.
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
     * The <i>pszAppContainerSid</i> or <i>ppszPath</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-getappcontainerfolderpath
     * @since windows8.0
     */
    static GetAppContainerFolderPath(pszAppContainerSid, ppszPath) {
        pszAppContainerSid := pszAppContainerSid is String ? StrPtr(pszAppContainerSid) : pszAppContainerSid

        result := DllCall("USERENV.dll\GetAppContainerFolderPath", "ptr", pszAppContainerSid, "ptr", ppszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName is reserved for future use.
     * @param {PSID} psidAppContainerSid Reserved.
     * @param {PWSTR} pszRestrictedAppContainerName Reserved.
     * @param {Pointer<PSID>} ppsidRestrictedAppContainerSid Reserved.
     * @returns {HRESULT} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-deriverestrictedappcontainersidfromappcontainersidandrestrictedname
     * @since windows10.0.10240
     */
    static DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(psidAppContainerSid, pszRestrictedAppContainerName, ppsidRestrictedAppContainerSid) {
        pszRestrictedAppContainerName := pszRestrictedAppContainerName is String ? StrPtr(pszRestrictedAppContainerName) : pszRestrictedAppContainerName

        result := DllCall("USERENV.dll\DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName", "ptr", psidAppContainerSid, "ptr", pszRestrictedAppContainerName, "ptr", ppsidRestrictedAppContainerSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the SID of the specified profile.
     * @param {PWSTR} pszAppContainerName The name of the profile.
     * @param {Pointer<PSID>} ppsidAppContainerSid The SID for the profile. This buffer must be freed using the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-freesid">FreeSid</a> function.
     * @returns {HRESULT} This function can return one of these values.
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
     * The operation completed successfully.
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
     * The <i>pszAppContainerName</i> parameter, or the  <i>ppsidAppContainerSid</i> parameter is either <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-deriveappcontainersidfromappcontainername
     * @since windows8.0
     */
    static DeriveAppContainerSidFromAppContainerName(pszAppContainerName, ppsidAppContainerSid) {
        pszAppContainerName := pszAppContainerName is String ? StrPtr(pszAppContainerName) : pszAppContainerName

        result := DllCall("USERENV.dll\DeriveAppContainerSidFromAppContainerName", "ptr", pszAppContainerName, "ptr", ppsidAppContainerSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
