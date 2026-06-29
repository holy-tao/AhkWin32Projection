#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\VALENTW.ahk" { VALENTW }
#Import ".\REG_OPEN_CREATE_OPTIONS.ahk" { REG_OPEN_CREATE_OPTIONS }
#Import ".\REG_SAVE_FORMAT.ahk" { REG_SAVE_FORMAT }
#Import "..\..\Foundation\WIN32_ERROR.ahk" { WIN32_ERROR }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\REG_VALUE_TYPE.ahk" { REG_VALUE_TYPE }
#Import ".\VALENTA.ahk" { VALENTA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Security\OBJECT_SECURITY_INFORMATION.ahk" { OBJECT_SECURITY_INFORMATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\REG_SAM_FLAGS.ahk" { REG_SAM_FLAGS }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }
#Import ".\REG_CREATE_KEY_DISPOSITION.ahk" { REG_CREATE_KEY_DISPOSITION }
#Import ".\REG_NOTIFY_FILTER.ahk" { REG_NOTIFY_FILTER }
#Import ".\REG_ROUTINE_FLAGS.ahk" { REG_ROUTINE_FLAGS }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.System.Registry
 */

;@region Functions
/**
 * Closes a handle to the specified registry key.
 * @remarks
 * The handle for a specified key should not be used after it has been closed, because it will no longer be valid. Key handles should not be left open any longer than necessary.
 * 
 * The 
 * <b>RegCloseKey</b> function does not necessarily write information to the registry before returning; it can take as much as several seconds for the cache to be flushed to the hard disk. If an application must explicitly write registry information to the hard disk, it can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regflushkey">RegFlushKey</a> function. 
 * <b>RegFlushKey</b>, however, uses many system resources and should be called only when necessary.
 * @param {HKEY} _hKey A handle to the open key to be closed. The handle must have been opened by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a> function.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regclosekey
 * @since windows5.0
 */
export RegCloseKey(_hKey) {
    result := DllCall("ADVAPI32.dll\RegCloseKey", HKEY, _hKey, WIN32_ERROR)
    return result
}

/**
 * Maps a predefined registry key to the specified registry key.
 * @remarks
 * The 
 * <b>RegOverridePredefKey</b> function is intended for software installation programs. It allows them to remap a predefined key, load a DLL component that will be installed on the system, call an entry point in the DLL, and examine the changes to the registry that the component attempted to make. The installation program can then write those changes to the locations intended by the DLL, or make changes to the data before writing it.
 * 
 * For example, consider an installation program that installs an ActiveX control as part of an application installation. The installation program needs to call the control's 
 * <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-dllregisterserver">DllRegisterServer</a> entry point to enable the control to register itself. Before this call, the installation program can call 
 * <b>RegOverridePredefKey</b> to remap <b>HKEY_CLASSES_ROOT</b> to a temporary key such as <b>HKEY_CURRENT_USER</b>&#92;<b><i>TemporaryInstall</i></b>&#92;<b><i>DllRegistration</i></b>. It then calls <b>DllRegisterServer</b>, which causes the ActiveX control to write its registry entries to the temporary key. The installation program then calls 
 * <b>RegOverridePredefKey</b> again to restore the original mapping of <b>HKEY_CLASSES_ROOT</b>. The installation program can modify the keys written to the temporary key, if necessary, before copying them to the original <b>HKEY_CLASSES_ROOT</b>.
 * 
 * After the call to 
 * <b>RegOverridePredefKey</b>, you can safely call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> to close the <i>hNewHKey</i> handle. The system maintains its own reference to <i>hNewHKey</i>.
 * @param {HKEY} _hKey A handle to one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * - <b>HKEY_CLASSES_ROOT</b>
 * - <b>HKEY_CURRENT_CONFIG</b>
 * - <b>HKEY_CURRENT_USER</b>
 * - <b>HKEY_LOCAL_MACHINE</b>
 * - <b>HKEY_PERFORMANCE_DATA</b>
 * - <b>HKEY_USERS</b>
 * @param {HKEY} hNewHKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It cannot be one of the predefined keys. The function maps <i>hKey</i> to refer to the <i>hNewHKey</i> key. This affects only the calling process. 
 * 
 * If <i>hNewHKey</i> is <b>NULL</b>, the function restores the default mapping of the predefined key.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regoverridepredefkey
 * @since windows5.0
 */
export RegOverridePredefKey(_hKey, hNewHKey) {
    result := DllCall("ADVAPI32.dll\RegOverridePredefKey", HKEY, _hKey, HKEY, hNewHKey, WIN32_ERROR)
    return result
}

/**
 * Retrieves a handle to the HKEY_CLASSES_ROOT key for a specified user. The user is identified by an access token.
 * @remarks
 * The 
 * <b>RegOpenUserClassesRoot</b> function enables you to retrieve the merged <b>HKEY_CLASSES_ROOT</b> information for users other than the interactive user. For example, the server component of a client/server application could use 
 * <b>RegOpenUserClassesRoot</b> to retrieve the merged information for a client.
 * 
 * <b>RegOpenUserClassesRoot</b> fails if the user profile for the specified user is not loaded. When a user logs on interactively, the system automatically loads the user's profile. For other users, you can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-loaduserprofilea">LoadUserProfile</a> function to load the user's profile. However, <b>LoadUserProfile</b> can be very time-consuming, so do not call it for this purpose unless it is absolutely necessary to have the user's merged <b>HKEY_CLASSES_ROOT</b> information.
 * 
 * Applications running in the security context of the interactively logged-on user do not need to use 
 * <b>RegOpenUserClassesRoot</b>. These applications can call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function to retrieve a merged view of the <b>HKEY_CLASSES_ROOT</b> key for the interactive user.
 * @param {HANDLE} hToken A handle to a primary or impersonation access token that identifies the user of interest. This can be a token handle returned by a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> functions. 
 * 
 * 
 * 
 * 
 * The handle must have TOKEN_QUERY access. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
 * @param {Integer} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. When you no longer need the returned handle, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function to close it.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopenuserclassesroot
 * @since windows5.0
 */
