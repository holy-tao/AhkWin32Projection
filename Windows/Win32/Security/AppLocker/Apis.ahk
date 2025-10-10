#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class AppLocker {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_SCOPEID_MACHINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_SCOPEID_USER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_LEVELID_FULLYTRUSTED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_LEVELID_NORMALUSER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_LEVELID_CONSTRAINED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_LEVELID_UNTRUSTED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_LEVELID_DISALLOWED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_LEVEL_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_MAX_FRIENDLYNAME_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_MAX_DESCRIPTION_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_MAX_HASH_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_CRITERIA_IMAGEPATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_CRITERIA_NOSIGNEDHASH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_CRITERIA_IMAGEHASH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_CRITERIA_AUTHENTICODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_CRITERIA_URLZONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_CRITERIA_APPX_PACKAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_CRITERIA_IMAGEPATH_NT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_JOBID_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_JOBID_CONSTRAINED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_JOBID_UNTRUSTED => 50331648

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_ONLY_EXES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_SANDBOX_INERT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_HASH_DUPLICATE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_ONLY_AUDIT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_BLOCK_CLIENT_UI => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_UIFLAGS_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_UIFLAGS_INFORMATION_PROMPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_UIFLAGS_OPTION_PROMPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_POLICY_UIFLAGS_HIDDEN => 4

    /**
     * @type {String}
     */
    static SRP_POLICY_EXE => "EXE"

    /**
     * @type {String}
     */
    static SRP_POLICY_DLL => "DLL"

    /**
     * @type {String}
     */
    static SRP_POLICY_MSI => "MSI"

    /**
     * @type {String}
     */
    static SRP_POLICY_SCRIPT => "SCRIPT"

    /**
     * @type {String}
     */
    static SRP_POLICY_SHELL => "SHELL"

    /**
     * @type {String}
     */
    static SRP_POLICY_NOV2 => "IGNORESRPV2"

    /**
     * @type {String}
     */
    static SRP_POLICY_APPX => "APPX"

    /**
     * @type {String}
     */
    static SRP_POLICY_WLDPMSI => "WLDPMSI"

    /**
     * @type {String}
     */
    static SRP_POLICY_WLDPSCRIPT => "WLDPSCRIPT"

    /**
     * @type {String}
     */
    static SRP_POLICY_WLDPCONFIGCI => "WLDPCONFIGCI"

    /**
     * @type {String}
     */
    static SRP_POLICY_MANAGEDINSTALLER => "MANAGEDINSTALLER"
;@endregion Constants

