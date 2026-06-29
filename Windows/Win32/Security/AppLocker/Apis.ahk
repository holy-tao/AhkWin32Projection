#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SAFER_OBJECT_INFO_CLASS.ahk" { SAFER_OBJECT_INFO_CLASS }
#Import ".\SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS.ahk" { SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SAFER_POLICY_INFO_CLASS.ahk" { SAFER_POLICY_INFO_CLASS }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SAFER_CODE_PROPERTIES_V2.ahk" { SAFER_CODE_PROPERTIES_V2 }
#Import "..\SAFER_LEVEL_HANDLE.ahk" { SAFER_LEVEL_HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.AppLocker
 */

;@region Functions
/**
 * Gets information about a policy.
 * @param {Integer} dwScopeId The scope of the query. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_SCOPEID_MACHINE"></a><a id="safer_scopeid_machine"></a><dl>
 * <dt><b>SAFER_SCOPEID_MACHINE</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The scope of the query is by computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_SCOPEID_USER"></a><a id="safer_scopeid_user"></a><dl>
 * <dt><b>SAFER_SCOPEID_USER</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The scope of the query is by user.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {SAFER_POLICY_INFO_CLASS} SaferPolicyInfoClass A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ne-winsafer-safer_policy_info_class">SAFER_POLICY_INFO_CLASS</a>  enumeration value  that specifies the type of policy information that should be returned. The specified value determines the size and type of the <i>InfoBuffer</i> parameter. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyLevelList"></a><a id="saferpolicylevellist"></a><a id="SAFERPOLICYLEVELLIST"></a><dl>
 * <dt><b>SaferPolicyLevelList</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries for the list of all levels defined in a policy.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b> array of LevelIds.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyEnableTransparentEnforcement"></a><a id="saferpolicyenabletransparentenforcement"></a><a id="SAFERPOLICYENABLETRANSPARENTENFORCEMENT"></a><dl>
 * <dt><b>SaferPolicyEnableTransparentEnforcement</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries for the policy value to determine whether DLL checking is enabled.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b> Boolean.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyDefaultLevel"></a><a id="saferpolicydefaultlevel"></a><a id="SAFERPOLICYDEFAULTLEVEL"></a><dl>
 * <dt><b>SaferPolicyDefaultLevel</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries for the default policy level.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b> LevelId.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyEvaluateUserScope"></a><a id="saferpolicyevaluateuserscope"></a><a id="SAFERPOLICYEVALUATEUSERSCOPE"></a><dl>
 * <dt><b>SaferPolicyEvaluateUserScope</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries to determine whether user scope rules should be consulted during policy evaluation.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyScopeFlags"></a><a id="saferpolicyscopeflags"></a><a id="SAFERPOLICYSCOPEFLAGS"></a><dl>
 * <dt><b>SaferPolicyScopeFlags</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries to determine whether the policy is to skip members of the local administrators group.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} InfoBufferSize The size, in bytes, of the <i>InfoBuffer</i> parameter.
 * @param {Integer} InfoBuffer A buffer to contain the results of the query. The size and type of the returned information is determined by the <i>SaferPolicyInfoClass</i> parameter. For the type of the returned information for each possible value of the <i>SaferPolicyInfoClass</i> parameter, see the <i>SaferPolicyInfoClass</i> parameter.
 * @param {Pointer<Integer>} InfoBufferRetSize The number of bytes in the <i>InfoBuffer</i> parameter that were filled with policy information.
 * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-safergetpolicyinformation
 * @since windows5.1.2600
 */