export RegOpenUserClassesRoot(hToken, samDesired, phkResult) {
    static dwOptions := 0 ;Reserved parameters must always be NULL

    result := DllCall("ADVAPI32.dll\RegOpenUserClassesRoot", HANDLE, hToken, "uint", dwOptions, "uint", samDesired, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Retrieves a handle to the HKEY_CURRENT_USER key for the user the current thread is impersonating.
 * @remarks
 * The <b>HKEY_CURRENT_USER</b> key maps to the root of the current user's branch in the <b>HKEY_USERS</b> key. It is cached for all threads in a process. Therefore, this value does not change when another user's profile is loaded. 
 * <b>RegOpenCurrentUser</b> uses the thread's token to access the appropriate key, or the default if the profile is not loaded.
 * @param {Integer} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. When you no longer need the returned handle, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function to close it.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopencurrentuser
 * @since windows5.0
 */
export RegOpenCurrentUser(samDesired, phkResult) {
    result := DllCall("ADVAPI32.dll\RegOpenCurrentUser", "uint", samDesired, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Disables handle caching of the predefined registry handle for HKEY_CURRENT_USER for the current process.
 * @remarks
 * Any access of <b>HKEY_CURRENT_USER</b> after this function is called will result in operations being performed on <b>HKEY_USERS</b>&#92;<b>SID_of_current_user</b>,  or on <b>HKEY_USERS\.DEFAULT</b> if the current user's hive is not loaded. For more information on SIDs, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdisablepredefinedcache
 * @since windows5.0
 */
export RegDisablePredefinedCache() {
    result := DllCall("ADVAPI32.dll\RegDisablePredefinedCache", WIN32_ERROR)
    return result
}

/**
 * Disables handle caching for all predefined registry handles for the current process.
 * @remarks
 * This function does not work on a remote computer.
 * 
 * Services that change impersonation should call this function before using any of the predefined handles.
 * 
 * For example, any access of <b>HKEY_CURRENT_USER</b> after this function is called results in open and close operations being performed on <b>HKEY_USERS</b>&#92;<b>SID_of_current_user</b>, or on <b>HKEY_USERS\.DEFAULT</b> if the current user's hive is not loaded. For more information on SIDs, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdisablepredefinedcacheex
 * @since windows6.0.6000
 */
export RegDisablePredefinedCacheEx() {
    result := DllCall("ADVAPI32.dll\RegDisablePredefinedCacheEx", WIN32_ERROR)
    return result
}

/**
 * Establishes a connection to a predefined registry key on another computer. (ANSI)
 * @remarks
 * <b>RegConnectRegistry</b> requires the Remote Registry service to be running on the remote computer. By default, this service is configured to be started manually. To configure the Remote Registry service to start automatically, run Services.msc and change the Startup Type of the service to Automatic.
 * 
 * <b>Windows Server 2003 and Windows XP/2000:  </b>The Remote Registry service is configured to start automatically by default.
 * 
 * When a handle returned by 
 * <b>RegConnectRegistry</b> is no longer needed, it should be closed by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a>.
 * 
 * If the computer is joined to a workgroup and the "Force network logons using local accounts to authenticate as Guest" policy is enabled, the function fails. Note that this policy is enabled by default if the  computer is joined to a workgroup.
 * 
 * If the current user does not have proper access to the remote computer, the call to <b>RegConnectRegistry</b> fails. To connect to a remote registry, call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> with LOGON32_LOGON_NEW_CREDENTIALS and <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> before calling <b>RegConnectRegistry</b>.
 * 
 * <b>Windows 2000:  </b>One possible workaround is to establish a session to an administrative share such as IPC$ using a different set of credentials. To specify credentials other than those of the current user, use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> function to connect to the share. When you have finished accessing the registry, cancel the connection. 
 * 
 * <b>Windows XP Home Edition:  </b>You cannot use this function  to connect to a remote computer running Windows XP Home Edition. This function does work with the name of the local computer even if it is running Windows XP Home Edition because this bypasses the authentication layer.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegConnectRegistry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpMachineName The name of the remote computer. The string has the following form: 
 * 
 * 
 * 
 * 
 * &#92;&#92;<i>computername</i>
 * 
 * The caller must have access to the remote computer or the function fails.
 * 
 * If this parameter is <b>NULL</b>, the local computer name is used.
 * @param {HKEY} _hKey A predefined registry handle. This parameter can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a> on the remote computer. 
 * 
 * 
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_PERFORMANCE_DATA</b>
 * <b>HKEY_USERS</b>
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a key handle identifying the predefined handle on the remote computer.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regconnectregistrya
 * @since windows5.0
 */
export RegConnectRegistryA(lpMachineName, _hKey, phkResult) {
    lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName

    result := DllCall("ADVAPI32.dll\RegConnectRegistryA", "ptr", lpMachineName, HKEY, _hKey, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Establishes a connection to a predefined registry key on another computer. (Unicode)
 * @remarks
 * <b>RegConnectRegistry</b> requires the Remote Registry service to be running on the remote computer. By default, this service is configured to be started manually. To configure the Remote Registry service to start automatically, run Services.msc and change the Startup Type of the service to Automatic.
 * 
 * <b>Windows Server 2003 and Windows XP/2000:  </b>The Remote Registry service is configured to start automatically by default.
 * 
 * When a handle returned by 
 * <b>RegConnectRegistry</b> is no longer needed, it should be closed by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a>.
 * 
 * If the computer is joined to a workgroup and the "Force network logons using local accounts to authenticate as Guest" policy is enabled, the function fails. Note that this policy is enabled by default if the  computer is joined to a workgroup.
 * 
 * If the current user does not have proper access to the remote computer, the call to <b>RegConnectRegistry</b> fails. To connect to a remote registry, call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> with LOGON32_LOGON_NEW_CREDENTIALS and <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> before calling <b>RegConnectRegistry</b>.
 * 
 * <b>Windows 2000:  </b>One possible workaround is to establish a session to an administrative share such as IPC$ using a different set of credentials. To specify credentials other than those of the current user, use the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> function to connect to the share. When you have finished accessing the registry, cancel the connection. 
 * 
 * <b>Windows XP Home Edition:  </b>You cannot use this function  to connect to a remote computer running Windows XP Home Edition. This function does work with the name of the local computer even if it is running Windows XP Home Edition because this bypasses the authentication layer.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegConnectRegistry as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpMachineName The name of the remote computer. The string has the following form: 
 * 
 * 
 * 
 * 
 * &#92;&#92;<i>computername</i>
 * 
 * The caller must have access to the remote computer or the function fails.
 * 
 * If this parameter is <b>NULL</b>, the local computer name is used.
 * @param {HKEY} _hKey A predefined registry handle. This parameter can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a> on the remote computer. 
 * 
 * 
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_PERFORMANCE_DATA</b>
 * <b>HKEY_USERS</b>
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a key handle identifying the predefined handle on the remote computer.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regconnectregistryw
 * @since windows5.0
 */
export RegConnectRegistryW(lpMachineName, _hKey, phkResult) {
    lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName

    result := DllCall("ADVAPI32.dll\RegConnectRegistryW", "ptr", lpMachineName, HKEY, _hKey, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {PSTR} lpMachineName 
 * @param {HKEY} _hKey 
 * @param {Integer} Flags 
 * @param {Pointer<HKEY>} phkResult 
 * @returns {Integer} 
 */
export RegConnectRegistryExA(lpMachineName, _hKey, Flags, phkResult) {
    lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName

    result := DllCall("ADVAPI32.dll\RegConnectRegistryExA", "ptr", lpMachineName, HKEY, _hKey, "uint", Flags, HKEY.Ptr, phkResult, Int32)
    return result
}

/**
 * 
 * @param {PWSTR} lpMachineName 
 * @param {HKEY} _hKey 
 * @param {Integer} Flags 
 * @param {Pointer<HKEY>} phkResult 
 * @returns {Integer} 
 */
export RegConnectRegistryExW(lpMachineName, _hKey, Flags, phkResult) {
    lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName

    result := DllCall("ADVAPI32.dll\RegConnectRegistryExW", "ptr", lpMachineName, HKEY, _hKey, "uint", Flags, HKEY.Ptr, phkResult, Int32)
    return result
}

/**
 * Creates the specified registry key. If the key already exists in the registry, the function opens it. (ANSI)
 * @remarks
 * An application cannot create a key that is a direct child of <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b>. An application can create subkeys in lower levels of the <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b> trees.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * The <b>RegCreateKey</b> function creates all missing keys in the specified path. An application can take advantage of this behavior to create several keys at once. For example, an application can create a subkey four levels deep at the same time as the three preceding subkeys by specifying a string of the following form for the <i>lpSubKey</i> parameter:
 * 
 * <i>subkey1\subkey2\subkey3\subkey4
 * 			</i>
 * 
 * Note that this behavior will result in creation of unwanted keys if an existing key in the path is spelled incorrectly. 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCreateKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of a key that this function opens or creates. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
 * 
 * 
 * For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
 * 
 * If <i>hKey</i> is one of the predefined keys, <i>lpSubKey</i> may be <b>NULL</b>. In that case, <i>phkResult</i> receives the same <i>hKey</i> handle passed in to the function.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcreatekeya
 * @since windows5.0
 */
export RegCreateKeyA(_hKey, lpSubKey, phkResult) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegCreateKeyA", HKEY, _hKey, "ptr", lpSubKey, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Creates the specified registry key. If the key already exists in the registry, the function opens it. (Unicode)
 * @remarks
 * An application cannot create a key that is a direct child of <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b>. An application can create subkeys in lower levels of the <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b> trees.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * The <b>RegCreateKey</b> function creates all missing keys in the specified path. An application can take advantage of this behavior to create several keys at once. For example, an application can create a subkey four levels deep at the same time as the three preceding subkeys by specifying a string of the following form for the <i>lpSubKey</i> parameter:
 * 
 * <i>subkey1\subkey2\subkey3\subkey4
 * 			</i>
 * 
 * Note that this behavior will result in creation of unwanted keys if an existing key in the path is spelled incorrectly. 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCreateKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of a key that this function opens or creates. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
 * 
 * 
 * For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
 * 
 * If <i>hKey</i> is one of the predefined keys, <i>lpSubKey</i> may be <b>NULL</b>. In that case, <i>phkResult</i> receives the same <i>hKey</i> handle passed in to the function.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcreatekeyw
 * @since windows5.0
 */
export RegCreateKeyW(_hKey, lpSubKey, phkResult) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegCreateKeyW", HKEY, _hKey, "ptr", lpSubKey, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Creates the specified registry key. If the key already exists, the function opens it. Note that key names are not case sensitive. (ANSI)
 * @remarks
 * The key that the 
 * <b>RegCreateKeyEx</b> function creates has no values. An application can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function to set key values.
 * 
 * The <b>RegCreateKeyEx</b> function creates all missing keys in the specified path. An application can take advantage of this behavior to create several keys at once. For example, an application can create a subkey four levels deep at the same time as the three preceding subkeys by specifying a string of the following form for the <i>lpSubKey</i> parameter:
 * 
 * <i>subkey1\subkey2\subkey3\subkey4
 * 			</i>
 * 
 * Note that this behavior will result in creation of unwanted keys if an existing key in the path is spelled incorrectly. 
 * 
 * An application cannot create a key that is a direct child of <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b>. An application can create subkeys in lower levels of the <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b> trees.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCreateKeyEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that modify the registry if allowed by its security descriptor.
 * 
 * This handle is returned by the 
 * <b>RegCreateKeyEx</b> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * <dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
 * 
 * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
 * 
 * This parameter cannot be <b>NULL</b>.
 * @param {PSTR} lpClass The user-defined class type of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
 * @param {REG_OPEN_CREATE_OPTIONS} dwOptions 
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
 * 
 * 
 * 
 * 
 * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @param {Pointer<REG_CREATE_KEY_DISPOSITION>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
 * <dt><b>REG_CREATED_NEW_KEY</b></dt>
 * <dt>0x00000001L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key did not exist and was created.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
 * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
 * <dt>0x00000002L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key existed and was simply opened without being changed.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcreatekeyexa
 * @since windows5.0
 */
export RegCreateKeyExA(_hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpdwDispositionMarshal := lpdwDisposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegCreateKeyExA", HKEY, _hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, REG_OPEN_CREATE_OPTIONS, dwOptions, REG_SAM_FLAGS, samDesired, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HKEY.Ptr, phkResult, lpdwDispositionMarshal, lpdwDisposition, WIN32_ERROR)
    return result
}

/**
 * Creates the specified registry key. If the key already exists, the function opens it. Note that key names are not case sensitive. (Unicode)
 * @remarks
 * The key that the 
 * <b>RegCreateKeyEx</b> function creates has no values. An application can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function to set key values.
 * 
 * The <b>RegCreateKeyEx</b> function creates all missing keys in the specified path. An application can take advantage of this behavior to create several keys at once. For example, an application can create a subkey four levels deep at the same time as the three preceding subkeys by specifying a string of the following form for the <i>lpSubKey</i> parameter:
 * 
 * <i>subkey1\subkey2\subkey3\subkey4
 * 			</i>
 * 
 * Note that this behavior will result in creation of unwanted keys if an existing key in the path is spelled incorrectly. 
 * 
 * An application cannot create a key that is a direct child of <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b>. An application can create subkeys in lower levels of the <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b> trees.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCreateKeyEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that modify the registry if allowed by its security descriptor.
 * 
 * This handle is returned by the 
 * <b>RegCreateKeyEx</b> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * <dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
 * 
 * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
 * 
 * This parameter cannot be <b>NULL</b>.
 * @param {PWSTR} lpClass The user-defined class type of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
 * @param {REG_OPEN_CREATE_OPTIONS} dwOptions 
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
 * 
 * 
 * 
 * 
 * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @param {Pointer<REG_CREATE_KEY_DISPOSITION>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
 * <dt><b>REG_CREATED_NEW_KEY</b></dt>
 * <dt>0x00000001L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key did not exist and was created.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
 * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
 * <dt>0x00000002L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key existed and was simply opened without being changed.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcreatekeyexw
 * @since windows5.0
 */
export RegCreateKeyExW(_hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpdwDispositionMarshal := lpdwDisposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegCreateKeyExW", HKEY, _hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, REG_OPEN_CREATE_OPTIONS, dwOptions, REG_SAM_FLAGS, samDesired, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HKEY.Ptr, phkResult, lpdwDispositionMarshal, lpdwDisposition, WIN32_ERROR)
    return result
}

/**
 * Creates the specified registry key and associates it with a transaction. (ANSI)
 * @remarks
 * When a key is created using this function, subsequent operations on the key are transacted. If a non-transacted operation is performed on the key before the transaction is committed, the transaction is rolled back. After a transaction is committed or rolled back, you must re-open the key using <b>RegCreateKeyTransacted</b> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> with an active transaction handle to make additional operations transacted. For more information about transactions, see <a href="https://docs.microsoft.com/windows/desktop/Ktm/kernel-transaction-manager-portal">Kernel Transaction Manager</a>.
 * 
 * Note that subsequent operations on subkeys of this key are not automatically transacted. Therefore,  <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeyexa">RegDeleteKeyEx</a> does not perform a transacted delete operation. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeytransacteda">RegDeleteKeyTransacted</a> function to perform a transacted delete operation.
 * 
 * The key that the 
 * <b>RegCreateKeyTransacted</b> function creates has no values. An application can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function to set key values.
 * 
 * The <b>RegCreateKeyTransacted</b> function creates all missing keys in the specified path. An application can take advantage of this behavior to create several keys at once. For example, an application can create a subkey four levels deep at the same time as the three preceding subkeys by specifying a string of the following form for the <i>lpSubKey</i> parameter:
 * 
 * <i>subkey1\subkey2\subkey3\subkey4
 * 			</i>
 * 
 * Note that this behavior will result in creation of unwanted keys if an existing key in the path is spelled incorrectly. 
 * 
 * An application cannot create a key that is a direct child of <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b>. An application can create subkeys in lower levels of the <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b> trees.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCreateKeyTransacted as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
 * 
 * This handle is returned by the 
 * <b>RegCreateKeyTransacted</b> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * <dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
 * 
 * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
 * 
 * This parameter cannot be <b>NULL</b>.
 * @param {PSTR} lpClass The user-defined class of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
 * @param {REG_OPEN_CREATE_OPTIONS} dwOptions 
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
 * 
 * 
 * 
 * 
 * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @param {Pointer<REG_CREATE_KEY_DISPOSITION>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
 * <dt><b>REG_CREATED_NEW_KEY</b></dt>
 * <dt>0x00000001L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key did not exist and was created.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
 * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
 * <dt>0x00000002L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key existed and was simply opened without being changed.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
 * @param {HANDLE} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcreatekeytransacteda
 * @since windows6.0.6000
 */
export RegCreateKeyTransactedA(_hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, hTransaction) {
    static Reserved := 0, pExtendedParemeter := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpdwDispositionMarshal := lpdwDisposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegCreateKeyTransactedA", HKEY, _hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, REG_OPEN_CREATE_OPTIONS, dwOptions, REG_SAM_FLAGS, samDesired, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HKEY.Ptr, phkResult, lpdwDispositionMarshal, lpdwDisposition, HANDLE, hTransaction, "ptr", pExtendedParemeter, WIN32_ERROR)
    return result
}

/**
 * Creates the specified registry key and associates it with a transaction. (Unicode)
 * @remarks
 * When a key is created using this function, subsequent operations on the key are transacted. If a non-transacted operation is performed on the key before the transaction is committed, the transaction is rolled back. After a transaction is committed or rolled back, you must re-open the key using <b>RegCreateKeyTransacted</b> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> with an active transaction handle to make additional operations transacted. For more information about transactions, see <a href="https://docs.microsoft.com/windows/desktop/Ktm/kernel-transaction-manager-portal">Kernel Transaction Manager</a>.
 * 
 * Note that subsequent operations on subkeys of this key are not automatically transacted. Therefore,  <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeyexa">RegDeleteKeyEx</a> does not perform a transacted delete operation. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeytransacteda">RegDeleteKeyTransacted</a> function to perform a transacted delete operation.
 * 
 * The key that the 
 * <b>RegCreateKeyTransacted</b> function creates has no values. An application can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function to set key values.
 * 
 * The <b>RegCreateKeyTransacted</b> function creates all missing keys in the specified path. An application can take advantage of this behavior to create several keys at once. For example, an application can create a subkey four levels deep at the same time as the three preceding subkeys by specifying a string of the following form for the <i>lpSubKey</i> parameter:
 * 
 * <i>subkey1\subkey2\subkey3\subkey4
 * 			</i>
 * 
 * Note that this behavior will result in creation of unwanted keys if an existing key in the path is spelled incorrectly. 
 * 
 * An application cannot create a key that is a direct child of <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b>. An application can create subkeys in lower levels of the <b>HKEY_USERS</b> or <b>HKEY_LOCAL_MACHINE</b> trees.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCreateKeyTransacted as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
 * 
 * This handle is returned by the 
 * <b>RegCreateKeyTransacted</b> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * <dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
 * 
 * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
 * 
 * This parameter cannot be <b>NULL</b>.
 * @param {PWSTR} lpClass The user-defined class of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
 * @param {REG_OPEN_CREATE_OPTIONS} dwOptions 
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
 * 
 * 
 * 
 * 
 * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @param {Pointer<REG_CREATE_KEY_DISPOSITION>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
 * <dt><b>REG_CREATED_NEW_KEY</b></dt>
 * <dt>0x00000001L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key did not exist and was created.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
 * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
 * <dt>0x00000002L</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key existed and was simply opened without being changed.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
 * @param {HANDLE} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcreatekeytransactedw
 * @since windows6.0.6000
 */
export RegCreateKeyTransactedW(_hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, hTransaction) {
    static Reserved := 0, pExtendedParemeter := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpdwDispositionMarshal := lpdwDisposition is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegCreateKeyTransactedW", HKEY, _hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, REG_OPEN_CREATE_OPTIONS, dwOptions, REG_SAM_FLAGS, samDesired, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, HKEY.Ptr, phkResult, lpdwDispositionMarshal, lpdwDisposition, HANDLE, hTransaction, "ptr", pExtendedParemeter, WIN32_ERROR)
    return result
}

/**
 * Deletes a subkey and its values. (ANSI)
 * @remarks
 * A deleted key is not removed until the last handle to it is closed.
 * 
 * The subkey to be deleted must not have subkeys. To delete a key and all its subkeys, you need to enumerate the subkeys and delete them individually. To delete keys recursively, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shdeletekeya">SHDeleteKey</a> function.
 * @param {HKEY} _hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of the key to be deleted. It must be a subkey of the key that <i>hKey</i> identifies, but it cannot have subkeys. This parameter cannot be <b>NULL</b>.
 * 
 * The function opens the subkey with the DELETE access right. 
 * 
 * Key names are not case sensitive.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. To get a generic description of the error, you can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeya
 * @since windows5.0
 */
export RegDeleteKeyA(_hKey, lpSubKey) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteKeyA", HKEY, _hKey, "ptr", lpSubKey, WIN32_ERROR)
    return result
}

/**
 * Deletes a subkey and its values. (Unicode)
 * @remarks
 * A deleted key is not removed until the last handle to it is closed.
 * 
 * The subkey to be deleted must not have subkeys. To delete a key and all its subkeys, you need to enumerate the subkeys and delete them individually. To delete keys recursively, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shdeletekeya">SHDeleteKey</a> function.
 * @param {HKEY} _hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of the key to be deleted. It must be a subkey of the key that <i>hKey</i> identifies, but it cannot have subkeys. This parameter cannot be <b>NULL</b>.
 * 
 * The function opens the subkey with the DELETE access right. 
 * 
 * Key names are not case sensitive.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. To get a generic description of the error, you can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeyw
 * @since windows5.0
 */
export RegDeleteKeyW(_hKey, lpSubKey) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteKeyW", HKEY, _hKey, "ptr", lpSubKey, WIN32_ERROR)
    return result
}

/**
 * Deletes a subkey and its values from the specified platform-specific view of the registry. (ANSI)
 * @remarks
 * A deleted key is not removed until the last handle to it is closed.
 * 
 * On WOW64, 32-bit applications view a registry tree that is separate from the registry tree that 64-bit applications view. This function enables an application to delete an entry in the alternate registry view.
 * 
 * The subkey to be deleted must not have subkeys. To delete a key and all its subkeys, you need to enumerate the subkeys and delete them individually. To delete keys recursively, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shdeletekeya">SHDeleteKey</a> function.
 * 
 * If the function succeeds, <b>RegDeleteKeyEx</b> removes the specified key from the registry. The entire key, including all of its values, is removed.
 * 
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteKeyEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
 * 
 * The  function opens the subkey with the DELETE access right. 
 * 
 * Key names are not case sensitive.
 * 
 * The value of this parameter cannot be <b>NULL</b>.
 * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
 * <dt><b>KEY_WOW64_32KEY</b></dt>
 * <dt>0x0200</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 32-bit registry view.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
 * <dt><b>KEY_WOW64_64KEY</b></dt>
 * <dt>0x0100</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 64-bit registry view.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeyexa
 * @since windows6.0.6000
 */
export RegDeleteKeyExA(_hKey, lpSubKey, samDesired) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteKeyExA", HKEY, _hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, WIN32_ERROR)
    return result
}

/**
 * Deletes a subkey and its values from the specified platform-specific view of the registry. (Unicode)
 * @remarks
 * A deleted key is not removed until the last handle to it is closed.
 * 
 * On WOW64, 32-bit applications view a registry tree that is separate from the registry tree that 64-bit applications view. This function enables an application to delete an entry in the alternate registry view.
 * 
 * The subkey to be deleted must not have subkeys. To delete a key and all its subkeys, you need to enumerate the subkeys and delete them individually. To delete keys recursively, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shdeletekeya">SHDeleteKey</a> function.
 * 
 * If the function succeeds, <b>RegDeleteKeyEx</b> removes the specified key from the registry. The entire key, including all of its values, is removed.
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteKeyEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
 * 
 * The  function opens the subkey with the DELETE access right. 
 * 
 * Key names are not case sensitive.
 * 
 * The value of this parameter cannot be <b>NULL</b>.
 * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
 * <dt><b>KEY_WOW64_32KEY</b></dt>
 * <dt>0x0200</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 32-bit registry view.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
 * <dt><b>KEY_WOW64_64KEY</b></dt>
 * <dt>0x0100</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 64-bit registry view.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeyexw
 * @since windows6.0.6000
 */
export RegDeleteKeyExW(_hKey, lpSubKey, samDesired) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteKeyExW", HKEY, _hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, WIN32_ERROR)
    return result
}

/**
 * Deletes a subkey and its values from the specified platform-specific view of the registry as a transacted operation. (ANSI)
 * @remarks
 * A deleted key is not removed until the last handle to it is closed.
 * 
 * On WOW64, 32-bit applications view a registry tree that is separate from the registry tree that 64-bit applications view. This function enables an application to delete an entry in the alternate registry view.
 * 
 * The subkey to be deleted must not have subkeys. To delete a key and all its subkeys, you need to enumerate the subkeys and delete them individually. To delete keys recursively, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shdeletekeya">SHDeleteKey</a> function.
 * 
 * If the function succeeds, <b>RegDeleteKeyTransacted</b> removes the specified key from the registry. The entire key, including all of its values, is removed. To remove the entire tree as a transacted operation, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> function with a handle returned from <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteKeyTransacted as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
 * 
 * The  function opens the subkey with the DELETE access right. 
 * 
 * Key names are not case sensitive.
 * 
 * The value of this parameter cannot be <b>NULL</b>.
 * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
 * <dt><b>KEY_WOW64_32KEY</b></dt>
 * <dt>0x0200</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 32-bit registry view.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
 * <dt><b>KEY_WOW64_64KEY</b></dt>
 * <dt>0x0100</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 64-bit registry view.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {HANDLE} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeytransacteda
 * @since windows6.0.6000
 */
export RegDeleteKeyTransactedA(_hKey, lpSubKey, samDesired, hTransaction) {
    static Reserved := 0, pExtendedParameter := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteKeyTransactedA", HKEY, _hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, HANDLE, hTransaction, "ptr", pExtendedParameter, WIN32_ERROR)
    return result
}

/**
 * Deletes a subkey and its values from the specified platform-specific view of the registry as a transacted operation. (Unicode)
 * @remarks
 * A deleted key is not removed until the last handle to it is closed.
 * 
 * On WOW64, 32-bit applications view a registry tree that is separate from the registry tree that 64-bit applications view. This function enables an application to delete an entry in the alternate registry view.
 * 
 * The subkey to be deleted must not have subkeys. To delete a key and all its subkeys, you need to enumerate the subkeys and delete them individually. To delete keys recursively, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shdeletekeya">SHDeleteKey</a> function.
 * 
 * If the function succeeds, <b>RegDeleteKeyTransacted</b> removes the specified key from the registry. The entire key, including all of its values, is removed. To remove the entire tree as a transacted operation, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletetreea">RegDeleteTree</a> function with a handle returned from <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteKeyTransacted as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
 * 
 * The  function opens the subkey with the DELETE access right. 
 * 
 * Key names are not case sensitive.
 * 
 * The value of this parameter cannot be <b>NULL</b>.
 * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
 * <dt><b>KEY_WOW64_32KEY</b></dt>
 * <dt>0x0200</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 32-bit registry view.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
 * <dt><b>KEY_WOW64_64KEY</b></dt>
 * <dt>0x0100</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Delete the key from the 64-bit registry view.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {HANDLE} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeytransactedw
 * @since windows6.0.6000
 */
export RegDeleteKeyTransactedW(_hKey, lpSubKey, samDesired, hTransaction) {
    static Reserved := 0, pExtendedParameter := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteKeyTransactedW", HKEY, _hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, HANDLE, hTransaction, "ptr", pExtendedParameter, WIN32_ERROR)
    return result
}

/**
 * Disables registry reflection for the specified key. Disabling reflection for a key does not affect reflection of any subkeys.
 * @remarks
 * On WOW64, 32-bit applications view a registry tree that is separate from the registry tree that 64-bit applications view. Registry reflection copies specific registry keys and values between the two views.
 * 
 * To restore registry reflection for a disabled key, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenablereflectionkey">RegEnableReflectionKey</a> function.
 * @param {HKEY} hBase A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function; it cannot specify a key on a remote computer.
 * 
 * If the key is not on the reflection list, the function succeeds but has no effect. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-redirector">Registry Redirector</a> and <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-reflection">Registry Reflection</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdisablereflectionkey
 * @since windows6.0.6000
 */
export RegDisableReflectionKey(hBase) {
    result := DllCall("ADVAPI32.dll\RegDisableReflectionKey", HKEY, hBase, WIN32_ERROR)
    return result
}

/**
 * Restores registry reflection for the specified disabled key. Restoring reflection for a key does not affect reflection of any subkeys.
 * @remarks
 * On WOW64, 32-bit applications view a registry tree that is separate from the registry tree that 64-bit applications view. Registry reflection copies specific registry keys and values between the two views.
 * @param {HKEY} hBase A handle to the registry key that was previously disabled using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdisablereflectionkey">RegDisableReflectionKey</a> function. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function; it cannot specify a key on a remote computer.
 * 
 * If the key is not on the reflection list, this function succeeds but has no effect. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-redirector">Registry Redirector</a> and <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-reflection">Registry Reflection</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regenablereflectionkey
 * @since windows6.0.6000
 */
export RegEnableReflectionKey(hBase) {
    result := DllCall("ADVAPI32.dll\RegEnableReflectionKey", HKEY, hBase, WIN32_ERROR)
    return result
}

/**
 * Determines whether reflection has been disabled or enabled for the specified key.
 * @remarks
 * On WOW64, 32-bit applications view a registry tree that is separate from the registry tree that 64-bit 
 *     applications view. Registry reflection copies specific registry keys and values between the two views.
 * 
 * To disable registry reflection, use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdisablereflectionkey">RegDisableReflectionKey</a> function. To restore 
 *     reflection for a disabled key, use the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenablereflectionkey">RegEnableReflectionKey</a> function.
 * @param {HKEY} hBase A handle to the registry key.
 *       This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function; it cannot specify a key on a remote computer.
 * @param {Pointer<BOOL>} bIsReflectionDisabled A value that indicates whether reflection has been disabled through <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdisablereflectionkey">RegDisableReflectionKey</a> or enabled through <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenablereflectionkey">RegEnableReflectionKey</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the
 *        FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regqueryreflectionkey
 * @since windows6.0.6000
 */
export RegQueryReflectionKey(hBase, bIsReflectionDisabled) {
    bIsReflectionDisabledMarshal := bIsReflectionDisabled is VarRef ? "int*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryReflectionKey", HKEY, hBase, bIsReflectionDisabledMarshal, bIsReflectionDisabled, WIN32_ERROR)
    return result
}

/**
 * Removes a named value from the specified registry key. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * 
 * <pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PSTR} lpValueName The registry value to be removed. If this parameter is <b>NULL</b> or an empty string, the value set by the 
 * <a href="https://docs.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function is removed. 
 * 
 * 
 * 
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletevaluea
 * @since windows5.0
 */
export RegDeleteValueA(_hKey, lpValueName) {
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegDeleteValueA", HKEY, _hKey, "ptr", lpValueName, WIN32_ERROR)
    return result
}

/**
 * Removes a named value from the specified registry key. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * 
 * <pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PWSTR} lpValueName The registry value to be removed. If this parameter is <b>NULL</b> or an empty string, the value set by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvaluea">RegSetValue</a> function is removed. 
 * 
 * 
 * 
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletevaluew
 * @since windows5.0
 */
export RegDeleteValueW(_hKey, lpValueName) {
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegDeleteValueW", HKEY, _hKey, "ptr", lpValueName, WIN32_ERROR)
    return result
}

/**
 * Enumerates the subkeys of the specified open registry key. (RegEnumKeyA)
 * @remarks
 * To enumerate subkeys, an application should initially call the 
 * <b>RegEnumKey</b> function with the <i>dwIndex</i> parameter set to zero. The application should then increment the <i>dwIndex</i> parameter and call the 
 * <b>RegEnumKey</b> function until there are no more subkeys (meaning the function returns ERROR_NO_MORE_ITEMS).
 * 
 * The application can also set <i>dwIndex</i> to the index of the last key on the first call to the function and decrement the index until the subkey with index 0 is enumerated. To retrieve the index of the last subkey, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a>.
 * 
 * While an application is using the 
 * <b>RegEnumKey</b> function, it should not make calls to any registration functions that might change the key being queried.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegEnumKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Integer} dwIndex The index of the subkey of <i>hKey</i> to be retrieved. This value should be zero for the first call to the 
 * <b>RegEnumKey</b> function and then incremented for subsequent calls. 
 * 
 * 
 * 
 * 
 * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
 * @param {PSTR} lpName A pointer to a buffer that receives the name of the subkey, including the terminating null character. This function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
 * 
 * 
 * 
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} cchName The size of the buffer pointed to by the <i>lpName</i> parameter, in <b>TCHARs</b>. To determine the required buffer size, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
 * 
 * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regenumkeya
 * @since windows5.0
 */
export RegEnumKeyA(_hKey, dwIndex, lpName, cchName) {
    lpName := lpName is String ? StrPtr(lpName) : lpName

    result := DllCall("ADVAPI32.dll\RegEnumKeyA", HKEY, _hKey, "uint", dwIndex, "ptr", lpName, "uint", cchName, WIN32_ERROR)
    return result
}

/**
 * Enumerates the subkeys of the specified open registry key. (RegEnumKeyW)
 * @remarks
 * To enumerate subkeys, an application should initially call the 
 * <b>RegEnumKey</b> function with the <i>dwIndex</i> parameter set to zero. The application should then increment the <i>dwIndex</i> parameter and call the 
 * <b>RegEnumKey</b> function until there are no more subkeys (meaning the function returns ERROR_NO_MORE_ITEMS).
 * 
 * The application can also set <i>dwIndex</i> to the index of the last key on the first call to the function and decrement the index until the subkey with index 0 is enumerated. To retrieve the index of the last subkey, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a>.
 * 
 * While an application is using the 
 * <b>RegEnumKey</b> function, it should not make calls to any registration functions that might change the key being queried.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegEnumKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Integer} dwIndex The index of the subkey of <i>hKey</i> to be retrieved. This value should be zero for the first call to the 
 * <b>RegEnumKey</b> function and then incremented for subsequent calls. 
 * 
 * 
 * 
 * 
 * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
 * @param {PWSTR} lpName A pointer to a buffer that receives the name of the subkey, including the terminating null character. This function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
 * 
 * 
 * 
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} cchName The size of the buffer pointed to by the <i>lpName</i> parameter, in <b>TCHARs</b>. To determine the required buffer size, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
 * 
 * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regenumkeyw
 * @since windows5.0
 */
export RegEnumKeyW(_hKey, dwIndex, lpName, cchName) {
    lpName := lpName is String ? StrPtr(lpName) : lpName

    result := DllCall("ADVAPI32.dll\RegEnumKeyW", HKEY, _hKey, "uint", dwIndex, "ptr", lpName, "uint", cchName, WIN32_ERROR)
    return result
}

/**
 * Enumerates the subkeys of the specified open registry key. The function retrieves information about one subkey each time it is called. (ANSI)
 * @remarks
 * To enumerate subkeys, an application should initially call the 
 * <b>RegEnumKeyEx</b> function with the <i>dwIndex</i> parameter set to zero. The application should then increment the <i>dwIndex</i> parameter and call 
 * <b>RegEnumKeyEx</b> until there are no more subkeys (meaning the function returns ERROR_NO_MORE_ITEMS).
 * 
 * The application can also set <i>dwIndex</i> to the index of the last subkey on the first call to the function and decrement the index until the subkey with the index 0 is enumerated. To retrieve the index of the last subkey, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function.
 * 
 * While an application is using the 
 * <b>RegEnumKeyEx</b> function, it should not make calls to any registration functions that might change the key being enumerated.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Integer} dwIndex The index of the subkey to retrieve. This parameter should be zero for the first call to the 
 * <b>RegEnumKeyEx</b> function and then incremented for subsequent calls. 
 * 
 * 
 * 
 * 
 * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
 * @param {PSTR} lpName A pointer to a buffer that receives the name of the subkey, including the terminating <b>null</b> character. The function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
 * 
 * 
 * If the function fails, no information is copied to this buffer.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<Integer>} lpcchName A pointer to a variable that specifies the size of the buffer specified by the <i>lpName</i> parameter, in characters. This size should include the terminating <b>null</b> character. If the function succeeds, the variable pointed to by <i>lpcchName</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character.
 * 
 * To determine the required buffer size, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
 * @param {PSTR} lpClass A pointer to a buffer that receives the user-defined class of the enumerated subkey. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcchClass A pointer to a variable that specifies the size of the buffer specified by the <i>lpClass</i> parameter, in characters. The size should include the terminating <b>null</b> character. If the function succeeds, <i>lpcchClass</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b> only if <i>lpClass</i> is <b>NULL</b>.
 * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the time at which the enumerated subkey was last written. This parameter can be <b>NULL</b>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
 * 
 * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regenumkeyexa
 * @since windows5.0
 */
export RegEnumKeyExA(_hKey, dwIndex, lpName, lpcchName, lpClass, lpcchClass, lpftLastWriteTime) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpName := lpName is String ? StrPtr(lpName) : lpName
    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"
    lpcchClassMarshal := lpcchClass is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegEnumKeyExA", HKEY, _hKey, "uint", dwIndex, "ptr", lpName, lpcchNameMarshal, lpcchName, "uint*", lpReserved, "ptr", lpClass, lpcchClassMarshal, lpcchClass, FILETIME.Ptr, lpftLastWriteTime, WIN32_ERROR)
    return result
}

/**
 * Enumerates the subkeys of the specified open registry key. The function retrieves information about one subkey each time it is called. (Unicode)
 * @remarks
 * To enumerate subkeys, an application should initially call the 
 * <b>RegEnumKeyEx</b> function with the <i>dwIndex</i> parameter set to zero. The application should then increment the <i>dwIndex</i> parameter and call 
 * <b>RegEnumKeyEx</b> until there are no more subkeys (meaning the function returns ERROR_NO_MORE_ITEMS).
 * 
 * The application can also set <i>dwIndex</i> to the index of the last subkey on the first call to the function and decrement the index until the subkey with the index 0 is enumerated. To retrieve the index of the last subkey, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function.
 * 
 * While an application is using the 
 * <b>RegEnumKeyEx</b> function, it should not make calls to any registration functions that might change the key being enumerated.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Integer} dwIndex The index of the subkey to retrieve. This parameter should be zero for the first call to the 
 * <b>RegEnumKeyEx</b> function and then incremented for subsequent calls. 
 * 
 * 
 * 
 * 
 * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
 * @param {PWSTR} lpName A pointer to a buffer that receives the name of the subkey, including the terminating <b>null</b> character. The function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
 * 
 * 
 * If the function fails, no information is copied to this buffer.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<Integer>} lpcchName A pointer to a variable that specifies the size of the buffer specified by the <i>lpName</i> parameter, in characters. This size should include the terminating <b>null</b> character. If the function succeeds, the variable pointed to by <i>lpcName</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character.
 * 
 * To determine the required buffer size, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
 * @param {PWSTR} lpClass A pointer to a buffer that receives the user-defined class of the enumerated subkey. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcchClass A pointer to a variable that specifies the size of the buffer specified by the <i>lpClass</i> parameter, in characters. The size should include the terminating <b>null</b> character. If the function succeeds, <i>lpcClass</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b> only if <i>lpClass</i> is <b>NULL</b>.
 * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the time at which the enumerated subkey was last written. This parameter can be <b>NULL</b>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
 * 
 * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regenumkeyexw
 * @since windows5.0
 */
export RegEnumKeyExW(_hKey, dwIndex, lpName, lpcchName, lpClass, lpcchClass, lpftLastWriteTime) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpName := lpName is String ? StrPtr(lpName) : lpName
    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpcchNameMarshal := lpcchName is VarRef ? "uint*" : "ptr"
    lpcchClassMarshal := lpcchClass is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegEnumKeyExW", HKEY, _hKey, "uint", dwIndex, "ptr", lpName, lpcchNameMarshal, lpcchName, "uint*", lpReserved, "ptr", lpClass, lpcchClassMarshal, lpcchClass, FILETIME.Ptr, lpftLastWriteTime, WIN32_ERROR)
    return result
}

/**
 * Enumerates the values for the specified open registry key. The function copies one indexed value name and data block for the key each time it is called. (ANSI)
 * @remarks
 * To enumerate values, an application should initially call the 
 * <b>RegEnumValue</b> function with the <i>dwIndex</i> parameter set to zero. The application should then increment <i>dwIndex</i> and call the 
 * <b>RegEnumValue</b> function until there are no more values (until the function returns ERROR_NO_MORE_ITEMS).
 * 
 * The application can also set <i>dwIndex</i> to the index of the last value on the first call to the function and decrement the index until the value with index 0 is enumerated. To retrieve the index of the last value, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function.
 * 
 * While using 
 * <b>RegEnumValue</b>, an application should not call any registry functions that might change the key being queried.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, the string may not have been stored with the proper <b>null</b>-terminating characters.  Therefore, even if the function returns ERROR_SUCCESS, the application should ensure that the string is properly terminated before using it; otherwise, it may overwrite a buffer. (Note that REG_MULTI_SZ strings should have two <b>null</b>-terminating characters.)
 * 
 * To determine the maximum size of the name and data buffers, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function.
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Integer} dwIndex The index of the value to be retrieved. This parameter should be zero for the first call to the 
 * <b>RegEnumValue</b> function and then be incremented for subsequent calls. 
 * 
 * 
 * 
 * 
 * Because values are not ordered, any new value will have an arbitrary index. This means that the function may return values in any order.
 * @param {PSTR} lpValueName A pointer to a buffer that receives the name of the value as a <b>null</b>-terminated string. 
 * 
 * 
 * This buffer must be large enough to include the terminating <b>null</b> character. 
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<Integer>} lpcchValueName A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueName</i> parameter, in characters. When the function returns, the variable receives the number of characters stored in the buffer, not including the terminating <b>null</b> character.
 * 
 * If the buffer specified by <i>lpValueName</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and the buffer size in the variable pointed to by <i>lpValueName</i> is not changed. In this case, the contents of <i>lpcchValueName</i> are undefined.
 * 
 * Registry value names are limited to 32,767 bytes. The ANSI version of this function treats this parameter as a <b>SHORT</b> value. Therefore, if you specify a value greater than 32,767 bytes, there is an overflow and the function may return ERROR_MORE_DATA.
 * @param {Pointer<Integer>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
 * @param {Integer} lpData A pointer to a buffer that receives the data for the value entry. This parameter can be <b>NULL</b> if the data is not required. 
 * 
 * 
 * 
 * 
 * If <i>lpData</i> is <b>NULL</b> and <i>lpcbData</i> is non-<b>NULL</b>, the function stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the data.
 * @param {Pointer<Integer>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, the variable receives the number of bytes stored in the buffer. 
 * 
 * This parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
 * 
 * If the buffer specified by <i>lpData</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of <i>lpData</i> are undefined.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more values available, the function returns ERROR_NO_MORE_ITEMS.
 * 
 * If the buffer specified by <i>lpValueName</i> or <i>lpData</i> is too small to receive the value, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regenumvaluea
 * @since windows5.0
 */
export RegEnumValueA(_hKey, dwIndex, lpValueName, lpcchValueName, lpType, lpData, lpcbData) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    lpcchValueNameMarshal := lpcchValueName is VarRef ? "uint*" : "ptr"
    lpTypeMarshal := lpType is VarRef ? "uint*" : "ptr"
    lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegEnumValueA", HKEY, _hKey, "uint", dwIndex, "ptr", lpValueName, lpcchValueNameMarshal, lpcchValueName, "uint*", lpReserved, lpTypeMarshal, lpType, "ptr", lpData, lpcbDataMarshal, lpcbData, WIN32_ERROR)
    return result
}

/**
 * Enumerates the values for the specified open registry key. The function copies one indexed value name and data block for the key each time it is called. (Unicode)
 * @remarks
 * To enumerate values, an application should initially call the 
 * <b>RegEnumValue</b> function with the <i>dwIndex</i> parameter set to zero. The application should then increment <i>dwIndex</i> and call the 
 * <b>RegEnumValue</b> function until there are no more values (until the function returns ERROR_NO_MORE_ITEMS).
 * 
 * The application can also set <i>dwIndex</i> to the index of the last value on the first call to the function and decrement the index until the value with index 0 is enumerated. To retrieve the index of the last value, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function.
 * 
 * While using 
 * <b>RegEnumValue</b>, an application should not call any registry functions that might change the key being queried.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, the string may not have been stored with the proper <b>null</b>-terminating characters.  Therefore, even if the function returns ERROR_SUCCESS, the application should ensure that the string is properly terminated before using it; otherwise, it may overwrite a buffer. (Note that REG_MULTI_SZ strings should have two <b>null</b>-terminating characters.)
 * 
 * To determine the maximum size of the name and data buffers, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Integer} dwIndex The index of the value to be retrieved. This parameter should be zero for the first call to the 
 * <b>RegEnumValue</b> function and then be incremented for subsequent calls. 
 * 
 * 
 * 
 * 
 * Because values are not ordered, any new value will have an arbitrary index. This means that the function may return values in any order.
 * @param {PWSTR} lpValueName A pointer to a buffer that receives the name of the value as a <b>null</b>-terminated string. 
 * 
 * 
 * This buffer must be large enough to include the terminating <b>null</b> character. 
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<Integer>} lpcchValueName A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueName</i> parameter, in characters. When the function returns, the variable receives the number of characters stored in the buffer, not including the terminating <b>null</b> character.
 * 
 * Registry value names are limited to 32,767 bytes. The ANSI version of this function treats this parameter as a <b>SHORT</b> value. Therefore, if you specify a value greater than 32,767 bytes, there is an overflow and the function may return ERROR_MORE_DATA.
 * @param {Pointer<Integer>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
 * @param {Integer} lpData A pointer to a buffer that receives the data for the value entry. This parameter can be <b>NULL</b> if the data is not required. 
 * 
 * 
 * 
 * 
 * If <i>lpData</i> is <b>NULL</b> and <i>lpcbData</i> is non-<b>NULL</b>, the function stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the data.
 * @param {Pointer<Integer>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, the variable receives the number of bytes stored in the buffer. 
 * 
 * This parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
 * 
 * If the buffer specified by <i>lpData</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of <i>lpData</i> are undefined.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more values available, the function returns ERROR_NO_MORE_ITEMS.
 * 
 * If the <i>lpData</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regenumvaluew
 * @since windows5.0
 */
export RegEnumValueW(_hKey, dwIndex, lpValueName, lpcchValueName, lpType, lpData, lpcbData) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    lpcchValueNameMarshal := lpcchValueName is VarRef ? "uint*" : "ptr"
    lpTypeMarshal := lpType is VarRef ? "uint*" : "ptr"
    lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegEnumValueW", HKEY, _hKey, "uint", dwIndex, "ptr", lpValueName, lpcchValueNameMarshal, lpcchValueName, "uint*", lpReserved, lpTypeMarshal, lpType, "ptr", lpData, lpcbDataMarshal, lpcbData, WIN32_ERROR)
    return result
}