;@region Methods
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
     * @param {Integer} SaferPolicyInfoClass A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ne-winsafer-safer_policy_info_class">SAFER_POLICY_INFO_CLASS</a>  enumeration value  that specifies the type of policy information that should be returned. The specified value determines the size and type of the <i>InfoBuffer</i> parameter. The following table shows the possible values.
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
     * @param {Pointer} InfoBuffer A buffer to contain the results of the query. The size and type of the returned information is determined by the <i>SaferPolicyInfoClass</i> parameter. For the type of the returned information for each possible value of the <i>SaferPolicyInfoClass</i> parameter, see the <i>SaferPolicyInfoClass</i> parameter.
     * @param {Pointer<UInt32>} InfoBufferRetSize The number of bytes in the <i>InfoBuffer</i> parameter that were filled with policy information.
     * @returns {Integer} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-safergetpolicyinformation
     * @since windows5.1.2600
     */
    static SaferGetPolicyInformation(dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer, InfoBufferRetSize) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferGetPolicyInformation", "uint", dwScopeId, "int", SaferPolicyInfoClass, "uint", InfoBufferSize, "ptr", InfoBuffer, "uint*", InfoBufferRetSize, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

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
     * @param {Integer} SaferPolicyInfoClass A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ne-winsafer-safer_policy_info_class">SAFER_POLICY_INFO_CLASS</a>  enumeration value  that specifies the type of policy information that should be set. The specified value determines the size and type of the <i>InfoBuffer</i> parameter. The following table shows the possible values.
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
     * @param {Pointer} InfoBuffer A buffer to contain the results of the query. The size and type of the returned information is determined by the <i>SaferPolicyInfoClass</i> parameter. For the type of the returned information for each possible value of the <i>SaferPolicyInfoClass</i> parameter, see the <i>SaferPolicyInfoClass</i> parameter.
     * @returns {Integer} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-safersetpolicyinformation
     * @since windows5.1.2600
     */
    static SaferSetPolicyInformation(dwScopeId, SaferPolicyInfoClass, InfoBufferSize, InfoBuffer) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferSetPolicyInformation", "uint", dwScopeId, "int", SaferPolicyInfoClass, "uint", InfoBufferSize, "ptr", InfoBuffer, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

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
     * @param {Pointer<Void>} pLevelHandle The returned SAFER_LEVEL_HANDLE. When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safercloselevel">SaferCloseLevel</a> function.
     * @returns {Integer} Returns nonzero if successful or zero otherwise. 
     * 						
     * 
     * For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-safercreatelevel
     * @since windows5.1.2600
     */
    static SaferCreateLevel(dwScopeId, dwLevelId, OpenFlags, pLevelHandle) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferCreateLevel", "uint", dwScopeId, "uint", dwLevelId, "uint", OpenFlags, "ptr", pLevelHandle, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a SAFER_LEVEL_HANDLE that was opened by using the SaferIdentifyLevel function or the SaferCreateLevel function.
     * @param {Pointer<Void>} hLevelHandle The SAFER_LEVEL_HANDLE to be closed.
     * @returns {Integer} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-safercloselevel
     * @since windows5.1.2600
     */
    static SaferCloseLevel(hLevelHandle) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferCloseLevel", "ptr", hLevelHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a level.
     * @param {Integer} dwNumProperties Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_code_properties_v2">SAFER_CODE_PROPERTIES</a> structures in the <i>pCodeproperties</i>  parameter.
     * @param {Pointer<SAFER_CODE_PROPERTIES_V2>} pCodeProperties Array of <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_code_properties_v2">SAFER_CODE_PROPERTIES</a> structures. Each structure contains a code file to be checked and the  criteria used to check the file.
     * @param {Pointer<Void>} pLevelHandle The returned SAFER_LEVEL_HANDLE. When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safercloselevel">SaferCloseLevel</a> function.
     * @param {Pointer<Void>} lpReserved Reserved for future use. Should be set to <b>NULL</b>.
     * 
     * Beginning with Windows 8 and Windows Server 2012 SRP_POLICY_APPX is defined as Windows Store app.
     * @returns {Integer} <b>TRUE</b> if a SAFER_LEVEL_HANDLE was opened; otherwise,  <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-saferidentifylevel
     * @since windows5.1.2600
     */
    static SaferIdentifyLevel(dwNumProperties, pCodeProperties, pLevelHandle, lpReserved) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferIdentifyLevel", "uint", dwNumProperties, "ptr", pCodeProperties, "ptr", pLevelHandle, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Restricts a token using restrictions specified by a SAFER_LEVEL_HANDLE.
     * @param {Pointer<Void>} LevelHandle <b>SAFER_LEVEL_HANDLE</b> that contains the restrictions to place on the input token. Do not pass handles with a LevelId of <b>SAFER_LEVELID_FULLYTRUSTED</b> or <b>SAFER_LEVELID_DISALLOWED</b> to this function. This is because <b>SAFER_LEVELID_FULLYTRUSTED</b> is unrestricted and <b>SAFER_LEVELID_DISALLOWED</b> does not contain a token.
     * @param {Pointer<Void>} InAccessToken Token to be restricted. If this parameter is <b>NULL</b>, the token of the current thread will be used. If the current thread does not contain a token, the token of the current process is used.
     * @param {Pointer<Void>} OutAccessToken The resulting restricted token.
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} lpReserved If the <b>SAFER_TOKEN_COMPARE_ONLY</b>  flag is set, this parameter, on output, specifies the result of the token comparison. The output value is an <b>LPDWORD</b>. A value of –1 indicates that the resulting token would be less privileged than the token specified by the <i>InAccessToken</i> parameter.
     * 
     * If the <b>SAFER_TOKEN_WANT_FLAGS</b> flag is set, and the <b>SAFER_TOKEN_COMPARE_ONLY</b> flag is not set, this parameter is an <b>LPDWORD</b> value that specifies the flags used to create the restricted token.
     * @returns {Integer} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-safercomputetokenfromlevel
     * @since windows5.1.2600
     */
    static SaferComputeTokenFromLevel(LevelHandle, InAccessToken, OutAccessToken, dwFlags, lpReserved) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferComputeTokenFromLevel", "ptr", LevelHandle, "ptr", InAccessToken, "ptr", OutAccessToken, "uint", dwFlags, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a policy level.
     * @param {Pointer<Void>} LevelHandle The handle of the level to be queried.
     * @param {Integer} dwInfoType A SAFER_OBJECT_INFO_CLASS enumeration value that specifies the type of object information that should be returned.  The specified value determines the size and type of the <i>lpQueryBuffer</i> parameter. The following table shows the possible values.
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
     * @param {Pointer} lpQueryBuffer A buffer to contain the results of the query. For the type of the returned information for each possible value of the <i>dwInfoType</i> parameter, see the <i>dwInfoType</i> parameter.
     * @param {Integer} dwInBufferSize The size of the <i>lpQueryBuffer</i> parameter in bytes.
     * @param {Pointer<UInt32>} lpdwOutBufferSize A pointer to return the output size of the <i>lpQueryBuffer</i> parameter.
     * @returns {Integer} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-safergetlevelinformation
     * @since windows5.1.2600
     */
    static SaferGetLevelInformation(LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize, lpdwOutBufferSize) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferGetLevelInformation", "ptr", LevelHandle, "int", dwInfoType, "ptr", lpQueryBuffer, "uint", dwInBufferSize, "uint*", lpdwOutBufferSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the information about a policy level.
     * @param {Pointer<Void>} LevelHandle The handle of the level to be set.
     * @param {Integer} dwInfoType A <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ne-winsafer-safer_object_info_class">SAFER_OBJECT_INFO_CLASS</a> enumeration value that specifies the type of object information that should be set.  The specified value determines the size and type of the <i>lpQueryBuffer</i> parameter. The following table shows the possible values.
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
     * @param {Pointer} lpQueryBuffer A buffer to contain the results of the query. For the type of the returned information for each possible value of the <i>dwInfoType</i> parameter, see the <i>dwInfoType</i> parameter.
     * @param {Integer} dwInBufferSize The size, in bytes, of the <i>lpQueryBuffer</i> parameter.
     * @returns {Integer} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-safersetlevelinformation
     * @since windows5.1.2600
     */
    static SaferSetLevelInformation(LevelHandle, dwInfoType, lpQueryBuffer, dwInBufferSize) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferSetLevelInformation", "ptr", LevelHandle, "int", dwInfoType, "ptr", lpQueryBuffer, "uint", dwInBufferSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Saves messages to an event log.
     * @param {Pointer<Void>} hLevel SAFER_LEVEL_HANDLE that contains the details of the rule to send to the event log.
     * @param {Pointer<Char>} szTargetPath Path of the file that attempted to run.
     * @returns {Integer} <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-saferrecordeventlogentry
     * @since windows5.1.2600
     */
    static SaferRecordEventLogEntry(hLevel, szTargetPath) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        szTargetPath := szTargetPath is String? StrPtr(szTargetPath) : szTargetPath

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SaferRecordEventLogEntry", "ptr", hLevel, "ptr", szTargetPath, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a specified file is an executable file.
     * @param {Pointer<Char>} szFullPathname Pointer to a <b>null</b>-terminated <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> character string for the name of the file. The path is optional because only the file name extension is evaluated. The evaluation of the file name extension is not case-sensitive. This parameter cannot be <b>NULL</b> or an empty string, and the specified file must include a file name extension.
     * @param {Integer} bFromShellExecute Boolean value that determines whether .exe files are treated as executable files for the file type evaluation. Set this value to <b>TRUE</b> to omit .exe files from the evaluation or to <b>FALSE</b> to include them.
     * @returns {Integer} If the function  successfully recognizes the file name's extension as an executable file type, the return value is <b>TRUE</b>.
     * 
     * If the function fails, or if <i>szFullPath</i> identifies a file name with a nonexecutable extension, the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winsafer/nf-winsafer-saferiisexecutablefiletype
     * @since windows5.1.2600
     */
    static SaferiIsExecutableFileType(szFullPathname, bFromShellExecute) {
        szFullPathname := szFullPathname is String? StrPtr(szFullPathname) : szFullPathname

        result := DllCall("ADVAPI32.dll\SaferiIsExecutableFileType", "ptr", szFullPathname, "char", bFromShellExecute, "int")
        return result
    }

;@endregion Methods
}