export SaferGetPolicyInformation(dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer, InfoBufferRetSize) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    InfoBufferRetSizeMarshal := InfoBufferRetSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferGetPolicyInformation", "uint", dwScopeId, SAFER_POLICY_INFO_CLASS, SaferPolicyInfoClass, "uint", InfoBufferSize, "ptr", InfoBuffer, InfoBufferRetSizeMarshal, InfoBufferRetSize, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the global policy controls.
 * @param {Integer} dwScopeId The scope of the query. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_SCOPEID_MACHINE"></a><a id="safer_scopeid_machine"></a><dl>
 * <dt><b>SAFER_SCOPEID_MACHINE</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The scope of the query is by computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_SCOPEID_USER"></a><a id="safer_scopeid_user"></a><dl>
 * <dt><b>SAFER_SCOPEID_USER</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The scope of the query is by user.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {SAFER_POLICY_INFO_CLASS} SaferPolicyInfoClass A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ne-winsafer-safer_policy_info_class">SAFER_POLICY_INFO_CLASS</a>  enumeration value  that specifies the type of policy information that should be set. The specified value determines the size and type of the <i>InfoBuffer</i> parameter. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyLevelList"></a><a id="saferpolicylevellist"></a><a id="SAFERPOLICYLEVELLIST"></a><dl>
 * <dt><b>SaferPolicyLevelList</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the list of all levels defined in a policy.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b> array of LevelIds.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyEnableTransparentEnforcement"></a><a id="saferpolicyenabletransparentenforcement"></a><a id="SAFERPOLICYENABLETRANSPARENTENFORCEMENT"></a><dl>
 * <dt><b>SaferPolicyEnableTransparentEnforcement</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the policy value to determine whether DLL checking is enabled.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b> Boolean.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyDefaultLevel"></a><a id="saferpolicydefaultlevel"></a><a id="SAFERPOLICYDEFAULTLEVEL"></a><dl>
 * <dt><b>SaferPolicyDefaultLevel</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the default policy level.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b> LevelId.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyEvaluateUserScope"></a><a id="saferpolicyevaluateuserscope"></a><a id="SAFERPOLICYEVALUATEUSERSCOPE"></a><dl>
 * <dt><b>SaferPolicyEvaluateUserScope</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets whether user scope rules should be consulted during policy evaluation.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferPolicyScopeFlags"></a><a id="saferpolicyscopeflags"></a><a id="SAFERPOLICYSCOPEFLAGS"></a><dl>
 * <dt><b>SaferPolicyScopeFlags</b></dt>
 * <dt>5</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets whether the policy is to skip members of the local administrators group.
 * 
 * <i>InfoBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} InfoBufferSize The size, in bytes, of the <i>InfoBuffer</i> parameter.
 * @param {Integer} InfoBuffer A buffer to contain the results of the query. The size and type of the returned information is determined by the <i>SaferPolicyInfoClass</i> parameter. For the type of the returned information for each possible value of the <i>SaferPolicyInfoClass</i> parameter, see the <i>SaferPolicyInfoClass</i> parameter.
 * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-safersetpolicyinformation
 * @since windows5.1.2600
 */
export SaferSetPolicyInformation(dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferSetPolicyInformation", "uint", dwScopeId, SAFER_POLICY_INFO_CLASS, SaferPolicyInfoClass, "uint", InfoBufferSize, "ptr", InfoBuffer, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Opens a SAFER_LEVEL_HANDLE.
 * @param {Integer} dwScopeId The scope of the level to be created. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_SCOPEID_MACHINE"></a><a id="safer_scopeid_machine"></a><dl>
 * <dt><b>SAFER_SCOPEID_MACHINE</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The scope of the created level is by computer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_SCOPEID_USER"></a><a id="safer_scopeid_user"></a><dl>
 * <dt><b>SAFER_SCOPEID_USER</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The scope of the created level is by user.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} dwLevelId The level of the handle to be opened. The following table shows the possible values.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_LEVELID_CONSTRAINED"></a><a id="safer_levelid_constrained"></a><dl>
 * <dt><b>SAFER_LEVELID_CONSTRAINED</b></dt>
 * <dt>0x10000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Software cannot access certain resources, such as cryptographic keys and credentials, regardless of the user rights of the user.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_LEVELID_DISALLOWED"></a><a id="safer_levelid_disallowed"></a><dl>
 * <dt><b>SAFER_LEVELID_DISALLOWED</b></dt>
 * <dt>0x00000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Software will not run, regardless of the user rights of the user.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_LEVELID_FULLYTRUSTED"></a><a id="safer_levelid_fullytrusted"></a><dl>
 * <dt><b>SAFER_LEVELID_FULLYTRUSTED</b></dt>
 * <dt>0x40000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Software user rights are determined by the user rights of the user.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_LEVELID_NORMALUSER"></a><a id="safer_levelid_normaluser"></a><dl>
 * <dt><b>SAFER_LEVELID_NORMALUSER</b></dt>
 * <dt>0x20000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Allows programs to execute as a user that does not have <b>Administrator</b> or <b>Power User</b> user rights. Software can access resources accessible by normal users.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_LEVELID_UNTRUSTED"></a><a id="safer_levelid_untrusted"></a><dl>
 * <dt><b>SAFER_LEVELID_UNTRUSTED</b></dt>
 * <dt>0x01000</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Allows programs to execute with access only to resources granted to open well-known groups, blocking access to <b>Administrator</b> and <b>Power User</b> privileges and personally granted rights.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} OpenFlags This can be the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SAFER_LEVEL_OPEN"></a><a id="safer_level_open"></a><dl>
 * <dt><b>SAFER_LEVEL_OPEN</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%"></td>
 * </tr>
 * </table>
 * @param {Pointer<SAFER_LEVEL_HANDLE>} pLevelHandle The returned SAFER_LEVEL_HANDLE. When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safercloselevel">SaferCloseLevel</a> function.
 * @returns {BOOL} Returns nonzero if successful or zero otherwise. 
 * 						
 * 
 * For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-safercreatelevel
 * @since windows5.1.2600
 */