/**
 * Writes all the attributes of the specified open registry key into the registry.
 * @remarks
 * Calling <b>RegFlushKey</b> is an expensive operation that significantly affects system-wide performance as  it consumes disk bandwidth and blocks modifications to all keys by all processes in the registry hive that is being flushed until the flush operation completes. <b>RegFlushKey</b> should only be called explicitly when an application must guarantee that registry changes are persisted to disk immediately after modification. All modifications made to keys are visible to other processes without the need to flush them to disk.
 * 
 * Alternatively, the registry has a 'lazy flush' mechanism that flushes registry modifications to disk at regular intervals of time. In addition to this regular flush operation,  registry changes are also flushed to disk at system shutdown. Allowing the 'lazy flush' to flush registry changes is the most efficient way to manage registry writes to the registry store on  disk.
 * 
 * The 
 * <b>RegFlushKey</b> function returns only when all the data for the hive that contains the specified key has been written to the registry store on disk.
 * 
 * The 
 * <b>RegFlushKey</b> function writes out the data for other keys in the hive that have been modified since the last lazy flush or system start.
 * 
 *  After <b>RegFlushKey</b> returns, use <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> to close the handle to the registry key.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regflushkey
 * @since windows5.0
 */
export RegFlushKey(_hKey) {
    result := DllCall("ADVAPI32.dll\RegFlushKey", HKEY, _hKey, WIN32_ERROR)
    return result
}

/**
 * Retrieves a copy of the security descriptor protecting the specified open registry key.
 * @remarks
 * If the buffer specified by the <i>pSecurityDescriptor</i> parameter is too small, the function returns ERROR_INSUFFICIENT_BUFFER and the <i>lpcbSecurityDescriptor</i> parameter contains the number of bytes required for the requested security descriptor.
 * 
 * To read the owner, group, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) from the key's security descriptor, the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> must have been granted READ_CONTROL access when the handle was opened. To get READ_CONTROL access, the caller must be the owner of the key or the key's DACL must grant the access.
 * 
 * To read the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) from the security descriptor, the calling process must have been granted ACCESS_SYSTEM_SECURITY access when the key was opened. The correct way to get this access is to enable the SE_SECURITY_NAME privilege in the caller's current token, open the handle for ACCESS_SYSTEM_SECURITY access, and then disable the privilege.
 * @param {HKEY} _hKey A handle to an open key for which to retrieve the security descriptor.
 * @param {OBJECT_SECURITY_INFORMATION} SecurityInformation A 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that indicates the requested security information.
 * @param {Integer} pSecurityDescriptor A pointer to a buffer that receives a copy of the requested security descriptor.
 * @param {Pointer<Integer>} lpcbSecurityDescriptor A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the <i>pSecurityDescriptor</i> parameter. When the function returns, the variable contains the number of bytes written to the buffer.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 						
 * 
 * If the function fails, it returns a nonzero error code defined in WinError.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-reggetkeysecurity
 * @since windows5.1.2600
 */
export RegGetKeySecurity(_hKey, SecurityInformation, pSecurityDescriptor, lpcbSecurityDescriptor) {
    lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegGetKeySecurity", HKEY, _hKey, OBJECT_SECURITY_INFORMATION, SecurityInformation, "ptr", pSecurityDescriptor, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, WIN32_ERROR)
    return result
}

