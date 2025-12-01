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
     * @remarks
     * For assistive technology tools that work across Windows Store apps and desktop applications and have features that get loaded in the context of Windows Store apps, at times it may be necessary for the in-context feature to synchronize with the tool. Typically such synchronization is accomplished by establishing a named object in the user's session. Windows Store apps pose a challenge for this mechanism because, by default, named objects in the user's or global session are not accessible to Windows Store apps. We recommend that you update assistive technology tools to use <a href="https://docs.microsoft.com/windows/desktop/AppUIStart/user-interface-technologies-for-windows-applications">UI Automation APIs</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/magapi/entry-magapi-sdk">Magnification APIs</a> to avoid such pitfalls. In the interim, it may be necessary to continue using named objects.
     * @param {HANDLE} Token A handle pertaining to the token. If <b>NULL</b> is passed in and no <i>AppContainerSid</i> parameter is passed in, the caller's current process token is used, or the thread token if impersonating.
     * @param {PSID} AppContainerSid The SID of the app container.
     * @param {Integer} ObjectPathLength The length of the buffer.
     * @param {PWSTR} ObjectPath Buffer that is filled with the named object path.
     * @param {Pointer<Integer>} ReturnLength Returns the length required to accommodate the length of the named object path.
     * @returns {BOOL} If the function succeeds, the function returns a value of <b>TRUE</b>. 
     * 
     * If the function fails, it returns a value of <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securityappcontainer/nf-securityappcontainer-getappcontainernamedobjectpath
     * @since windows8.0
     */
    static GetAppContainerNamedObjectPath(Token, AppContainerSid, ObjectPathLength, ObjectPath, ReturnLength) {
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token
        ObjectPath := ObjectPath is String ? StrPtr(ObjectPath) : ObjectPath

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetAppContainerNamedObjectPath", "ptr", Token, "ptr", AppContainerSid, "uint", ObjectPathLength, "ptr", ObjectPath, ReturnLengthMarshal, ReturnLength, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @returns {BOOL} 
     * @deprecated IsProcessInWDAGContainer is deprecated and might not work on all platforms. For more info, see MSDN.
     */
    static IsProcessInWDAGContainer(Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-security-isolatedcontainer-l1-1-1.dll\IsProcessInWDAGContainer", ReservedMarshal, Reserved, "int*", &isProcessInWDAGContainer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isProcessInWDAGContainer
    }

    /**
     * 
     * @returns {BOOL} 
     * @deprecated IsProcessInIsolatedContainer is deprecated and might not work on all platforms. For more info, see MSDN.
     */
    static IsProcessInIsolatedContainer() {
        result := DllCall("api-ms-win-security-isolatedcontainer-l1-1-0.dll\IsProcessInIsolatedContainer", "int*", &isProcessInIsolatedContainer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isProcessInIsolatedContainer
    }

    /**
     * Determines in which execution environment the application is running.
     * @remarks
     * Any application using [Windows Defender Application Guard (WDAG)](/windows/security/threat-protection/microsoft-defender-application-guard/md-app-guard-overview) will require the ability to find which execution environment it is running in. This is needed so that the app can behave appropriately to protect user/enterprise data, user identity, and the business interests of the app.
     * @returns {BOOL} `[out]`
     * 
     * A pointer to a boolean value that receives the result of the API. This parameter will be `true` if the process is in an Isolated Windows Environment, `false` otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/isolatedwindowsenvironmentutils/nf-isolatedwindowsenvironmentutils-isprocessinisolatedwindowsenvironment
     */
    static IsProcessInIsolatedWindowsEnvironment() {
        result := DllCall("IsolatedWindowsEnvironmentUtils.dll\IsProcessInIsolatedWindowsEnvironment", "int*", &isProcessInIsolatedWindowsEnvironment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isProcessInIsolatedWindowsEnvironment
    }

    /**
     * IsCrossIsolatedEnvironmentClipboardContent is called after an app detects a paste failure to determine if the content being pasted came from the other side of a Windows Defender Application Guard (WDAG) boundary.
     * @remarks
     * This API can be called from both the host and Isolated Windows Environment app instance and can detect both relevant scenarios:
     * 
     * - Scenario 1 -  Called from a host document (ex: pasting content to the host)
     *   - Returns true if the clipboard content came from any Isolated Windows Environment.
     * - Scenario 2 -  Called from an Isolated Windows Environment document (ex: pasting content to Isolated Environment)
     *   - Returns true if the clipboard content came from the host, or from a different Isolated Windows Environment.
     * 
     * This API also allows apps to continue to show their default paste error handler where appropriate. For example, copy/pasting content within the same Isolated Environment is not subject to WDAG clipboard policy. Any failure would be due to an unrelated paste error, such as corrupted data. In this case, **IsCrossIsolatedEnvironmentClipboardContent** would return false, so the app knows to follow their default paste error handler flow.
     * @returns {BOOL} `[out]`
     * 
     * A pointer to a boolean value that receives the result of the API. This parameter will be `true` if the clipboard content came from the other side of a WDAG boundary, `false` otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/isolatedwindowsenvironmentutils/nf-isolatedwindowsenvironmentutils-iscrossisolatedenvironmentclipboardcontent
     */
    static IsCrossIsolatedEnvironmentClipboardContent() {
        result := DllCall("IsolatedWindowsEnvironmentUtils.dll\IsCrossIsolatedEnvironmentClipboardContent", "int*", &isCrossIsolatedEnvironmentClipboardContent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isCrossIsolatedEnvironmentClipboardContent
    }

    /**
     * Creates a per-user, per-app profile for Windows Store apps.
     * @remarks
     * A profile contains folders and registry storage that are per-user and per-app. The folders have ACLs that prevent them from being accessed by other users and apps. These folders can be accessed by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath">SHGetKnownFolderPath</a>.
     * 
     * The function creates a profile for the current user. To create a profile on behalf of another user, you must impersonate that user. To create profiles for multiple users of the same app, you must call <b>CreateAppContainerProfile</b> for each user.
     * @param {PWSTR} pszAppContainerName The name of the app container. To ensure uniqueness, it is recommended that this string contains the app name as well as the publisher. This string can be up to 64 characters in length.  Further, it must fit into the pattern described by the regular expression "[-_. A-Za-z0-9]+".
     * @param {PWSTR} pszDisplayName The display name. This string can be up to 512 characters in length.
     * @param {PWSTR} pszDescription A description for the app container. This string can be up to 2048 characters in length.
     * @param {Pointer<SID_AND_ATTRIBUTES>} pCapabilities The SIDs that define the requested capabilities.
     * @param {Integer} dwCapabilityCount The number of SIDs in <i>pCapabilities</i>.
     * @returns {PSID} The SID for the profile. This buffer must be freed using the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-freesid">FreeSid</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-createappcontainerprofile
     * @since windows8.0
     */
    static CreateAppContainerProfile(pszAppContainerName, pszDisplayName, pszDescription, pCapabilities, dwCapabilityCount) {
        pszAppContainerName := pszAppContainerName is String ? StrPtr(pszAppContainerName) : pszAppContainerName
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := DllCall("USERENV.dll\CreateAppContainerProfile", "ptr", pszAppContainerName, "ptr", pszDisplayName, "ptr", pszDescription, "ptr", pCapabilities, "uint", dwCapabilityCount, "ptr*", &ppSidAppContainerSid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppSidAppContainerSid
    }

    /**
     * Deletes the specified per-user, per-app profile.
     * @remarks
     * To ensure the best results, close all file handles in the profile storage locations before calling the <b>DeleteAppContainerProfile</b> function. Otherwise, this function may not be able to completely remove the storage locations for the profile.
     * 
     * This function deletes the profile for the current user. To delete the profile for another user, you must impersonate that user.
     * 
     * If the function fails, the status of the profile is undetermined, and you should call <b>DeleteAppContainerProfile</b> again to complete the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-deleteappcontainerprofile
     * @since windows8.0
     */
    static DeleteAppContainerProfile(pszAppContainerName) {
        pszAppContainerName := pszAppContainerName is String ? StrPtr(pszAppContainerName) : pszAppContainerName

        result := DllCall("USERENV.dll\DeleteAppContainerProfile", "ptr", pszAppContainerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the location of the registry storage associated with an app container.
     * @remarks
     * The function gets the registry storage for the current user. To get the registry storage for another user, you must impersonate that user.
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
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getappcontainerregistrylocation
     * @since windows8.0
     */
    static GetAppContainerRegistryLocation(desiredAccess, phAppContainerKey) {
        result := DllCall("USERENV.dll\GetAppContainerRegistryLocation", "uint", desiredAccess, "ptr", phAppContainerKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the path of the local app data folder for the specified app container.
     * @remarks
     * The path retrieved through this function is the same path that you would get by calling the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath">SHGetKnownFolderPath</a> function with <b>FOLDERID_LocalAppData</b>.
     * 
     * If a thread token is set, this function uses the app container for the current user. If no thread token is set, this function uses the app container associated with the process identity.
     * @param {PWSTR} pszAppContainerSid A pointer to the SID of the app container.
     * @returns {PWSTR} The address of a pointer to a string that, when this function returns successfully, receives the path of the local folder. It is the responsibility of the caller to free this string when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getappcontainerfolderpath
     * @since windows8.0
     */
    static GetAppContainerFolderPath(pszAppContainerSid) {
        pszAppContainerSid := pszAppContainerSid is String ? StrPtr(pszAppContainerSid) : pszAppContainerSid

        result := DllCall("USERENV.dll\GetAppContainerFolderPath", "ptr", pszAppContainerSid, "ptr*", &ppszPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszPath
    }

    /**
     * DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName is reserved for future use.
     * @param {PSID} psidAppContainerSid Reserved.
     * @param {PWSTR} pszRestrictedAppContainerName Reserved.
     * @returns {PSID} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-deriverestrictedappcontainersidfromappcontainersidandrestrictedname
     * @since windows10.0.10240
     */
    static DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName(psidAppContainerSid, pszRestrictedAppContainerName) {
        pszRestrictedAppContainerName := pszRestrictedAppContainerName is String ? StrPtr(pszRestrictedAppContainerName) : pszRestrictedAppContainerName

        result := DllCall("USERENV.dll\DeriveRestrictedAppContainerSidFromAppContainerSidAndRestrictedName", "ptr", psidAppContainerSid, "ptr", pszRestrictedAppContainerName, "ptr*", &ppsidRestrictedAppContainerSid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppsidRestrictedAppContainerSid
    }

    /**
     * Gets the SID of the specified profile.
     * @param {PWSTR} pszAppContainerName The name of the profile.
     * @returns {PSID} The SID for the profile. This buffer must be freed using the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-freesid">FreeSid</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-deriveappcontainersidfromappcontainername
     * @since windows8.0
     */
    static DeriveAppContainerSidFromAppContainerName(pszAppContainerName) {
        pszAppContainerName := pszAppContainerName is String ? StrPtr(pszAppContainerName) : pszAppContainerName

        result := DllCall("USERENV.dll\DeriveAppContainerSidFromAppContainerName", "ptr", pszAppContainerName, "ptr*", &ppsidAppContainerSid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppsidAppContainerSid
    }

;@endregion Methods
}