export SaferCreateLevel(dwScopeId, dwLevelId, OpenFlags, pLevelHandle) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferCreateLevel", "uint", dwScopeId, "uint", dwLevelId, "uint", OpenFlags, SAFER_LEVEL_HANDLE.Ptr, pLevelHandle, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Closes a SAFER_LEVEL_HANDLE that was opened by using the SaferIdentifyLevel function or the SaferCreateLevel function.
 * @param {SAFER_LEVEL_HANDLE} hLevelHandle The SAFER_LEVEL_HANDLE to be closed.
 * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-safercloselevel
 * @since windows5.1.2600
 */
export SaferCloseLevel(hLevelHandle) {
    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferCloseLevel", SAFER_LEVEL_HANDLE, hLevelHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information about a level.
 * @param {Integer} dwNumProperties Number of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_code_properties_v2">SAFER_CODE_PROPERTIES</a> structures in the <i>pCodeproperties</i>  parameter.
 * @param {Pointer<SAFER_CODE_PROPERTIES_V2>} pCodeProperties Array of <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_code_properties_v2">SAFER_CODE_PROPERTIES</a> structures. Each structure contains a code file to be checked and the  criteria used to check the file.
 * @param {Pointer<SAFER_LEVEL_HANDLE>} pLevelHandle The returned SAFER_LEVEL_HANDLE. When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safercloselevel">SaferCloseLevel</a> function.
 * @param {Pointer<Void>} lpReserved Reserved for future use. Should be set to <b>NULL</b>.
 * 
 * Beginning with Windows 8 and Windows Server 2012 SRP_POLICY_APPX is defined as Windows Store app.
 * @returns {BOOL} <b>TRUE</b> if a SAFER_LEVEL_HANDLE was opened; otherwise,  <b>FALSE</b>. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-saferidentifylevel
 * @since windows5.1.2600
 */
export SaferIdentifyLevel(dwNumProperties, pCodeProperties, pLevelHandle, lpReserved) {
    lpReservedMarshal := lpReserved is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferIdentifyLevel", "uint", dwNumProperties, SAFER_CODE_PROPERTIES_V2.Ptr, pCodeProperties, SAFER_LEVEL_HANDLE.Ptr, pLevelHandle, lpReservedMarshal, lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Restricts a token using restrictions specified by a SAFER_LEVEL_HANDLE.
 * @param {SAFER_LEVEL_HANDLE} LevelHandle <b>SAFER_LEVEL_HANDLE</b> that contains the restrictions to place on the input token. Do not pass handles with a LevelId of <b>SAFER_LEVELID_FULLYTRUSTED</b> or <b>SAFER_LEVELID_DISALLOWED</b> to this function. This is because <b>SAFER_LEVELID_FULLYTRUSTED</b> is unrestricted and <b>SAFER_LEVELID_DISALLOWED</b> does not contain a token.
 * @param {HANDLE} InAccessToken Token to be restricted. If this parameter is <b>NULL</b>, the token of the current thread will be used. If the current thread does not contain a token, the token of the current process is used.
 * @param {Pointer<HANDLE>} OutAccessToken The resulting restricted token.
 * @param {SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS} dwFlags 
 * @param {Pointer<Void>} lpReserved If the <b>SAFER_TOKEN_COMPARE_ONLY</b>  flag is set, this parameter, on output, specifies the result of the token comparison. The output value is an <b>LPDWORD</b>. A value of –1 indicates that the resulting token would be less privileged than the token specified by the <i>InAccessToken</i> parameter.
 * 
 * If the <b>SAFER_TOKEN_WANT_FLAGS</b> flag is set, and the <b>SAFER_TOKEN_COMPARE_ONLY</b> flag is not set, this parameter is an <b>LPDWORD</b> value that specifies the flags used to create the restricted token.
 * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-safercomputetokenfromlevel
 * @since windows5.1.2600
 */
export SaferComputeTokenFromLevel(LevelHandle, InAccessToken, OutAccessToken, dwFlags, lpReserved) {
    lpReservedMarshal := lpReserved is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferComputeTokenFromLevel", SAFER_LEVEL_HANDLE, LevelHandle, HANDLE, InAccessToken, HANDLE.Ptr, OutAccessToken, SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS, dwFlags, lpReservedMarshal, lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information about a policy level.
 * @param {SAFER_LEVEL_HANDLE} LevelHandle The handle of the level to be queried.
 * @param {SAFER_OBJECT_INFO_CLASS} dwInfoType A SAFER_OBJECT_INFO_CLASS enumeration value that specifies the type of object information that should be returned.  The specified value determines the size and type of the <i>lpQueryBuffer</i> parameter. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectLevelId"></a><a id="saferobjectlevelid"></a><a id="SAFEROBJECTLEVELID"></a><dl>
 * <dt><b>SaferObjectLevelId</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries for the LEVELID constant.
 * 
 * <i>lpQueryBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectScopeId"></a><a id="saferobjectscopeid"></a><a id="SAFEROBJECTSCOPEID"></a><dl>
 * <dt><b>SaferObjectScopeId</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries for the user or machine scope.
 * 
 * <i>lpQueryBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectFriendlyName"></a><a id="saferobjectfriendlyname"></a><a id="SAFEROBJECTFRIENDLYNAME"></a><dl>
 * <dt><b>SaferObjectFriendlyName</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries for the display name.
 * 
 * <i>lpQueryBuffer</i> return type: <b>LPCWSTR</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectDescription"></a><a id="saferobjectdescription"></a><a id="SAFEROBJECTDESCRIPTION"></a><dl>
 * <dt><b>SaferObjectDescription</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Queries for the description.
 * 
 * <i>lpQueryBuffer</i> return type: <b>LPCWSTR</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} lpQueryBuffer A buffer to contain the results of the query. For the type of the returned information for each possible value of the <i>dwInfoType</i> parameter, see the <i>dwInfoType</i> parameter.
 * @param {Integer} dwInBufferSize The size of the <i>lpQueryBuffer</i> parameter in bytes.
 * @param {Pointer<Integer>} lpdwOutBufferSize A pointer to return the output size of the <i>lpQueryBuffer</i> parameter.
 * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-safergetlevelinformation
 * @since windows5.1.2600
 */
export SaferGetLevelInformation(LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize, lpdwOutBufferSize) {
    lpdwOutBufferSizeMarshal := lpdwOutBufferSize is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferGetLevelInformation", SAFER_LEVEL_HANDLE, LevelHandle, SAFER_OBJECT_INFO_CLASS, dwInfoType, "ptr", lpQueryBuffer, "uint", dwInBufferSize, lpdwOutBufferSizeMarshal, lpdwOutBufferSize, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the information about a policy level.
 * @param {SAFER_LEVEL_HANDLE} LevelHandle The handle of the level to be set.
 * @param {SAFER_OBJECT_INFO_CLASS} dwInfoType A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ne-winsafer-safer_object_info_class">SAFER_OBJECT_INFO_CLASS</a> enumeration value that specifies the type of object information that should be set.  The specified value determines the size and type of the <i>lpQueryBuffer</i> parameter. The following table shows the possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectLevelId"></a><a id="saferobjectlevelid"></a><a id="SAFEROBJECTLEVELID"></a><dl>
 * <dt><b>SaferObjectLevelId</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the LEVELID constant.
 * 
 * <i>lpQueryBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectScopeId"></a><a id="saferobjectscopeid"></a><a id="SAFEROBJECTSCOPEID"></a><dl>
 * <dt><b>SaferObjectScopeId</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the user or machine scope.
 * 
 * <i>lpQueryBuffer</i> return type: <b>DWORD</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectFriendlyName"></a><a id="saferobjectfriendlyname"></a><a id="SAFEROBJECTFRIENDLYNAME"></a><dl>
 * <dt><b>SaferObjectFriendlyName</b></dt>
 * <dt>3</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the display name.
 * 
 * <i>lpQueryBuffer</i> return type: <b>LPCWSTR</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SaferObjectDescription"></a><a id="saferobjectdescription"></a><a id="SAFEROBJECTDESCRIPTION"></a><dl>
 * <dt><b>SaferObjectDescription</b></dt>
 * <dt>4</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sets the description.
 * 
 * <i>lpQueryBuffer</i> return type: <b>LPCWSTR</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} lpQueryBuffer A buffer to contain the results of the query. For the type of the returned information for each possible value of the <i>dwInfoType</i> parameter, see the <i>dwInfoType</i> parameter.
 * @param {Integer} dwInBufferSize The size, in bytes, of the <i>lpQueryBuffer</i> parameter.
 * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-safersetlevelinformation
 * @since windows5.1.2600
 */
export SaferSetLevelInformation(LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize) {
    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferSetLevelInformation", SAFER_LEVEL_HANDLE, LevelHandle, SAFER_OBJECT_INFO_CLASS, dwInfoType, "ptr", lpQueryBuffer, "uint", dwInBufferSize, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Saves messages to an event log.
 * @remarks
 * If <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-saferidentifylevel">SaferIdentifyLevel</a> returns a SAFER_LEVEL_HANDLE with a LevelId that is anything other than SAFER_LEVELID_FULLYTRUSTED (0x40000), <b>SaferRecordEventLogEntry</b> can be called to facilitate troubleshooting. For example, clicking a button in excel.exe might attempt to launch another process that is not fully trusted. This might display an obscure error message because the program remapped the error returned from CreateProcess. To ease troubleshooting, some Safer functions call <b>SaferRecordEventLogEntry</b> to send an event to the event log.
 * @param {SAFER_LEVEL_HANDLE} hLevel SAFER_LEVEL_HANDLE that contains the details of the rule to send to the event log.
 * @param {PWSTR} szTargetPath Path of the file that attempted to run.
 * @returns {BOOL} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-saferrecordeventlogentry
 * @since windows5.1.2600
 */
export SaferRecordEventLogEntry(hLevel, szTargetPath) {
    static lpReserved := 0 ;Reserved parameters must always be NULL

    szTargetPath := szTargetPath is String ? StrPtr(szTargetPath) : szTargetPath

    A_LastError := 0

    result := DllCall("ADVAPI32.dll\SaferRecordEventLogEntry", SAFER_LEVEL_HANDLE, hLevel, "ptr", szTargetPath, "ptr", lpReserved, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Determines whether a specified file is an executable file.
 * @remarks
 * The following file name extensions are examples of executable file types.  This is not a complete list.
 * 
 * <ul>
 * <li>.bat</li>
 * <li>.cmd</li>
 * <li>.com</li>
 * <li>.exe</li>
 * <li>.js</li>
 * <li>.lnk</li>
 * <li>.pif</li>
 * <li>.pl</li>
 * <li>.shs</li>
 * <li>.url</li>
 * <li>.vbs</li>
 * </ul>
 * The security policy Microsoft Management Console (MMC) snap-in (Secpol.msc) controls which extensions are considered executable file types.
 * 
 * <p class="proch"><b>To view or modify the extensions that are considered executable file types</b>
 * 
 * <ol>
 * <li>Run Secpol.msc.</li>
 * <li>Expand  <b>Software Restriction Policies</b>, and then double-click <b>Designated File Types</b>.</li>
 * </ol>
 * <div class="alert"><b>Note</b>  To view the <b>Designated File Types</b> property page, you may need to create  the <b>Software Restriction Policies</b> node. To create  the <b>Software Restriction Policies</b> node, follow the instructions that appear when you expand <b>Software Restriction Policies</b>.</div>
 * <div> </div>
 * @param {PWSTR} szFullPathname Pointer to a <b>null</b>-terminated <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> character string for the name of the file. The path is optional because only the file name extension is evaluated. The evaluation of the file name extension is not case-sensitive. This parameter cannot be <b>NULL</b> or an empty string, and the specified file must include a file name extension.
 * @param {BOOLEAN} bFromShellExecute Boolean value that determines whether .exe files are treated as executable files for the file type evaluation. Set this value to <b>TRUE</b> to omit .exe files from the evaluation or to <b>FALSE</b> to include them.
 * @returns {BOOL} If the function  successfully recognizes the file name's extension as an executable file type, the return value is <b>TRUE</b>.
 * 
 * If the function fails, or if <i>szFullPath</i> identifies a file name with a nonexecutable extension, the function returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/nf-winsafer-saferiisexecutablefiletype
 * @since windows5.1.2600
 */
export SaferiIsExecutableFileType(szFullPathname, bFromShellExecute) {
    szFullPathname := szFullPathname is String ? StrPtr(szFullPathname) : szFullPathname

    result := DllCall("ADVAPI32.dll\SaferiIsExecutableFileType", "ptr", szFullPathname, BOOLEAN, bFromShellExecute, BOOL)
    return result
}

;@endregion Functions