/**
 * Creates a subkey under HKEY_USERS or HKEY_LOCAL_MACHINE and loads the data from the specified registry hive into that subkey. (ANSI)
 * @remarks
 * There are two  registry hive file formats. Registry hives created on current operating systems typically cannot be loaded by earlier ones.
 * 
 * If <i>hKey</i> is a handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, then the path specified in <i>lpFile</i> is relative to the remote computer.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>. To load a hive without requiring these special privileges, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadappkeya">RegLoadAppKey</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegLoadKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to the key where the subkey will be created. This can be a handle returned by a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, or one of the following predefined handles: 
 * 
 * 
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * This function always loads information at the top of the registry hierarchy. The <b>HKEY_CLASSES_ROOT</b> and <b>HKEY_CURRENT_USER</b> handle values cannot be specified for this parameter, because they represent subsets of the <b>HKEY_LOCAL_MACHINE</b> and <b>HKEY_USERS</b> handle values, respectively.
 * @param {PSTR} lpSubKey The name of the key to be created under <i>hKey</i>. This subkey is where the registration information from the file will be loaded. 
 * 
 * 
 * 
 * 
 * Key names are not case sensitive.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {PSTR} lpFile The name of the  file containing the registry data. This file must be a local file that was created with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function. If this file does not exist, a file is created with the specified name.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regloadkeya
 * @since windows5.0
 */
export RegLoadKeyA(_hKey, lpSubKey, lpFile) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegLoadKeyA", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpFile, WIN32_ERROR)
    return result
}

/**
 * Creates a subkey under HKEY_USERS or HKEY_LOCAL_MACHINE and loads the data from the specified registry hive into that subkey. (Unicode)
 * @remarks
 * There are two  registry hive file formats. Registry hives created on current operating systems typically cannot be loaded by earlier ones.
 * 
 * If <i>hKey</i> is a handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, then the path specified in <i>lpFile</i> is relative to the remote computer.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>. To load a hive without requiring these special privileges, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadappkeya">RegLoadAppKey</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegLoadKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to the key where the subkey will be created. This can be a handle returned by a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, or one of the following predefined handles: 
 * 
 * 
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * This function always loads information at the top of the registry hierarchy. The <b>HKEY_CLASSES_ROOT</b> and <b>HKEY_CURRENT_USER</b> handle values cannot be specified for this parameter, because they represent subsets of the <b>HKEY_LOCAL_MACHINE</b> and <b>HKEY_USERS</b> handle values, respectively.
 * @param {PWSTR} lpSubKey The name of the key to be created under <i>hKey</i>. This subkey is where the registration information from the file will be loaded. 
 * 
 * 
 * 
 * 
 * Key names are not case sensitive.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {PWSTR} lpFile The name of the  file containing the registry data. This file must be a local file that was created with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function. If this file does not exist, a file is created with the specified name.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regloadkeyw
 * @since windows5.0
 */
export RegLoadKeyW(_hKey, lpSubKey, lpFile) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegLoadKeyW", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpFile, WIN32_ERROR)
    return result
}

/**
 * Notifies the caller about changes to the attributes or contents of a specified registry key.
 * @remarks
 * This function detects a single change. After the caller receives a notification event, it should call the function again to receive the next notification.
 * 
 * <div class="alert"><b>Note</b>  On Windows NT, Windows 2000, and Windows XP calling <b>RegNotifyChangeKeyValue</b> for a particular key handle causes change notifications to continue to occur for as long as the key handle is valid. This causes a second call to <b>RegNotifyChangeKeyValue</b> to return immediately, if any changes have occurred in the interim period between the first and second calls. If the API is being used asynchronously, the passed event handle will be signaled immediately if any interim changes have occurred.</div>
 * <div> </div>
 * This function cannot be used to detect changes to the registry that result from using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> function.
 * 
 * If the specified key is closed, the event is signaled. This means that an application should not depend on the key being open after returning from a wait operation on the event.
 * 
 * The <b>REG_NOTIFY_THREAD_AGNOSTIC</b> flag introduced in Windows 8 enables the use of <b>RegNotifyChangeKeyValue</b> for ThreadPool threads.
 * 
 * If the thread that called 
 * <b>RegNotifyChangeKeyValue</b> exits, the event is signaled. To continue to monitor additional changes in the value of the key, call 
 * <b>RegNotifyChangeKeyValue</b> again from another thread.
 * 				
 * 
 * With the exception of <b>RegNotifyChangeKeyValue</b> calls with <b>REG_NOTIFY_THREAD_AGNOSTIC</b> set, this function must be called on persistent threads. If the calling thread is from a thread pool and it is not persistent, the event is signaled every time the thread terminates, not just when there is a registry change. To ensure accurate results, run the thread pool work in a persistent thread by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbackpersistent">SetThreadpoolCallbackPersistent</a> function, or create your own thread using the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createthread">CreateThread</a>  function. (For the original thread pool API, specify WT_EXECUTEINPERSISTENTTHREAD using the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-queueuserworkitem">QueueUserWorkItem</a> function.) 
 * 
 * This function should not be called multiple times with the same  value for the <i>hKey</i> but different values for the <i>bWatchSubtree</i> and <i>dwNotifyFilter</i> parameters. The function will succeed but the changes will be ignored. To change the  
 * watch parameters, you must first close the key handle by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a>, reopen the key handle by calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, and then call <b>RegNotifyChangeKeyValue</b> with the new parameters. 
 * 
 * Each time a process calls <b>RegNotifyChangeKeyValue</b> with the same set of parameters, it establishes another wait operation, creating a resource leak. Therefore, check that you are not calling <b>RegNotifyChangeKeyValue</b> with the same parameters until the previous wait operation has completed.
 * 
 * To monitor registry operations in more detail, see <a href="https://docs.microsoft.com/windows/desktop/ETW/registry">Registry</a>.
 * 
 * <b>Windows XP/2000:  </b>When <b>RegNotifyChangeKeyValue</b> is called for a particular key handle, change notifications occur for as long as the key handle is valid. This causes a second call to <b>RegNotifyChangeKeyValue</b> to return immediately, if any changes occur in the interim between the first and second calls. If the function is being used asynchronously, the passed event handle will be signaled immediately if any changes occur in the interim.
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * 
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_CONFIG</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * This parameter must be a local handle. If 
 * <b>RegNotifyChangeKeyValue</b> is called with a remote handle, it returns ERROR_INVALID_HANDLE.
 * 
 * The key must have been opened with the KEY_NOTIFY access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {BOOL} bWatchSubtree If this parameter is TRUE, the function reports changes in the specified key and its subkeys. If the parameter is <b>FALSE</b>, the function reports changes only in the specified key.
 * @param {REG_NOTIFY_FILTER} dwNotifyFilter 
 * @param {HANDLE} hEvent A handle to an event. If the <i>fAsynchronous</i> parameter is <b>TRUE</b>, the function returns immediately and changes are reported by signaling this event. If <i>fAsynchronous</i> is <b>FALSE</b>, <i>hEvent</i> is ignored.
 * @param {BOOL} fAsynchronous If this parameter is <b>TRUE</b>, the function returns immediately and reports changes by signaling the specified event. If this parameter is <b>FALSE</b>, the function does not return until a change has occurred. 
 * 
 * 
 * 
 * 
 * If <i>hEvent</i> does not specify a valid event, the <i>fAsynchronous</i> parameter cannot be <b>TRUE</b>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regnotifychangekeyvalue
 * @since windows5.0
 */
export RegNotifyChangeKeyValue(_hKey, bWatchSubtree, dwNotifyFilter, hEvent, fAsynchronous) {
    result := DllCall("ADVAPI32.dll\RegNotifyChangeKeyValue", HKEY, _hKey, BOOL, bWatchSubtree, REG_NOTIFY_FILTER, dwNotifyFilter, HANDLE, hEvent, BOOL, fAsynchronous, WIN32_ERROR)
    return result
}

/**
 * Opens the specified registry key. (ANSI)
 * @remarks
 * The 
 * <b>RegOpenKey</b> function uses the default security access mask to open a key. If opening the key requires a different access right, the function fails, returning ERROR_ACCESS_DENIED. An application should use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function to specify an access mask in this situation.
 * 
 * <b>RegOpenKey</b> does not create the specified key if the key does not exist in the database.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegOpenKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * * <b>HKEY_CLASSES_ROOT</b>
 * * <b>HKEY_CURRENT_CONFIG</b>
 * * <b>HKEY_CURRENT_USER</b>
 * * <b>HKEY_LOCAL_MACHINE</b>
 * * <b>HKEY_USERS</b>
 * @param {PSTR} lpSubKey The name of the registry key to be opened. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
 * 
 * Key names are not case sensitive.
 * 
 * If this parameter is <b>NULL</b> or a pointer to an empty string, the function returns the same handle that was passed in.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopenkeya
 * @since windows5.0
 */
export RegOpenKeyA(_hKey, lpSubKey, phkResult) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegOpenKeyA", HKEY, _hKey, "ptr", lpSubKey, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Opens the specified registry key. (Unicode)
 * @remarks
 * The 
 * <b>RegOpenKey</b> function uses the default security access mask to open a key. If opening the key requires a different access right, the function fails, returning ERROR_ACCESS_DENIED. An application should use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function to specify an access mask in this situation.
 * 
 * <b>RegOpenKey</b> does not create the specified key if the key does not exist in the database.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegOpenKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * * <b>HKEY_CLASSES_ROOT</b>
 * * <b>HKEY_CURRENT_CONFIG</b>
 * * <b>HKEY_CURRENT_USER</b>
 * * <b>HKEY_LOCAL_MACHINE</b>
 * * <b>HKEY_USERS</b>
 * @param {PWSTR} lpSubKey The name of the registry key to be opened. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
 * 
 * Key names are not case sensitive.
 * 
 * If this parameter is <b>NULL</b> or a pointer to an empty string, the function returns the same handle that was passed in.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopenkeyw
 * @since windows5.0
 */
export RegOpenKeyW(_hKey, lpSubKey, phkResult) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegOpenKeyW", HKEY, _hKey, "ptr", lpSubKey, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Opens the specified registry key. Note that key names are not case sensitive. (ANSI)
 * @remarks
 * Unlike the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> function, the 
 * <b>RegOpenKeyEx</b> function does not create the specified key if the key does not exist in the registry.
 * 
 * Certain registry operations perform access checks against the security descriptor of the key, not the access mask specified when the handle to the key was obtained. For example, even if a key is opened with a <i>samDesired</i> of KEY_READ, it can be used to create registry keys if the key's security descriptor permits. In contrast, the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function specifically requires that the key be opened with the KEY_SET_VALUE access right.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <b>RegOpenKeyEx</b> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * 
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_CONFIG</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * @param {PSTR} lpSubKey The name of the registry subkey to be opened. 
 * 
 * Key names are not case sensitive.
 * 
 * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
 * and if <i>hKey</i> is a predefined key,
 * then the system refreshes the predefined key,
 * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
 * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} ulOptions Specifies the option to apply when opening the key. Set this parameter to zero or the following:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_OPTION_OPEN_LINK"></a><a id="reg_option_open_link"></a><dl>
 * <dt><b>REG_OPTION_OPEN_LINK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key is a symbolic link. Registry symbolic links should only be used when absolutely necessary.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the desired access rights to the key to be opened. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopenkeyexa
 * @since windows5.0
 */
export RegOpenKeyExA(_hKey, lpSubKey, ulOptions, samDesired, phkResult) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegOpenKeyExA", HKEY, _hKey, "ptr", lpSubKey, "uint", ulOptions, REG_SAM_FLAGS, samDesired, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Opens the specified registry key. Note that key names are not case sensitive. (Unicode)
 * @remarks
 * Unlike the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> function, the 
 * <b>RegOpenKeyEx</b> function does not create the specified key if the key does not exist in the registry.
 * 
 * Certain registry operations perform access checks against the security descriptor of the key, not the access mask specified when the handle to the key was obtained. For example, even if a key is opened with a <i>samDesired</i> of KEY_READ, it can be used to create registry keys if the key's security descriptor permits. In contrast, the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function specifically requires that the key be opened with the KEY_SET_VALUE access right.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <b>RegOpenKeyEx</b> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * 
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_CONFIG</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * @param {PWSTR} lpSubKey The name of the registry subkey to be opened. 
 * 
 * Key names are not case sensitive.
 * 
 * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
 * and if <i>hKey</i> is a predefined key,
 * then the system refreshes the predefined key,
 * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
 * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} ulOptions Specifies the option to apply when opening the key. Set this parameter to zero or the following:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_OPTION_OPEN_LINK"></a><a id="reg_option_open_link"></a><dl>
 * <dt><b>REG_OPTION_OPEN_LINK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The key is a symbolic link. Registry symbolic links should only be used when absolutely necessary.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the desired access rights to the key to be opened. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopenkeyexw
 * @since windows5.0
 */
export RegOpenKeyExW(_hKey, lpSubKey, ulOptions, samDesired, phkResult) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegOpenKeyExW", HKEY, _hKey, "ptr", lpSubKey, "uint", ulOptions, REG_SAM_FLAGS, samDesired, HKEY.Ptr, phkResult, WIN32_ERROR)
    return result
}

/**
 * Opens the specified registry key and associates it with a transaction. (ANSI)
 * @remarks
 * When a key is opened using this function, subsequent operations on the key are transacted. If a non-transacted operation is performed on the key before the transaction is committed, the transaction is rolled back. After a transaction is committed or rolled back, you must re-open the key using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a> or <b>RegOpenKeyTransacted</b> function with an active transaction handle to make additional operations transacted. For more information about transactions, see <a href="https://docs.microsoft.com/windows/desktop/Ktm/kernel-transaction-manager-portal">Kernel Transaction Manager</a>.
 * 
 * Note that subsequent operations on subkeys of this key are not automatically transacted. Therefore,  the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeyexa">RegDeleteKeyEx</a> function does not perform a transacted delete operation. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeytransacteda">RegDeleteKeyTransacted</a> function to perform a transacted delete operation.
 * 
 * Unlike the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a> function, the 
 * <b>RegOpenKeyTransacted</b> function does not create the specified key if the key does not exist in the registry.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * If the key returned in <i>phkResult</i> is a predefined registry key, it is not included in the provided transaction.
 * 
 * A single registry key can be opened only 65,534 times. When attempting the 65,535<sup>th</sup> open operation, this function fails with ERROR_NO_SYSTEM_RESOURCES.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegOpenKeyTransacted as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 *  <b>RegOpenKeyTransacted</b> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * @param {PSTR} lpSubKey The name of the registry subkey to be opened. 
 * 
 * Key names are not case sensitive.
 * 
 * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
 * and if <i>hKey</i> is a predefined key,
 * then the system refreshes the predefined key,
 * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
 * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} ulOptions This parameter is reserved and must be zero.
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @param {HANDLE} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopenkeytransacteda
 * @since windows6.0.6000
 */
export RegOpenKeyTransactedA(_hKey, lpSubKey, ulOptions, samDesired, phkResult, hTransaction) {
    static pExtendedParemeter := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegOpenKeyTransactedA", HKEY, _hKey, "ptr", lpSubKey, "uint", ulOptions, REG_SAM_FLAGS, samDesired, HKEY.Ptr, phkResult, HANDLE, hTransaction, "ptr", pExtendedParemeter, WIN32_ERROR)
    return result
}

/**
 * Opens the specified registry key and associates it with a transaction. (Unicode)
 * @remarks
 * When a key is opened using this function, subsequent operations on the key are transacted. If a non-transacted operation is performed on the key before the transaction is committed, the transaction is rolled back. After a transaction is committed or rolled back, you must re-open the key using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a> or <b>RegOpenKeyTransacted</b> function with an active transaction handle to make additional operations transacted. For more information about transactions, see <a href="https://docs.microsoft.com/windows/desktop/Ktm/kernel-transaction-manager-portal">Kernel Transaction Manager</a>.
 * 
 * Note that subsequent operations on subkeys of this key are not automatically transacted. Therefore,  the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeyexa">RegDeleteKeyEx</a> function does not perform a transacted delete operation. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdeletekeytransacteda">RegDeleteKeyTransacted</a> function to perform a transacted delete operation.
 * 
 * Unlike the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a> function, the 
 * <b>RegOpenKeyTransacted</b> function does not create the specified key if the key does not exist in the registry.
 * 
 * If your service or application impersonates different users, do not use this function with <b>HKEY_CURRENT_USER</b>. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopencurrentuser">RegOpenCurrentUser</a> function.
 * 
 * If the key returned in <i>phkResult</i> is a predefined registry key, it is not included in the provided transaction.
 * 
 * A single registry key can be opened only 65,534 times. When attempting the 65,535<sup>th</sup> open operation, this function fails with ERROR_NO_SYSTEM_RESOURCES.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegOpenKeyTransacted as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 *  <b>RegOpenKeyTransacted</b> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * @param {PWSTR} lpSubKey The name of the registry subkey to be opened. 
 * 
 * Key names are not case sensitive.
 * 
 * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
 * and if <i>hKey</i> is a predefined key,
 * then the system refreshes the predefined key,
 * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
 * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} ulOptions This parameter is reserved and must be zero.
 * @param {REG_SAM_FLAGS} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Pointer<HKEY>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
 * @param {HANDLE} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regopenkeytransactedw
 * @since windows6.0.6000
 */
export RegOpenKeyTransactedW(_hKey, lpSubKey, ulOptions, samDesired, phkResult, hTransaction) {
    static pExtendedParemeter := 0 ;Reserved parameters must always be NULL

    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegOpenKeyTransactedW", HKEY, _hKey, "ptr", lpSubKey, "uint", ulOptions, REG_SAM_FLAGS, samDesired, HKEY.Ptr, phkResult, HANDLE, hTransaction, "ptr", pExtendedParemeter, WIN32_ERROR)
    return result
}

/**
 * Retrieves information about the specified registry key. (ANSI)
 * @remarks
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_PERFORMANCE_DATA</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PSTR} lpClass A pointer to a buffer that receives the user-defined class of the key. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcchClass A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpClass</i> parameter, in characters. 
 * 
 * The size should include the terminating <b>null</b> character. When the function returns, this variable contains the size of the class string that is stored in the buffer. The count returned does not include the terminating <b>null</b> character. If the buffer is not big enough, the function returns ERROR_MORE_DATA, and the variable contains the size of the string, in characters, without counting the terminating <b>null</b> character.
 * 
 * If <i>lpClass</i> is <b>NULL</b>, <i>lpcClass</i> can be <b>NULL</b>.
 * 
 * If the <i>lpClass</i> parameter is a valid address, but the <i>lpcClass</i> parameter is not, for example, it is <b>NULL</b>, then the  function returns ERROR_INVALID_PARAMETER.
 * @param {Pointer<Integer>} lpcSubKeys A pointer to a variable that receives the number of subkeys that are contained by the specified key. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxSubKeyLen A pointer to a variable that receives the size of the key's subkey with the longest name, in ANSI characters, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxClassLen A pointer to a variable that receives the size of the longest string that specifies a subkey class, in ANSI characters. The count returned does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcValues A pointer to a variable that receives the number of values that are associated with the key. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxValueNameLen A pointer to a variable that receives the size of the key's longest value name, in ANSI characters. The size does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxValueLen A pointer to a variable that receives the size of the longest data component among the key's values, in bytes. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbSecurityDescriptor A pointer to a variable that receives the size of the key's security descriptor, in bytes. This parameter can be <b>NULL</b>.
 * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the last write time. This parameter can be <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * The function sets the members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to indicate the last time that the key or any of its value entries is modified.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>lpClass</i> buffer is too small to receive the name of the class, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regqueryinfokeya
 * @since windows5.0
 */
export RegQueryInfoKeyA(_hKey, lpClass, lpcchClass, lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpcchClassMarshal := lpcchClass is VarRef ? "uint*" : "ptr"
    lpcSubKeysMarshal := lpcSubKeys is VarRef ? "uint*" : "ptr"
    lpcbMaxSubKeyLenMarshal := lpcbMaxSubKeyLen is VarRef ? "uint*" : "ptr"
    lpcbMaxClassLenMarshal := lpcbMaxClassLen is VarRef ? "uint*" : "ptr"
    lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
    lpcbMaxValueNameLenMarshal := lpcbMaxValueNameLen is VarRef ? "uint*" : "ptr"
    lpcbMaxValueLenMarshal := lpcbMaxValueLen is VarRef ? "uint*" : "ptr"
    lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryInfoKeyA", HKEY, _hKey, "ptr", lpClass, lpcchClassMarshal, lpcchClass, "uint*", lpReserved, lpcSubKeysMarshal, lpcSubKeys, lpcbMaxSubKeyLenMarshal, lpcbMaxSubKeyLen, lpcbMaxClassLenMarshal, lpcbMaxClassLen, lpcValuesMarshal, lpcValues, lpcbMaxValueNameLenMarshal, lpcbMaxValueNameLen, lpcbMaxValueLenMarshal, lpcbMaxValueLen, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, FILETIME.Ptr, lpftLastWriteTime, WIN32_ERROR)
    return result
}

/**
 * Retrieves information about the specified registry key. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winreg.h header defines RegQueryInfoKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_PERFORMANCE_DATA</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PWSTR} lpClass A pointer to a buffer that receives the user-defined class of the key. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcchClass A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpClass</i> parameter, in characters. 
 * 
 * The size should include the terminating <b>null</b> character. When the function returns, this variable contains the size of the class string that is stored in the buffer. The count returned does not include the terminating <b>null</b> character. If the buffer is not big enough, the function returns ERROR_MORE_DATA, and the variable contains the size of the string, in characters, without counting the terminating <b>null</b> character.
 * 
 * If <i>lpClass</i> is <b>NULL</b>, <i>lpcClass</i> can be <b>NULL</b>.
 * 
 * If the <i>lpClass</i> parameter is a valid address, but the <i>lpcClass</i> parameter is not, for example, it is <b>NULL</b>, then the  function returns ERROR_INVALID_PARAMETER.
 * @param {Pointer<Integer>} lpcSubKeys A pointer to a variable that receives the number of subkeys that are contained by the specified key. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxSubKeyLen A pointer to a variable that receives the size of the key's subkey with the longest name, in Unicode characters, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxClassLen A pointer to a variable that receives the size of the longest string that specifies a subkey class, in Unicode characters. The count returned does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcValues A pointer to a variable that receives the number of values that are associated with the key. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxValueNameLen A pointer to a variable that receives the size of the key's longest value name, in Unicode characters. The size does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbMaxValueLen A pointer to a variable that receives the size of the longest data component among the key's values, in bytes. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} lpcbSecurityDescriptor A pointer to a variable that receives the size of the key's security descriptor, in bytes. This parameter can be <b>NULL</b>.
 * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the last write time. This parameter can be <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * The function sets the members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to indicate the last time that the key or any of its value entries is modified.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>lpClass</i> buffer is too small to receive the name of the class, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regqueryinfokeyw
 * @since windows5.0
 */
export RegQueryInfoKeyW(_hKey, lpClass, lpcchClass, lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpClass := lpClass is String ? StrPtr(lpClass) : lpClass

    lpcchClassMarshal := lpcchClass is VarRef ? "uint*" : "ptr"
    lpcSubKeysMarshal := lpcSubKeys is VarRef ? "uint*" : "ptr"
    lpcbMaxSubKeyLenMarshal := lpcbMaxSubKeyLen is VarRef ? "uint*" : "ptr"
    lpcbMaxClassLenMarshal := lpcbMaxClassLen is VarRef ? "uint*" : "ptr"
    lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"
    lpcbMaxValueNameLenMarshal := lpcbMaxValueNameLen is VarRef ? "uint*" : "ptr"
    lpcbMaxValueLenMarshal := lpcbMaxValueLen is VarRef ? "uint*" : "ptr"
    lpcbSecurityDescriptorMarshal := lpcbSecurityDescriptor is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryInfoKeyW", HKEY, _hKey, "ptr", lpClass, lpcchClassMarshal, lpcchClass, "uint*", lpReserved, lpcSubKeysMarshal, lpcSubKeys, lpcbMaxSubKeyLenMarshal, lpcbMaxSubKeyLen, lpcbMaxClassLenMarshal, lpcbMaxClassLen, lpcValuesMarshal, lpcValues, lpcbMaxValueNameLenMarshal, lpcbMaxValueNameLen, lpcbMaxValueLenMarshal, lpcbMaxValueLen, lpcbSecurityDescriptorMarshal, lpcbSecurityDescriptor, FILETIME.Ptr, lpftLastWriteTime, WIN32_ERROR)
    return result
}

/**
 * Retrieves the data associated with the default or unnamed value of a specified registry key. The data must be a null-terminated string. (ANSI)
 * @remarks
 * If the ANSI version of this function is used (either by explicitly calling <b>RegQueryValueA</b> or by not defining UNICODE before including the Windows.h file), this function converts the stored Unicode string to an ANSI string before copying it to the buffer specified by the <i>lpValue</i> parameter.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, the string may not have been stored with the proper <b>null</b>-terminating characters.  Therefore, even if the function returns ERROR_SUCCESS, the application should ensure that the string is properly terminated before using it; otherwise, it may overwrite a buffer. (Note that REG_MULTI_SZ strings should have two <b>null</b>-terminating characters.)
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegQueryValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of the subkey of the <i>hKey</i> parameter for which the default value is retrieved. 
 * 
 * Key names are not case sensitive.
 * 
 * If this parameter is <b>NULL</b> or points to an empty string, the function retrieves the default value for the key identified by <i>hKey</i>.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} lpData A pointer to a buffer that receives the default value of the specified key. 
 * 
 * 
 * 
 * 
 * If <i>lpValue</i> is <b>NULL</b>, and <i>lpcbValue</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS, and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbValue</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
 * @param {Pointer<Integer>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValue</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpValue</i>, including any terminating <b>null</b> characters. 
 * 
 * 
 * 
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
 * 
 * If the buffer specified <i>lpValue</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbValue</i>. In this case, the contents of the <i>lpValue</i> buffer are undefined.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>lpValue</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regqueryvaluea
 * @since windows5.0
 */
export RegQueryValueA(_hKey, lpSubKey, lpData, lpcbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    lpcbDataMarshal := lpcbData is VarRef ? "int*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryValueA", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpData, lpcbDataMarshal, lpcbData, WIN32_ERROR)
    return result
}

/**
 * Retrieves the data associated with the default or unnamed value of a specified registry key. The data must be a null-terminated string. (Unicode)
 * @remarks
 * If the ANSI version of this function is used (either by explicitly calling <b>RegQueryValueA</b> or by not defining UNICODE before including the Windows.h file), this function converts the stored Unicode string to an ANSI string before copying it to the buffer specified by the <i>lpValue</i> parameter.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, the string may not have been stored with the proper <b>null</b>-terminating characters.  Therefore, even if the function returns ERROR_SUCCESS, the application should ensure that the string is properly terminated before using it; otherwise, it may overwrite a buffer. (Note that REG_MULTI_SZ strings should have two <b>null</b>-terminating characters.)
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegQueryValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of the subkey of the <i>hKey</i> parameter for which the default value is retrieved. 
 * 
 * Key names are not case sensitive.
 * 
 * If this parameter is <b>NULL</b> or points to an empty string, the function retrieves the default value for the key identified by <i>hKey</i>.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Integer} lpData A pointer to a buffer that receives the default value of the specified key. 
 * 
 * 
 * 
 * 
 * If <i>lpValue</i> is <b>NULL</b>, and <i>lpcbValue</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS, and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbValue</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
 * @param {Pointer<Integer>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValue</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpValue</i>, including any terminating <b>null</b> characters. 
 * 
 * 
 * 
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
 * 
 * If the buffer specified <i>lpValue</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbValue</i>. In this case, the contents of the <i>lpValue</i> buffer are undefined.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>lpValue</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regqueryvaluew
 * @since windows5.0
 */
export RegQueryValueW(_hKey, lpSubKey, lpData, lpcbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    lpcbDataMarshal := lpcbData is VarRef ? "int*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryValueW", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpData, lpcbDataMarshal, lpcbData, WIN32_ERROR)
    return result
}

/**
 * Retrieves the type and data for a list of value names associated with an open registry key. (ANSI)
 * @remarks
 * The 
 * <b>RegQueryMultipleValues</b> function allows an application to query one or more values of a static or dynamic key. If the target key is a static key, the system provides all of the values in an atomic fashion. To prevent excessive serialization, the aggregate data returned by the function cannot exceed one megabyte.
 * 
 * If the target key is a dynamic key, its provider must provide all the values in an atomic fashion. This means the provider should fill the results buffer synchronously, providing a consistent view of all the values in the buffer while avoiding excessive serialization. The provider can provide at most one megabyte of total output data during an atomic call to this function.
 * 
 * <b>RegQueryMultipleValues</b> is supported remotely; that is, the <i>hKey</i> parameter passed to the function can refer to a remote computer.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegQueryMultipleValues as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * 
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Pointer<VALENTA>} val_list A pointer to an array of 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/ns-winreg-valenta">VALENT</a> structures that describe one or more value entries. On input, the <b>ve_valuename</b> member of each structure must contain a pointer to the name of a value to retrieve. The function fails if any of the specified values do not exist in the specified key. 
 * 
 * 
 * 
 * 
 * If the function succeeds, each element of the array contains the information for the specified value.
 * @param {Integer} num_vals The number of elements in the <i>val_list</i> array.
 * @param {Integer} lpValueBuf A pointer to a buffer. If the function succeeds, the buffer receives the data for each value. 
 * 
 * 
 * 
 * 
 * If <i>lpValueBuf</i> is <b>NULL</b>, the value pointed to by the <i>ldwTotsize</i> parameter must be zero, in which case the function returns ERROR_MORE_DATA and <i>ldwTotsize</i> receives the required size of the buffer, in bytes.
 * @param {Pointer<Integer>} ldwTotsize A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueBuf</i> parameter, in bytes. If the function succeeds, <i>ldwTotsize</i> receives the number of bytes copied to the buffer. If the function fails because the buffer is too small, <i>ldwTotsize</i> receives the required size, in bytes.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANTREAD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a> cannot instantiate or access the provider of the dynamic key.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer pointed to by <i>lpValueBuf</i> was too small. In this case, <i>ldwTotsize</i> receives the required buffer size.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TRANSFER_TOO_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The total size of the requested data (size of the <i>val_list</i> array + <i>ldwTotSize</i>) is more than the system limit of one megabyte.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regquerymultiplevaluesa
 * @since windows5.0
 */
export RegQueryMultipleValuesA(_hKey, val_list, num_vals, lpValueBuf, ldwTotsize) {
    ldwTotsizeMarshal := ldwTotsize is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryMultipleValuesA", HKEY, _hKey, VALENTA.Ptr, val_list, "uint", num_vals, "ptr", lpValueBuf, ldwTotsizeMarshal, ldwTotsize, WIN32_ERROR)
    return result
}

/**
 * Retrieves the type and data for a list of value names associated with an open registry key. (Unicode)
 * @remarks
 * The 
 * <b>RegQueryMultipleValues</b> function allows an application to query one or more values of a static or dynamic key. If the target key is a static key, the system provides all of the values in an atomic fashion. To prevent excessive serialization, the aggregate data returned by the function cannot exceed one megabyte.
 * 
 * If the target key is a dynamic key, its provider must provide all the values in an atomic fashion. This means the provider should fill the results buffer synchronously, providing a consistent view of all the values in the buffer while avoiding excessive serialization. The provider can provide at most one megabyte of total output data during an atomic call to this function.
 * 
 * <b>RegQueryMultipleValues</b> is supported remotely; that is, the <i>hKey</i> parameter passed to the function can refer to a remote computer.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegQueryMultipleValues as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {Pointer<VALENTW>} val_list A pointer to an array of 
 * [VALENT](./ns-winreg-valentw.md) structures that describe one or more value entries. On input, the <b>ve_valuename</b> member of each structure must contain a pointer to the name of a value to retrieve. The function fails if any of the specified values do not exist in the specified key. 
 * 
 * 
 * 
 * 
 * If the function succeeds, each element of the array contains the information for the specified value.
 * @param {Integer} num_vals The number of elements in the <i>val_list</i> array.
 * @param {Integer} lpValueBuf A pointer to a buffer. If the function succeeds, the buffer receives the data for each value. 
 * 
 * 
 * 
 * 
 * If <i>lpValueBuf</i> is <b>NULL</b>, the value pointed to by the <i>ldwTotsize</i> parameter must be zero, in which case the function returns ERROR_MORE_DATA and <i>ldwTotsize</i> receives the required size of the buffer, in bytes.
 * @param {Pointer<Integer>} ldwTotsize A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueBuf</i> parameter, in bytes. If the function succeeds, <i>ldwTotsize</i> receives the number of bytes copied to the buffer. If the function fails because the buffer is too small, <i>ldwTotsize</i> receives the required size, in bytes.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is one of the following error codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANTREAD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a> cannot instantiate or access the provider of the dynamic key.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer pointed to by <i>lpValueBuf</i> was too small. In this case, <i>ldwTotsize</i> receives the required buffer size.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TRANSFER_TOO_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The total size of the requested data (size of the <i>val_list</i> array + <i>ldwTotSize</i>) is more than the system limit of one megabyte.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regquerymultiplevaluesw
 * @since windows5.0
 */
export RegQueryMultipleValuesW(_hKey, val_list, num_vals, lpValueBuf, ldwTotsize) {
    ldwTotsizeMarshal := ldwTotsize is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryMultipleValuesW", HKEY, _hKey, VALENTW.Ptr, val_list, "uint", num_vals, "ptr", lpValueBuf, ldwTotsizeMarshal, ldwTotsize, WIN32_ERROR)
    return result
}

/**
 * Retrieves the type and data for the specified value name associated with an open registry key. (ANSI)
 * @remarks
 * An application typically calls <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenumvaluea">RegEnumValue</a> to determine the value names and then <b>RegQueryValueEx</b> to retrieve the data for the names.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, the string may not have been stored with the proper terminating <b>null</b> characters. Therefore, even if the function returns ERROR_SUCCESS, the application should ensure that the string is properly terminated before using it; otherwise, it may overwrite a buffer. (Note that REG_MULTI_SZ strings should have two terminating <b>null</b> characters.) One way an application can ensure that the string is properly terminated is to use <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-reggetvaluea">RegGetValue</a>, which adds terminating <b>null</b> characters if needed.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, and the ANSI version of this function is used (either by explicitly calling <b>RegQueryValueExA</b> or by not defining UNICODE before including the Windows.h file), this function converts the stored Unicode string to an ANSI string before copying it to the buffer pointed to by <i>lpData</i>.
 * 
 * When calling the 
 * <b>RegQueryValueEx</b> function with <i>hKey</i> set to the <b>HKEY_PERFORMANCE_DATA</b> handle and a value string of a specified object, the returned data structure sometimes has unrequested objects. Do not be surprised; this is normal behavior. When calling the 
 * <b>RegQueryValueEx</b> function, you should always expect to walk the returned data structure to look for the requested object.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
 * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpValueName The name of the registry value. 
 * 
 * 
 * 
 * 
 * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any. 
 * 
 * If <i>lpValueName</i> specifies a value that is not in the registry, the function returns ERROR_FILE_NOT_FOUND.
 * 
 * Keys do not automatically have an unnamed or default value. Unnamed values can be of any type. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<REG_VALUE_TYPE>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
 * @param {Integer} lpData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
 * @param {Pointer<Integer>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpData</i>. 
 * 
 * 
 * 
 * 
 * The <i>lpcbData</i> parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters unless the data was stored without them. For more information, see Remarks.
 * 
 * If the buffer specified by <i>lpData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of the <i>lpData</i> buffer are undefined.
 * 
 * If <i>lpData</i> is <b>NULL</b>, and <i>lpcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
 * 
 * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>lpData</i> buffer is not large enough to contain all of the returned data, 
 * <b>RegQueryValueEx</b> returns ERROR_MORE_DATA and the value returned through the <i>lpcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
 * <b>RegQueryValueEx</b> again passing the updated buffer size in the <i>lpcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>lpcbData</i> is unpredictable.
 * 
 * If the <i>lpValueName</i> registry value does not exist, <b>RegQueryValueEx</b> returns ERROR_FILE_NOT_FOUND and the value returned through the <i>lpcbData</i> parameter is undefined.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>lpData</i> buffer is too small to receive the data, the function returns ERROR_MORE_DATA.
 * 
 * If the <i>lpValueName</i> registry value does not exist, the function returns ERROR_FILE_NOT_FOUND.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regqueryvalueexa
 * @since windows5.0
 */
export RegQueryValueExA(_hKey, lpValueName, lpType, lpData, lpcbData) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    lpTypeMarshal := lpType is VarRef ? "uint*" : "ptr"
    lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryValueExA", HKEY, _hKey, "ptr", lpValueName, "uint*", lpReserved, lpTypeMarshal, lpType, "ptr", lpData, lpcbDataMarshal, lpcbData, WIN32_ERROR)
    return result
}

/**
 * Retrieves the type and data for the specified value name associated with an open registry key. (Unicode)
 * @remarks
 * An application typically calls <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenumvaluea">RegEnumValue</a> to determine the value names and then <b>RegQueryValueEx</b> to retrieve the data for the names.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, the string may not have been stored with the proper terminating <b>null</b> characters. Therefore, even if the function returns ERROR_SUCCESS, the application should ensure that the string is properly terminated before using it; otherwise, it may overwrite a buffer. (Note that REG_MULTI_SZ strings should have two terminating <b>null</b> characters.) One way an application can ensure that the string is properly terminated is to use <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-reggetvaluea">RegGetValue</a>, which adds terminating <b>null</b> characters if needed.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, and the ANSI version of this function is used (either by explicitly calling <b>RegQueryValueExA</b> or by not defining UNICODE before including the Windows.h file), this function converts the stored Unicode string to an ANSI string before copying it to the buffer pointed to by <i>lpData</i>.
 * 
 * When calling the 
 * <b>RegQueryValueEx</b> function with <i>hKey</i> set to the <b>HKEY_PERFORMANCE_DATA</b> handle and a value string of a specified object, the returned data structure sometimes has unrequested objects. Do not be surprised; this is normal behavior. When calling the 
 * <b>RegQueryValueEx</b> function, you should always expect to walk the returned data structure to look for the requested object.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
 * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpValueName The name of the registry value. 
 * 
 * 
 * 
 * 
 * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any. 
 * 
 * If <i>lpValueName</i> specifies a value that is not in the registry, the function returns ERROR_FILE_NOT_FOUND.
 * 
 * Keys do not automatically have an unnamed or default value. Unnamed values can be of any type. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {Pointer<REG_VALUE_TYPE>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
 * @param {Integer} lpData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
 * @param {Pointer<Integer>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpData</i>. 
 * 
 * 
 * 
 * 
 * The <i>lpcbData</i> parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters unless the data was stored without them. For more information, see Remarks.
 * 
 * If the buffer specified by <i>lpData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of the <i>lpData</i> buffer are undefined.
 * 
 * If <i>lpData</i> is <b>NULL</b>, and <i>lpcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
 * 
 * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>lpData</i> buffer is not large enough to contain all of the returned data, 
 * <b>RegQueryValueEx</b> returns ERROR_MORE_DATA and the value returned through the <i>lpcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
 * <b>RegQueryValueEx</b> again passing the updated buffer size in the <i>lpcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>lpcbData</i> is unpredictable.
 * 
 * If the <i>lpValueName</i> registry value does not exist, <b>RegQueryValueEx</b> returns ERROR_FILE_NOT_FOUND and the value returned through the <i>lpcbData</i> parameter is undefined.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>lpData</i> buffer is too small to receive the data, the function returns ERROR_MORE_DATA.
 * 
 * If the <i>lpValueName</i> registry value does not exist, the function returns ERROR_FILE_NOT_FOUND.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regqueryvalueexw
 * @since windows5.0
 */
export RegQueryValueExW(_hKey, lpValueName, lpType, lpData, lpcbData) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    lpTypeMarshal := lpType is VarRef ? "uint*" : "ptr"
    lpcbDataMarshal := lpcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegQueryValueExW", HKEY, _hKey, "ptr", lpValueName, "uint*", lpReserved, lpTypeMarshal, lpType, "ptr", lpData, lpcbDataMarshal, lpcbData, WIN32_ERROR)
    return result
}

/**
 * Replaces the file backing a registry key and all its subkeys with another file, so that when the system is next started, the key and subkeys will have the values stored in the new file. (ANSI)
 * @remarks
 * There are two different registry hive file formats. Registry hives created on current operating systems typically cannot be loaded by earlier ones.
 * 
 * The file specified by the <i>lpNewFile</i> parameter remains open until the system is restarted.
 * 
 * If <i>hKey</i> is a handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, then the paths specified in <i>lpNewFile</i> and <i>lpOldFile</i> are relative to the remote computer.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegReplaceKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * 
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_CONFIG</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * @param {PSTR} lpSubKey The name of the registry key whose subkeys and values are to be replaced. If the key exists, it must be a subkey of the key identified by the <i>hKey</i> parameter. If the subkey does not exist, it is created. This parameter can be <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * If the specified subkey is not the root of a hive, 
 * <b>RegReplaceKey</b> traverses up the hive tree structure until it encounters a hive root, then it replaces the contents of that hive with the contents of the data file specified by <i>lpNewFile</i>.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {PSTR} lpNewFile The name of the file with the registry information. This file is typically created by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
 * @param {PSTR} lpOldFile The name of the file that receives a backup copy of the registry information being replaced.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regreplacekeya
 * @since windows5.0
 */
export RegReplaceKeyA(_hKey, lpSubKey, lpNewFile, lpOldFile) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpNewFile := lpNewFile is String ? StrPtr(lpNewFile) : lpNewFile
    lpOldFile := lpOldFile is String ? StrPtr(lpOldFile) : lpOldFile

    result := DllCall("ADVAPI32.dll\RegReplaceKeyA", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpNewFile, "ptr", lpOldFile, WIN32_ERROR)
    return result
}

/**
 * Replaces the file backing a registry key and all its subkeys with another file, so that when the system is next started, the key and subkeys will have the values stored in the new file. (Unicode)
 * @remarks
 * There are two different registry hive file formats. Registry hives created on current operating systems typically cannot be loaded by earlier ones.
 * 
 * The file specified by the <i>lpNewFile</i> parameter remains open until the system is restarted.
 * 
 * If <i>hKey</i> is a handle returned by 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, then the paths specified in <i>lpNewFile</i> and <i>lpOldFile</i> are relative to the remote computer.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegReplaceKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * 
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_CONFIG</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * @param {PWSTR} lpSubKey The name of the registry key whose subkeys and values are to be replaced. If the key exists, it must be a subkey of the key identified by the <i>hKey</i> parameter. If the subkey does not exist, it is created. This parameter can be <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * If the specified subkey is not the root of a hive, 
 * <b>RegReplaceKey</b> traverses up the hive tree structure until it encounters a hive root, then it replaces the contents of that hive with the contents of the data file specified by <i>lpNewFile</i>.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {PWSTR} lpNewFile The name of the file with the registry information. This file is typically created by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
 * @param {PWSTR} lpOldFile The name of the file that receives a backup copy of the registry information being replaced.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regreplacekeyw
 * @since windows5.0
 */
export RegReplaceKeyW(_hKey, lpSubKey, lpNewFile, lpOldFile) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpNewFile := lpNewFile is String ? StrPtr(lpNewFile) : lpNewFile
    lpOldFile := lpOldFile is String ? StrPtr(lpOldFile) : lpOldFile

    result := DllCall("ADVAPI32.dll\RegReplaceKeyW", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpNewFile, "ptr", lpOldFile, WIN32_ERROR)
    return result
}

/**
 * Reads the registry information in a specified file and copies it over the specified key. This registry information may be in the form of a key and multiple levels of subkeys. (ANSI)
 * @remarks
 * There are two different registry hive file formats. Registry hives created on current operating systems typically cannot be loaded by earlier ones.
 * 
 * If any subkeys of the <i>hKey</i> parameter are open, 
 * <b>RegRestoreKey</b> fails.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * This function replaces the keys and values below the specified key with the keys and values that are subsidiary to the top-level key in the file, no matter what the name of the top-level key in the file might be. For example, <i>hKey</i> might identify a key A with subkeys B and C, while the <i>lpFile</i> parameter specifies a file containing key X with subkeys Y and Z. After a call to 
 * <b>RegRestoreKey</b>, the registry would contain key A with subkeys Y and Z. The value entries of A would be replaced by the value entries of X.
 * 
 * The new information in the file specified by <i>lpFile</i> overwrites the contents of the key specified by the <i>hKey</i> parameter, except for the key name.
 * 
 * If <i>hKey</i> represents a key in a remote computer, the path described by <i>lpFile</i> is relative to the remote computer.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegRestoreKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * 
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_CONFIG</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * Any information contained in this key and its descendent keys is overwritten by the information in the file pointed to by the <i>lpFile</i> parameter.
 * @param {PSTR} lpFile The name of the file with the registry information. This file is typically created by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
 * @param {Integer} dwFlags 
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regrestorekeya
 * @since windows5.0
 */
export RegRestoreKeyA(_hKey, lpFile, dwFlags) {
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegRestoreKeyA", HKEY, _hKey, "ptr", lpFile, "uint", dwFlags, WIN32_ERROR)
    return result
}

/**
 * Reads the registry information in a specified file and copies it over the specified key. This registry information may be in the form of a key and multiple levels of subkeys. (Unicode)
 * @remarks
 * There are two different registry hive file formats. Registry hives created on current operating systems typically cannot be loaded by earlier ones.
 * 
 * If any subkeys of the <i>hKey</i> parameter are open, 
 * <b>RegRestoreKey</b> fails.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * This function replaces the keys and values below the specified key with the keys and values that are subsidiary to the top-level key in the file, no matter what the name of the top-level key in the file might be. For example, <i>hKey</i> might identify a key A with subkeys B and C, while the <i>lpFile</i> parameter specifies a file containing key X with subkeys Y and Z. After a call to 
 * <b>RegRestoreKey</b>, the registry would contain key A with subkeys Y and Z. The value entries of A would be replaced by the value entries of X.
 * 
 * The new information in the file specified by <i>lpFile</i> overwrites the contents of the key specified by the <i>hKey</i> parameter, except for the key name.
 * 
 * If <i>hKey</i> represents a key in a remote computer, the path described by <i>lpFile</i> is relative to the remote computer.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegRestoreKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * 
 * 
 * <b>HKEY_CLASSES_ROOT</b>
 * <b>HKEY_CURRENT_CONFIG</b>
 * <b>HKEY_CURRENT_USER</b>
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * Any information contained in this key and its descendent keys is overwritten by the information in the file pointed to by the <i>lpFile</i> parameter.
 * @param {PWSTR} lpFile The name of the file with the registry information. This file is typically created by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
 * @param {Integer} dwFlags 
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regrestorekeyw
 * @since windows5.0
 */
export RegRestoreKeyW(_hKey, lpFile, dwFlags) {
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegRestoreKeyW", HKEY, _hKey, "ptr", lpFile, "uint", dwFlags, WIN32_ERROR)
    return result
}

/**
 * Changes the name of the specified registry key. (RegRenameKey)
 * @remarks
 * This function can be used to rename an entire registry subtree. The caller must have KEY_CREATE_SUB_KEY access to the parent of the specified key and DELETE access to the entire subtree being renamed.
 * @param {HKEY} _hKey A handle to the key to be renamed. The handle must be opened with the KEY_WRITE access right. For more information, see [Registry Key Security and Access Rights](/windows/win32/SysInfo/registry-key-security-and-access-rights).
 * 
 * This handle is returned by the [RegCreateKeyEx](nf-winreg-regcreatekeyexa.md) or [RegOpenKeyEx](nf-winreg-regopenkeyexa.md) function, or it can be one of the following [Predefined Keys](/windows/win32/SysInfo/predefined-keys):
 * 
 * * HKEY_CLASSES_ROOT
 * * HKEY_CURRENT_CONFIG
 * * HKEY_CURRENT_USER
 * * HKEY_LOCAL_MACHINE
 * * HKEY_USERS
 * @param {PWSTR} lpSubKeyName The name of the subkey to be renamed. This key must be a subkey of the key identified by the *hKey* parameter. This parameter can also be **NULL**, in which case the key identified by the *hKey* parameter will be renamed.
 * @param {PWSTR} lpNewKeyName The new name of the key. The new name must not already exist.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage) function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error. An error code of STATUS_ACCESS_DENIED indicates that the caller does not have the necessary access rights to the specified registry key or subkeys.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regrenamekey
 */
export RegRenameKey(_hKey, lpSubKeyName, lpNewKeyName) {
    lpSubKeyName := lpSubKeyName is String ? StrPtr(lpSubKeyName) : lpSubKeyName
    lpNewKeyName := lpNewKeyName is String ? StrPtr(lpNewKeyName) : lpNewKeyName

    result := DllCall("ADVAPI32.dll\RegRenameKey", HKEY, _hKey, "ptr", lpSubKeyName, "ptr", lpNewKeyName, WIN32_ERROR)
    return result
}

/**
 * Saves the specified key and all of its subkeys and values to a new file, in the standard format. (ANSI)
 * @remarks
 * If <i>hKey</i> represents a key on a remote computer, the path described by <i>lpFile</i> is relative to the remote computer.
 * 
 * The 
 * <b>RegSaveKey</b> function saves only nonvolatile keys. It does not save volatile keys. A key is made volatile or nonvolatile at its creation; see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>.
 * 
 * You can use the file created by 
 * <b>RegSaveKey</b> in subsequent calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regreplacekeya">RegReplaceKey</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> functions. If 
 * <b>RegSaveKey</b> fails part way through its operation, the file will be corrupt and subsequent calls to 
 * <b>RegLoadKey</b>, 
 * <b>RegReplaceKey</b>, or 
 * <b>RegRestoreKey</b> for the file will fail.
 * 
 * Using <b>RegSaveKey</b> together with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> to copy subtrees in the registry is not recommended. This method does not trigger notifications and can invalidate handles used by other applications. Instead, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shcopykeya">SHCopyKey</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcopytreea">RegCopyTree</a> function.
 * 
 * The calling process must have the SE_BACKUP_NAME privilege enabled. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSaveKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * <dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * </dl>
 * @param {PSTR} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
 * 
 * 
 * 
 * 
 * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key. The new file has the archive attribute.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * 
 * If the file already exists, the function fails with the ERROR_ALREADY_EXISTS error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsavekeya
 * @since windows5.0
 */
export RegSaveKeyA(_hKey, lpFile, lpSecurityAttributes) {
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegSaveKeyA", HKEY, _hKey, "ptr", lpFile, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, WIN32_ERROR)
    return result
}

/**
 * Saves the specified key and all of its subkeys and values to a new file, in the standard format. (Unicode)
 * @remarks
 * If <i>hKey</i> represents a key on a remote computer, the path described by <i>lpFile</i> is relative to the remote computer.
 * 
 * The 
 * <b>RegSaveKey</b> function saves only nonvolatile keys. It does not save volatile keys. A key is made volatile or nonvolatile at its creation; see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>.
 * 
 * You can use the file created by 
 * <b>RegSaveKey</b> in subsequent calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regreplacekeya">RegReplaceKey</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> functions. If 
 * <b>RegSaveKey</b> fails part way through its operation, the file will be corrupt and subsequent calls to 
 * <b>RegLoadKey</b>, 
 * <b>RegReplaceKey</b>, or 
 * <b>RegRestoreKey</b> for the file will fail.
 * 
 * Using <b>RegSaveKey</b> together with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> to copy subtrees in the registry is not recommended. This method does not trigger notifications and can invalidate handles used by other applications. Instead, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shcopykeya">SHCopyKey</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcopytreea">RegCopyTree</a> function.
 * 
 * The calling process must have the SE_BACKUP_NAME privilege enabled. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSaveKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
 * 
 * 
 * <dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * </dl>
 * @param {PWSTR} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
 * 
 * 
 * 
 * 
 * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key. The new file has the archive attribute.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * 
 * If the file already exists, the function fails with the ERROR_ALREADY_EXISTS error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsavekeyw
 * @since windows5.0
 */
export RegSaveKeyW(_hKey, lpFile, lpSecurityAttributes) {
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegSaveKeyW", HKEY, _hKey, "ptr", lpFile, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, WIN32_ERROR)
    return result
}

/**
 * Sets the security of an open registry key.
 * @remarks
 * If <i>hKey</i> is one of the predefined keys, use  the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function to close the predefined key to  ensure that the new security information is in effect the next time the predefined key is referenced.
 * @param {HKEY} _hKey A handle to an open key for which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> is set.
 * @param {OBJECT_SECURITY_INFORMATION} SecurityInformation A set of 
 * bit flags that indicate the type of security information to set. This parameter can be a combination of the 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
 * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that specifies the security <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> to set for the specified key.
 * @returns {WIN32_ERROR} If the function succeeds, the function returns ERROR_SUCCESS.
 * 						
 * 
 * If the function fails, it returns a nonzero error code defined in WinError.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetkeysecurity
 * @since windows5.1.2600
 */
export RegSetKeySecurity(_hKey, SecurityInformation, pSecurityDescriptor) {
    result := DllCall("ADVAPI32.dll\RegSetKeySecurity", HKEY, _hKey, OBJECT_SECURITY_INFORMATION, SecurityInformation, PSECURITY_DESCRIPTOR, pSecurityDescriptor, WIN32_ERROR)
    return result
}

/**
 * Sets the data for the default or unnamed value of a specified registry key. The data must be a text string. (ANSI)
 * @remarks
 * If the key specified by the <i>lpSubKey</i> parameter does not exist, the 
 * <b>RegSetValue</b> function creates it.
 * 
 * If the ANSI version of this function is used (either by explicitly calling <b>RegSetValueA</b> or by not defining UNICODE before including the Windows.h file), the <i>lpData</i> parameter must be an ANSI character string. The string is converted to Unicode before it is stored in the registry.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSetValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of a subkey of the <i>hKey</i> parameter. The function sets the default value of the specified subkey. If <i>lpSubKey</i> does not exist, the function creates it.
 * 
 * Key names are not case sensitive.
 * 
 * If this parameter is <b>NULL</b> or points to an empty string, the function sets the default value of the key identified by <i>hKey</i>.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {REG_VALUE_TYPE} dwType The type of information to be stored. This parameter must be the REG_SZ type. To store other data types, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function.
 * @param {Integer} lpData The data to be stored. This parameter cannot be <b>NULL</b>.
 * @param {Integer} cbData This parameter is ignored. The function calculates this value based on the size of the data in the <i>lpData</i> parameter.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetvaluea
 * @since windows5.0
 */
export RegSetValueA(_hKey, lpSubKey, dwType, lpData, cbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegSetValueA", HKEY, _hKey, "ptr", lpSubKey, REG_VALUE_TYPE, dwType, "ptr", lpData, "uint", cbData, WIN32_ERROR)
    return result
}

/**
 * Sets the data for the default or unnamed value of a specified registry key. The data must be a text string. (Unicode)
 * @remarks
 * If the key specified by the <i>lpSubKey</i> parameter does not exist, the 
 * <b>RegSetValue</b> function creates it.
 * 
 * If the ANSI version of this function is used (either by explicitly calling <b>RegSetValueA</b> or by not defining UNICODE before including the Windows.h file), the <i>lpData</i> parameter must be an ANSI character string. The string is converted to Unicode before it is stored in the registry.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSetValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of a subkey of the <i>hKey</i> parameter. The function sets the default value of the specified subkey. If <i>lpSubKey</i> does not exist, the function creates it.
 * 
 * Key names are not case sensitive.
 * 
 * If this parameter is <b>NULL</b> or points to an empty string, the function sets the default value of the key identified by <i>hKey</i>.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @param {REG_VALUE_TYPE} dwType The type of information to be stored. This parameter must be the REG_SZ type. To store other data types, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function.
 * @param {Integer} lpData The data to be stored. This parameter cannot be <b>NULL</b>.
 * @param {Integer} cbData This parameter is ignored. The function calculates this value based on the size of the data in the <i>lpData</i> parameter.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetvaluew
 * @since windows5.0
 */
export RegSetValueW(_hKey, lpSubKey, dwType, lpData, cbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegSetValueW", HKEY, _hKey, "ptr", lpSubKey, REG_VALUE_TYPE, dwType, "ptr", lpData, "uint", cbData, WIN32_ERROR)
    return result
}

/**
 * Sets the data and type of a specified value under a registry key. (ANSI)
 * @remarks
 * Value sizes are limited by available memory. However, storing large values in the registry can affect its performance. Long values (more than 2,048 bytes) should be stored as files, with the locations of the files stored in the registry. 
 * 
 * Application elements such as icons, bitmaps, and executable files should be stored as files and not be placed in the registry.
 * 
 * If <i>dwType</i> is the REG_SZ, REG_MULTI_SZ, or REG_EXPAND_SZ type and the ANSI version of this function is used (either by explicitly calling <b>RegSetValueExA</b> or by not defining UNICODE before including the Windows.h file), the data pointed to by the <i>lpData</i> parameter must be an ANSI character string. The string is converted to Unicode before it is stored in the registry.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * Consider using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetkeyvaluea">RegSetKeyValue</a> function, which provides a more convenient way to set the value of a registry key.
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSetValueEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>The Unicode version of this function supports the following additional predefined keys:<ul>
 * <li><b>HKEY_PERFORMANCE_TEXT</b></li>
 * <li><b>HKEY_PERFORMANCE_NLSTEXT</b></li>
 * </ul>
 * @param {PSTR} lpValueName The name of the value to be set. If a value with this name is not already present in the key, the function adds it to the key. 
 * 
 * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function sets the type and data for the key's unnamed or default value.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * 
 * Registry keys do not have default values, but they can have one unnamed value, which can be of any type.
 * @param {REG_VALUE_TYPE} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
 * @param {Integer} lpData The data to be stored. 
 * 
 * For string-based types, such as REG_SZ, the string must be <b>null</b>-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two <b>null</b> characters.
 * 
 * <div class="alert"><b>Note</b>  lpData indicating a  <b>null</b> value is valid, however, if this is the case, <i>cbData</i> must be set to '0'.</div>
 * <div> </div>
 * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating <b>null</b> character or characters.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetvalueexa
 * @since windows5.0
 */
export RegSetValueExA(_hKey, lpValueName, dwType, lpData, cbData) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegSetValueExA", HKEY, _hKey, "ptr", lpValueName, "uint", Reserved, REG_VALUE_TYPE, dwType, "ptr", lpData, "uint", cbData, WIN32_ERROR)
    return result
}

/**
 * Sets the data and type of a specified value under a registry key. (Unicode)
 * @remarks
 * Value sizes are limited by available memory. However, storing large values in the registry can affect its performance. Long values (more than 2,048 bytes) should be stored as files, with the locations of the files stored in the registry. 
 * 
 * Application elements such as icons, bitmaps, and executable files should be stored as files and not be placed in the registry.
 * 
 * If <i>dwType</i> is the REG_SZ, REG_MULTI_SZ, or REG_EXPAND_SZ type and the ANSI version of this function is used (either by explicitly calling <b>RegSetValueExA</b> or by not defining UNICODE before including the Windows.h file), the data pointed to by the <i>lpData</i> parameter must be an ANSI character string. The string is converted to Unicode before it is stored in the registry.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * Consider using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetkeyvaluew">RegSetKeyValue</a> function, which provides a more convenient way to set the value of a registry key.
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSetValueEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>The Unicode version of this function supports the following additional predefined keys:<ul>
 * <li><b>HKEY_PERFORMANCE_TEXT</b></li>
 * <li><b>HKEY_PERFORMANCE_NLSTEXT</b></li>
 * </ul>
 * @param {PWSTR} lpValueName The name of the value to be set. If a value with this name is not already present in the key, the function adds it to the key. 
 * 
 * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function sets the type and data for the key's unnamed or default value.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * 
 * Registry keys do not have default values, but they can have one unnamed value, which can be of any type.
 * @param {REG_VALUE_TYPE} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
 * @param {Integer} lpData The data to be stored. 
 * 
 * For string-based types, such as REG_SZ, the string must be <b>null</b>-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two <b>null</b> characters.
 * 
 * <div class="alert"><b>Note</b>  lpData indicating a  <b>null</b> value is valid, however, if this is the case, <i>cbData</i> must be set to '0'.</div>
 * <div> </div>
 * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating <b>null</b> character or characters.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetvalueexw
 * @since windows5.0
 */
export RegSetValueExW(_hKey, lpValueName, dwType, lpData, cbData) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegSetValueExW", HKEY, _hKey, "ptr", lpValueName, "uint", Reserved, REG_VALUE_TYPE, dwType, "ptr", lpData, "uint", cbData, WIN32_ERROR)
    return result
}

/**
 * Unloads the specified registry key and its subkeys from the registry. (ANSI)
 * @remarks
 * This function removes a hive from the registry but does not modify the file containing the registry information. A hive is a discrete body of keys, subkeys, and values that is rooted at the top of the registry hierarchy.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegUnLoadKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to the registry key to be unloaded. This parameter can be a handle returned by a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a> function or one of the following predefined handles: 
 * 
 * 
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>
 * <b>HKEY_USERS</b>
 * @param {PSTR} lpSubKey The name of the subkey to be unloaded. The key referred to by the <i>lpSubKey</i> parameter must have been created by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a> function. 
 * 
 * 
 * 
 * 
 * Key names are not case sensitive.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regunloadkeya
 * @since windows5.0
 */
export RegUnLoadKeyA(_hKey, lpSubKey) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegUnLoadKeyA", HKEY, _hKey, "ptr", lpSubKey, WIN32_ERROR)
    return result
}

/**
 * Unloads the specified registry key and its subkeys from the registry. (Unicode)
 * @remarks
 * This function removes a hive from the registry but does not modify the file containing the registry information. A hive is a discrete body of keys, subkeys, and values that is rooted at the top of the registry hierarchy.
 * 
 * The calling process must have the SE_RESTORE_NAME and SE_BACKUP_NAME privileges on the computer in which the registry resides. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegUnLoadKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to the registry key to be unloaded. This parameter can be a handle returned by a call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a> function or one of the following predefined handles: 
 * 
 * * HKEY_LOCAL_MACHINE
 * * HKEY_USERS
 * @param {PWSTR} lpSubKey The name of the subkey to be unloaded. The key referred to by the <i>lpSubKey</i> parameter must have been created by using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a> function. 
 * 
 * 
 * 
 * 
 * Key names are not case sensitive.
 * 
 * For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regunloadkeyw
 * @since windows5.0
 */
export RegUnLoadKeyW(_hKey, lpSubKey) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegUnLoadKeyW", HKEY, _hKey, "ptr", lpSubKey, WIN32_ERROR)
    return result
}

/**
 * Removes the specified value from the specified registry key and subkey. (ANSI)
 * @remarks
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteKeyValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * 
 * <pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PSTR} lpSubKey The name of the registry key. This key must be a subkey of the key identified by the <i>hKey</i> parameter.
 * @param {PSTR} lpValueName The registry value to be removed from the key.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeyvaluea
 * @since windows6.0.6000
 */
export RegDeleteKeyValueA(_hKey, lpSubKey, lpValueName) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegDeleteKeyValueA", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpValueName, WIN32_ERROR)
    return result
}

/**
 * Removes the specified value from the specified registry key and subkey. (Unicode)
 * @remarks
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteKeyValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * 
 * <pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PWSTR} lpSubKey The name of the registry key. This key must be a subkey of the key identified by the <i>hKey</i> parameter.
 * @param {PWSTR} lpValueName The registry value to be removed from the key.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletekeyvaluew
 * @since windows6.0.6000
 */
export RegDeleteKeyValueW(_hKey, lpSubKey, lpValueName) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegDeleteKeyValueW", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpValueName, WIN32_ERROR)
    return result
}

/**
 * Sets the data for the specified value in the specified registry key and subkey. (ANSI)
 * @remarks
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSetKeyValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * 
 * <pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PSTR} lpSubKey The name of the subkey relative to the key identified by <i>hKey</i>.
 * If the subkey does not exist, it is created as a non-volatile key with a default security descriptor.
 * If this parameter is <b>NULL</b>, then the value is created in the key specified by <i>hKey</i>.
 * @param {PSTR} lpValueName The name of the registry value whose data is to be updated.
 * @param {Integer} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
 * @param {Integer} lpData The data to be stored with the specified value name. 
 * 
 * For string-based types, such as REG_SZ, the string must be null-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two null characters.
 * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating null character or characters.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetkeyvaluea
 * @since windows6.0.6000
 */
export RegSetKeyValueA(_hKey, lpSubKey, lpValueName, dwType, lpData, cbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegSetKeyValueA", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpValueName, "uint", dwType, "ptr", lpData, "uint", cbData, WIN32_ERROR)
    return result
}

/**
 * Sets the data for the specified value in the specified registry key and subkey. (Unicode)
 * @remarks
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSetKeyValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
 * 
 * 
 * <pre><b></b>
 *    <b>HKEY_CLASSES_ROOT</b>
 *    <b>HKEY_CURRENT_CONFIG</b>
 *    <b>HKEY_CURRENT_USER</b>
 *    <b>HKEY_LOCAL_MACHINE</b>
 *    <b>HKEY_USERS</b></pre>
 * @param {PWSTR} lpSubKey The name of the subkey relative to the key identified by <i>hKey</i>.
 * If the subkey does not exist, it is created as a non-volatile key with a default security descriptor.
 * If this parameter is <b>NULL</b>, then the value is created in the key specified by <i>hKey</i>.
 * @param {PWSTR} lpValueName The name of the registry value whose data is to be updated.
 * @param {Integer} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
 * @param {Integer} lpData The data to be stored with the specified value name. 
 * 
 * For string-based types, such as REG_SZ, the string must be null-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two null characters.
 * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating null character or characters.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetkeyvaluew
 * @since windows6.0.6000
 */
export RegSetKeyValueW(_hKey, lpSubKey, lpValueName, dwType, lpData, cbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpValueName := lpValueName is String ? StrPtr(lpValueName) : lpValueName

    result := DllCall("ADVAPI32.dll\RegSetKeyValueW", HKEY, _hKey, "ptr", lpSubKey, "ptr", lpValueName, "uint", dwType, "ptr", lpData, "uint", cbData, WIN32_ERROR)
    return result
}

/**
 * Deletes the subkeys and values of the specified key recursively. (ANSI)
 * @remarks
 * If the key has values, it must be opened with KEY_SET_VALUE or this function will fail with ERROR_ACCESS_DENIED.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteTree as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the following access rights: DELETE, KEY_ENUMERATE_SUB_KEYS, and KEY_QUERY_VALUE. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>,
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>,
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function,
 * or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKey</i> parameter. If this parameter is <b>NULL</b>, the subkeys and values of <i>hKey</i> are deleted.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletetreea
 * @since windows6.0.6000
 */
export RegDeleteTreeA(_hKey, lpSubKey) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteTreeA", HKEY, _hKey, "ptr", lpSubKey, WIN32_ERROR)
    return result
}

/**
 * Deletes the subkeys and values of the specified key recursively. (Unicode)
 * @remarks
 * If the key has values, it must be opened with KEY_SET_VALUE or this function will fail with ERROR_ACCESS_DENIED.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * > [!NOTE] 
 * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegDeleteTree as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the following access rights: DELETE, KEY_ENUMERATE_SUB_KEYS, and KEY_QUERY_VALUE. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>,
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>,
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function,
 * or it can be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKey</i> parameter. If this parameter is <b>NULL</b>, the subkeys and values of <i>hKey</i> are deleted.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regdeletetreew
 * @since windows6.0.6000
 */
export RegDeleteTreeW(_hKey, lpSubKey) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegDeleteTreeW", HKEY, _hKey, "ptr", lpSubKey, WIN32_ERROR)
    return result
}

/**
 * Copies the specified registry key, along with its values and subkeys, to the specified destination key. (ANSI)
 * @remarks
 * This function also copies the security descriptor for the key.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCopyTree as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} hKeySrc A handle to an open registry key. The key must have been opened with the KEY_READ access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
 * @param {PSTR} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKeySrc</i> parameter. This parameter can also be <b>NULL</b>.
 * @param {HKEY} hKeyDest A handle to the destination key. The calling process  must have KEY_CREATE_SUB_KEY access to the key.  
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcopytreea
 * @since windows6.0.6000
 */
export RegCopyTreeA(hKeySrc, lpSubKey, hKeyDest) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegCopyTreeA", HKEY, hKeySrc, "ptr", lpSubKey, HKEY, hKeyDest, WIN32_ERROR)
    return result
}

/**
 * Retrieves the type and data for the specified registry value. (ANSI)
 * @remarks
 * An application typically calls <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenumvaluea">RegEnumValue</a> to determine the value names and then <b>RegGetValue</b> to retrieve the data for the names.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, and the ANSI version of this function is used (either by explicitly calling <b>RegGetValueA</b> or by not defining UNICODE before including the Windows.h file), this function converts the stored Unicode string to an ANSI string before copying it to the buffer pointed to by <i>pvData</i>.
 * 
 * When calling this function with <i>hkey</i> set to the <b>HKEY_PERFORMANCE_DATA</b> handle and a value string of a specified object, the returned data structure sometimes has unrequested objects. Do not be surprised; this is normal behavior. You should always expect to walk the returned data structure to look for the requested object.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegGetValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hkey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
 * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} lpSubKey The path of a registry key relative to the key specified by the *hkey* parameter. The registry value will be retrieved from this subkey.
 * 
 * The path is not case sensitive.
 * 
 * If this parameter is **NULL** or an empty string, "", the value will be read from the key specified by *hkey* itself.
 * @param {PSTR} lpValue The name of the registry value.
 * 
 * If this parameter is **NULL** or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any.
 * Keys do not automatically have an unnamed or default value, and unnamed values can be of any type.
 * 
 * For more information, see [Registry Element Size Limits](/windows/win32/sysinfo/registry-element-size-limits).
 * @param {REG_ROUTINE_FLAGS} dwFlags 
 * @param {Pointer<REG_VALUE_TYPE>} pdwType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. This parameter can be <b>NULL</b> if the type is not required.
 * @param {Integer} pvData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
 * 
 * If the data is a string, the function checks for a terminating <b>null</b> character. If one is not found, the string is stored with a <b>null</b> terminator if the buffer is large enough to accommodate the extra character. Otherwise, the function fails and returns ERROR_MORE_DATA.
 * @param {Pointer<Integer>} pcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>pvData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>pvData</i>. 
 * 
 * 
 * 
 * 
 * The <i>pcbData</i> parameter can be <b>NULL</b> only if <i>pvData</i> is <b>NULL</b>.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
 * 
 * If the buffer specified by <i>pvData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the <i>pvData</i> buffer are zeroes if dwFlags specifies RRF_ZEROONFAILURE and undefined otherwise.
 * 
 * If <i>pvData</i> is <b>NULL</b>, and <i>pcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>pcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
 * 
 * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>pvData</i> buffer is not large enough to contain all of the returned data, 
 * the function returns ERROR_MORE_DATA and the value returned through the <i>pcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
 * <b>RegGetValue</b> again passing the updated buffer size in the <i>pcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>pcbData</i> is unpredictable.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>pvData</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
 * 
 * If the lpValue registry value does not exist, the function returns ERROR_FILE_NOT_FOUND.
 * 
 * If <i>dwFlags</i> specifies a combination of both <b>RRF_SUBKEY_WOW6464KEY</b> and  <b>RRF_SUBKEY_WOW6432KEY</b>, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-reggetvaluea
 * @since windows6.0.6000
 */
export RegGetValueA(_hkey, lpSubKey, lpValue, dwFlags, pdwType, pvData, pcbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpValue := lpValue is String ? StrPtr(lpValue) : lpValue

    pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"
    pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegGetValueA", HKEY, _hkey, "ptr", lpSubKey, "ptr", lpValue, REG_ROUTINE_FLAGS, dwFlags, pdwTypeMarshal, pdwType, "ptr", pvData, pcbDataMarshal, pcbData, WIN32_ERROR)
    return result
}

/**
 * Retrieves the type and data for the specified registry value. (Unicode)
 * @remarks
 * An application typically calls <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenumvaluea">RegEnumValue</a> to determine the value names and then <b>RegGetValue</b> to retrieve the data for the names.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, and the ANSI version of this function is used (either by explicitly calling <b>RegGetValueA</b> or by not defining UNICODE before including the Windows.h file), this function converts the stored Unicode string to an ANSI string before copying it to the buffer pointed to by <i>pvData</i>.
 * 
 * When calling this function with <i>hkey</i> set to the <b>HKEY_PERFORMANCE_DATA</b> handle and a value string of a specified object, the returned data structure sometimes has unrequested objects. Do not be surprised; this is normal behavior. You should always expect to walk the returned data structure to look for the requested object.
 * 
 * Note that operations that access certain registry keys are redirected. For more information,  see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-virtualization">Registry Virtualization</a> and <a href="https://docs.microsoft.com/windows/desktop/SysInfo/32-bit-and-64-bit-application-data-in-the-registry">32-bit and 64-bit Application Data in the Registry</a>.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegGetValue as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hkey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
 * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
 * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} lpSubKey The path of a registry key relative to the key specified by the *hkey* parameter. The registry value will be retrieved from this subkey.
 * 
 * The path is not case sensitive.
 * 
 * If this parameter is **NULL** or an empty string, "", the value will be read from the key specified by *hkey* itself.
 * @param {PWSTR} lpValue The name of the registry value.
 * 
 * If this parameter is **NULL** or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any.
 * Keys do not automatically have an unnamed or default value, and unnamed values can be of any type.
 * 
 * For more information, see [Registry Element Size Limits](/windows/win32/sysinfo/registry-element-size-limits).
 * @param {REG_ROUTINE_FLAGS} dwFlags 
 * @param {Pointer<REG_VALUE_TYPE>} pdwType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. This parameter can be <b>NULL</b> if the type is not required.
 * @param {Integer} pvData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
 * 
 * If the data is a string, the function checks for a terminating <b>null</b> character. If one is not found, the string is stored with a <b>null</b> terminator if the buffer is large enough to accommodate the extra character. Otherwise, the function fails and returns ERROR_MORE_DATA.
 * @param {Pointer<Integer>} pcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>pvData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>pvData</i>. 
 * 
 * 
 * 
 * 
 * The <i>pcbData</i> parameter can be <b>NULL</b> only if <i>pvData</i> is <b>NULL</b>.
 * 
 * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
 * 
 * If the buffer specified by <i>pvData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the <i>pvData</i> buffer are zeroes if dwFlags specifies RRF_ZEROONFAILURE and undefined otherwise.
 * 
 * If <i>pvData</i> is <b>NULL</b>, and <i>pcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>pcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
 * 
 * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>pvData</i> buffer is not large enough to contain all of the returned data, 
 * the function returns ERROR_MORE_DATA and the value returned through the <i>pcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
 * <b>RegGetValue</b> again passing the updated buffer size in the <i>pcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>pcbData</i> is unpredictable.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>pvData</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
 * 
 * If the lpValue registry value does not exist, the function returns ERROR_FILE_NOT_FOUND.
 * 
 * If <i>dwFlags</i> specifies a combination of both <b>RRF_SUBKEY_WOW6464KEY</b> and  <b>RRF_SUBKEY_WOW6432KEY</b>, the function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-reggetvaluew
 * @since windows6.0.6000
 */
export RegGetValueW(_hkey, lpSubKey, lpValue, dwFlags, pdwType, pvData, pcbData) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
    lpValue := lpValue is String ? StrPtr(lpValue) : lpValue

    pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"
    pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegGetValueW", HKEY, _hkey, "ptr", lpSubKey, "ptr", lpValue, REG_ROUTINE_FLAGS, dwFlags, pdwTypeMarshal, pdwType, "ptr", pvData, pcbDataMarshal, pcbData, WIN32_ERROR)
    return result
}

/**
 * Copies the specified registry key, along with its values and subkeys, to the specified destination key. (Unicode)
 * @remarks
 * This function also copies the security descriptor for the key.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegCopyTree as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} hKeySrc A handle to an open registry key. The key must have been opened with the KEY_READ access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
 * @param {PWSTR} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKeySrc</i> parameter. This parameter can also be <b>NULL</b>.
 * @param {HKEY} hKeyDest A handle to the destination key. The calling process  must have KEY_CREATE_SUB_KEY access to the key.  
 * 
 * 
 * 
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regcopytreew
 * @since windows6.0.6000
 */
export RegCopyTreeW(hKeySrc, lpSubKey, hKeyDest) {
    lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey

    result := DllCall("ADVAPI32.dll\RegCopyTreeW", HKEY, hKeySrc, "ptr", lpSubKey, HKEY, hKeyDest, WIN32_ERROR)
    return result
}

/**
 * Loads the specified string from the specified key and subkey. (ANSI)
 * @remarks
 * The <b>RegLoadMUIString</b> function is supported only for Unicode. Although both Unicode (W) and ANSI (A) versions of this function are declared, the <b>RegLoadMUIStringA</b> function returns ERROR_CALL_NOT_IMPLEMENTED. Applications should explicitly call <b>RegLoadMUIStringW</b> or specify Unicode as the character set in platform invoke (PInvoke) calls. 
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegLoadMUIString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PSTR} pszValue The name of the registry value.
 * @param {Integer} pszOutBuf A pointer to a buffer that receives the string.
 * 
 * Strings of the following form receive special handling:
 * 
 * @[<i>path</i>]&#92;<i>dllname</i>,-<i>strID</i>
 * 
 * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. If the <i>pszDirectory</i> parameter is not <b>NULL</b>, the directory is prepended to the path specified in the registry data. Note that <i>dllname</i> can contain environment variables to be expanded.
 * @param {Integer} cbOutBuf The size of the <i>pszOutBuf</i> buffer, in bytes.
 * @param {Pointer<Integer>} pcbData A pointer to a variable that receives the size of the data copied to the <i>pszOutBuf</i> buffer, in bytes.
 * 
 * If the buffer is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the buffer are undefined.
 * @param {Integer} Flags This parameter can be 0 or the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_MUI_STRING_TRUNCATE"></a><a id="reg_mui_string_truncate"></a><dl>
 * <dt><b>REG_MUI_STRING_TRUNCATE</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The string is truncated to fit the available size of the <i>pszOutBuf</i> buffer. If this flag is specified, <i>pcbData</i> must be <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PSTR} pszDirectory The directory path.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>pcbData</i> buffer is too small to receive the string, the function returns ERROR_MORE_DATA.
 * 
 * The ANSI version of this function returns ERROR_CALL_NOT_IMPLEMENTED.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regloadmuistringa
 * @since windows6.0.6000
 */
export RegLoadMUIStringA(_hKey, pszValue, pszOutBuf, cbOutBuf, pcbData, Flags, pszDirectory) {
    pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
    pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory

    pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegLoadMUIStringA", HKEY, _hKey, "ptr", pszValue, "ptr", pszOutBuf, "uint", cbOutBuf, pcbDataMarshal, pcbData, "uint", Flags, "ptr", pszDirectory, WIN32_ERROR)
    return result
}

/**
 * Loads the specified string from the specified key and subkey. (Unicode)
 * @remarks
 * The <b>RegLoadMUIString</b> function is supported only for Unicode. Although both Unicode (W) and ANSI (A) versions of this function are declared, the <b>RegLoadMUIStringA</b> function returns ERROR_CALL_NOT_IMPLEMENTED. Applications should explicitly call <b>RegLoadMUIStringW</b> or specify Unicode as the character set in platform invoke (PInvoke) calls. 
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegLoadMUIString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * 
 * This handle is returned by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
 * <dd><b>HKEY_CLASSES_ROOT</b></dd>
 * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
 * <dd><b>HKEY_CURRENT_USER</b></dd>
 * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
 * <dd><b>HKEY_USERS</b></dd>
 * </dl>
 * @param {PWSTR} pszValue The name of the registry value.
 * @param {Integer} pszOutBuf A pointer to a buffer that receives the string.
 * 
 * Strings of the following form receive special handling:
 * 
 * @[<i>path</i>]&#92;<i>dllname</i>,-<i>strID</i>
 * 
 * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. If the <i>pszDirectory</i> parameter is not <b>NULL</b>, the directory is prepended to the path specified in the registry data. Note that <i>dllname</i> can contain environment variables to be expanded.
 * @param {Integer} cbOutBuf The size of the <i>pszOutBuf</i> buffer, in bytes.
 * @param {Pointer<Integer>} pcbData A pointer to a variable that receives the size of the data copied to the <i>pszOutBuf</i> buffer, in bytes.
 * 
 * If the buffer is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the buffer are undefined.
 * @param {Integer} Flags This parameter can be 0 or the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="REG_MUI_STRING_TRUNCATE"></a><a id="reg_mui_string_truncate"></a><dl>
 * <dt><b>REG_MUI_STRING_TRUNCATE</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The string is truncated to fit the available size of the <i>pszOutBuf</i> buffer. If this flag is specified, <i>pcbData</i> must be <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {PWSTR} pszDirectory The directory path.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
 * 
 * If the <i>pcbData</i> buffer is too small to receive the string, the function returns ERROR_MORE_DATA.
 * 
 * The ANSI version of this function returns ERROR_CALL_NOT_IMPLEMENTED.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regloadmuistringw
 * @since windows6.0.6000
 */
export RegLoadMUIStringW(_hKey, pszValue, pszOutBuf, cbOutBuf, pcbData, Flags, pszDirectory) {
    pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
    pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory

    pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("ADVAPI32.dll\RegLoadMUIStringW", HKEY, _hKey, "ptr", pszValue, "ptr", pszOutBuf, "uint", cbOutBuf, pcbDataMarshal, pcbData, "uint", Flags, "ptr", pszDirectory, WIN32_ERROR)
    return result
}

/**
 * Loads the specified registry hive as an application hive. (ANSI)
 * @remarks
 * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a>, <b>RegLoadAppKey</b> does not load the hive under HKEY_LOCAL_MACHINE or HKEY_USERS. Instead, the hive is loaded under a special root that cannot be enumerated. As a result, there is no way to enumerate hives currently loaded by <b>RegLoadAppKey</b>. All operations on hives loaded by <b>RegLoadAppKey</b> have to be performed relative to the handle returned in <i>phkResult.</i>
 * 
 *  
 * 
 * If two processes are required to perform operations on the same hive, each process must call <b>RegLoadAppKey</b> to retrieve a handle. During the <b>RegLoadAppKey</b> operation, the registry will  verify if the  file has already been loaded. If it has been loaded, the registry will return a handle to the previously loaded hive rather than re-loading the hive. 
 * 
 * 
 * All keys inside the hive must have the same security descriptor, otherwise the function will fail. This security descriptor must grant the caller the access specified by the <i>samDesired</i> parameter or the function will fail. You cannot use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetkeysecurity">RegSetKeySecurity</a> function on any key inside the hive.
 * 
 * In Windows 8 and later, each process can call <b>RegLoadAppKey</b> to load multiple hives. In Windows 7 and earlier, each process can load only one hive using <b>RegLoadAppKey</b> at a time.
 * 
 * Any hive loaded using <b>RegLoadAppKey</b> is automatically unloaded when all handles to the keys inside the hive are closed using <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a>.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegLoadAppKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpFile The name of the  hive file. This hive must have been created with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeyexa">RegSaveKeyEx</a> function. If the  file does not exist, an empty hive file is created with the specified name.
 * @param {Pointer<HKEY>} phkResult Pointer to the handle for the root key of the loaded hive.
 * 
 * The only way to access keys in the hive is through this handle. The registry will prevent an application from accessing keys in this hive using an absolute path to the key. As a result, it is not possible to navigate to this hive through the registry's namespace.
 * @param {Integer} samDesired A mask that specifies the access rights requested for the returned root key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Integer} dwOptions If this parameter is REG_PROCESS_APPKEY, the hive cannot be loaded again  while it is loaded by the caller. This prevents access to this registry hive by another caller.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regloadappkeya
 * @since windows6.0.6000
 */
export RegLoadAppKeyA(lpFile, phkResult, samDesired, dwOptions) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegLoadAppKeyA", "ptr", lpFile, HKEY.Ptr, phkResult, "uint", samDesired, "uint", dwOptions, "uint", Reserved, WIN32_ERROR)
    return result
}

/**
 * Loads the specified registry hive as an application hive. (Unicode)
 * @remarks
 * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a>, <b>RegLoadAppKey</b> does not load the hive under HKEY_LOCAL_MACHINE or HKEY_USERS. Instead, the hive is loaded under a special root that cannot be enumerated. As a result, there is no way to enumerate hives currently loaded by <b>RegLoadAppKey</b>. All operations on hives loaded by <b>RegLoadAppKey</b> have to be performed relative to the handle returned in <i>phkResult.</i>
 * 
 *  
 * 
 * If two processes are required to perform operations on the same hive, each process must call <b>RegLoadAppKey</b> to retrieve a handle. During the <b>RegLoadAppKey</b> operation, the registry will  verify if the  file has already been loaded. If it has been loaded, the registry will return a handle to the previously loaded hive rather than re-loading the hive. 
 * 
 * 
 * All keys inside the hive must have the same security descriptor, otherwise the function will fail. This security descriptor must grant the caller the access specified by the <i>samDesired</i> parameter or the function will fail. You cannot use the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetkeysecurity">RegSetKeySecurity</a> function on any key inside the hive.
 * 
 * In Windows 8 and later, each process can call <b>RegLoadAppKey</b> to load multiple hives. In Windows 7 and earlier, each process can load only one hive using <b>RegLoadAppKey</b> at a time.
 * 
 * Any hive loaded using <b>RegLoadAppKey</b> is automatically unloaded when all handles to the keys inside the hive are closed using <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a>.
 * 
 * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegLoadAppKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpFile The name of the  hive file. This hive must have been created with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeyexa">RegSaveKeyEx</a> function. If the  file does not exist, an empty hive file is created with the specified name.
 * @param {Pointer<HKEY>} phkResult Pointer to the handle for the root key of the loaded hive.
 * 
 * The only way to access keys in the hive is through this handle. The registry will prevent an application from accessing keys in this hive using an absolute path to the key. As a result, it is not possible to navigate to this hive through the registry's namespace.
 * @param {Integer} samDesired A mask that specifies the access rights requested for the returned root key. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
 * @param {Integer} dwOptions If this parameter is REG_PROCESS_APPKEY, the hive cannot be loaded again  while it is loaded by the caller. This prevents access to this registry hive by another caller.
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regloadappkeyw
 * @since windows6.0.6000
 */
export RegLoadAppKeyW(lpFile, phkResult, samDesired, dwOptions) {
    static Reserved := 0 ;Reserved parameters must always be NULL

    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegLoadAppKeyW", "ptr", lpFile, HKEY.Ptr, phkResult, "uint", samDesired, "uint", dwOptions, "uint", Reserved, WIN32_ERROR)
    return result
}

/**
 * Saves the specified key and all of its subkeys and values to a registry file, in the specified format. (ANSI)
 * @remarks
 * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a>, this function does not support the <b>HKEY_CLASSES_ROOT</b> predefined key.
 * 
 * If <i>hKey</i> represents a key on a remote computer, the path described by <i>lpFile</i> is relative to the remote computer.
 * 
 * The 
 * <b>RegSaveKeyEx</b> function saves only nonvolatile keys. It does not save volatile keys. A key is made volatile or nonvolatile at its creation; see 
 * <b>RegCreateKeyEx</b>.
 * 
 * You can use the file created by 
 * <b>RegSaveKeyEx</b> in subsequent calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regreplacekeya">RegReplaceKey</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> function. If 
 * <b>RegSaveKeyEx</b> fails partway through its operation, the file will be corrupt and subsequent calls to 
 * <b>RegLoadKey</b>, 
 * <b>RegReplaceKey</b>, or 
 * <b>RegRestoreKey</b> for the file will fail.
 * 
 * Using <b>RegSaveKeyEx</b> together with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> to copy subtrees in the registry is not recommended. This method does not trigger notifications and can invalidate handles used by other applications. Instead, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shcopykeya">SHCopyKey</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcopytreea">RegCopyTree</a> function.
 * 
 * The calling process must have the SE_BACKUP_NAME privilege enabled. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSaveKeyEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. 
 * 
 * This function does not support the <b>HKEY_CLASSES_ROOT</b> predefined key.
 * @param {PSTR} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
 * 
 * 
 * 
 * 
 * The new file has the archive attribute.
 * 
 * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
 * @param {REG_SAVE_FORMAT} Flags 
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * 
 * If more than one of the possible values listed above for the <i>Flags</i> parameter is specified in one call to this function—for example, if two or more values are OR'ed— or if REG_NO_COMPRESSION is specified and <i>hKey</i> specifies a key that is not the root of a hive, this function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsavekeyexa
 * @since windows5.1.2600
 */
export RegSaveKeyExA(_hKey, lpFile, lpSecurityAttributes, Flags) {
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegSaveKeyExA", HKEY, _hKey, "ptr", lpFile, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, REG_SAVE_FORMAT, Flags, WIN32_ERROR)
    return result
}

/**
 * Saves the specified key and all of its subkeys and values to a registry file, in the specified format. (Unicode)
 * @remarks
 * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a>, this function does not support the <b>HKEY_CLASSES_ROOT</b> predefined key.
 * 
 * If <i>hKey</i> represents a key on a remote computer, the path described by <i>lpFile</i> is relative to the remote computer.
 * 
 * The 
 * <b>RegSaveKeyEx</b> function saves only nonvolatile keys. It does not save volatile keys. A key is made volatile or nonvolatile at its creation; see 
 * <b>RegCreateKeyEx</b>.
 * 
 * You can use the file created by 
 * <b>RegSaveKeyEx</b> in subsequent calls to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regreplacekeya">RegReplaceKey</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> function. If 
 * <b>RegSaveKeyEx</b> fails partway through its operation, the file will be corrupt and subsequent calls to 
 * <b>RegLoadKey</b>, 
 * <b>RegReplaceKey</b>, or 
 * <b>RegRestoreKey</b> for the file will fail.
 * 
 * Using <b>RegSaveKeyEx</b> together with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regrestorekeya">RegRestoreKey</a> to copy subtrees in the registry is not recommended. This method does not trigger notifications and can invalidate handles used by other applications. Instead, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shcopykeya">SHCopyKey</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcopytreea">RegCopyTree</a> function.
 * 
 * The calling process must have the SE_BACKUP_NAME privilege enabled. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winreg.h header defines RegSaveKeyEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKEY} _hKey A handle to an open registry key. 
 * 
 * This function does not support the <b>HKEY_CLASSES_ROOT</b> predefined key.
 * @param {PWSTR} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
 * 
 * 
 * 
 * 
 * The new file has the archive attribute.
 * 
 * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key.
 * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
 * @param {REG_SAVE_FORMAT} Flags 
 * @returns {WIN32_ERROR} If the function succeeds, the return value is ERROR_SUCCESS.
 * 
 * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
 * 
 * If more than one of the possible values listed above for the <i>Flags</i> parameter is specified in one call to this function—for example, if two or more values are OR'ed— or if REG_NO_COMPRESSION is specified and <i>hKey</i> specifies a key that is not the root of a hive, this function returns ERROR_INVALID_PARAMETER.
 * @see https://learn.microsoft.com/windows/win32/api/winreg/nf-winreg-regsavekeyexw
 * @since windows5.1.2600
 */
export RegSaveKeyExW(_hKey, lpFile, lpSecurityAttributes, Flags) {
    lpFile := lpFile is String ? StrPtr(lpFile) : lpFile

    result := DllCall("ADVAPI32.dll\RegSaveKeyExW", HKEY, _hKey, "ptr", lpFile, SECURITY_ATTRIBUTES.Ptr, lpSecurityAttributes, REG_SAVE_FORMAT, Flags, WIN32_ERROR)
    return result
}

/**
 * 
 * @param {HKEY} hkeyPrimary 
 * @param {PWSTR} pwszPrimarySubKey 
 * @param {HKEY} hkeyFallback 
 * @param {PWSTR} pwszFallbackSubKey 
 * @param {PWSTR} pwszValue 
 * @param {Integer} dwFlags 
 * @param {Pointer<Integer>} pdwType 
 * @param {Integer} pvData 
 * @param {Integer} cbDataIn 
 * @param {Pointer<Integer>} pcbDataOut 
 * @returns {WIN32_ERROR} 
 */
export GetRegistryValueWithFallbackW(hkeyPrimary, pwszPrimarySubKey, hkeyFallback, pwszFallbackSubKey, pwszValue, dwFlags, pdwType, pvData, cbDataIn, pcbDataOut) {
    pwszPrimarySubKey := pwszPrimarySubKey is String ? StrPtr(pwszPrimarySubKey) : pwszPrimarySubKey
    pwszFallbackSubKey := pwszFallbackSubKey is String ? StrPtr(pwszFallbackSubKey) : pwszFallbackSubKey
    pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

    pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"
    pcbDataOutMarshal := pcbDataOut is VarRef ? "uint*" : "ptr"

    result := DllCall("api-ms-win-core-state-helpers-l1-1-0.dll\GetRegistryValueWithFallbackW", HKEY, hkeyPrimary, "ptr", pwszPrimarySubKey, HKEY, hkeyFallback, "ptr", pwszFallbackSubKey, "ptr", pwszValue, "uint", dwFlags, pdwTypeMarshal, pdwType, "ptr", pvData, "uint", cbDataIn, pcbDataOutMarshal, pcbDataOut, WIN32_ERROR)
    return result
}

;@endregion Functions
