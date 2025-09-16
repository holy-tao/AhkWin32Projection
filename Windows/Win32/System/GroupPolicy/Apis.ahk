#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GroupPolicy {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static GPM_USE_PDC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GPM_USE_ANYDC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPM_DONOTUSE_W2KDC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GPM_DONOT_VALIDATEDC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPM_MIGRATIONTABLE_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPM_PROCESS_SECURITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_NO_COMPUTER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_NO_USER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_PLANNING_ASSUME_SLOW_LINK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_PLANNING_ASSUME_LOOPBACK_MERGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_PLANNING_ASSUME_LOOPBACK_REPLACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_PLANNING_ASSUME_USER_WQLFILTER_TRUE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_PLANNING_ASSUME_COMP_WQLFILTER_TRUE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PI_NOUI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PI_APPLYPOLICY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PT_TEMPORARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PT_ROAMING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PT_MANDATORY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PT_ROAMING_PREEXISTING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RP_FORCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RP_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GPC_BLOCK_POLICY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_FLAG_DISABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_FLAG_FORCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_LIST_FLAG_MACHINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_LIST_FLAG_SITEONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_LIST_FLAG_NO_WMIFILTERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_LIST_FLAG_NO_SECURITYFILTERS => 8

    /**
     * @type {String}
     */
    static GP_DLLNAME => "DllName"

    /**
     * @type {String}
     */
    static GP_ENABLEASYNCHRONOUSPROCESSING => "EnableAsynchronousProcessing"

    /**
     * @type {String}
     */
    static GP_MAXNOGPOLISTCHANGESINTERVAL => "MaxNoGPOListChangesInterval"

    /**
     * @type {String}
     */
    static GP_NOBACKGROUNDPOLICY => "NoBackgroundPolicy"

    /**
     * @type {String}
     */
    static GP_NOGPOLISTCHANGES => "NoGPOListChanges"

    /**
     * @type {String}
     */
    static GP_NOMACHINEPOLICY => "NoMachinePolicy"

    /**
     * @type {String}
     */
    static GP_NOSLOWLINK => "NoSlowLink"

    /**
     * @type {String}
     */
    static GP_NOTIFYLINKTRANSITION => "NotifyLinkTransition"

    /**
     * @type {String}
     */
    static GP_NOUSERPOLICY => "NoUserPolicy"

    /**
     * @type {String}
     */
    static GP_PERUSERLOCALSETTINGS => "PerUserLocalSettings"

    /**
     * @type {String}
     */
    static GP_PROCESSGROUPPOLICY => "ProcessGroupPolicy"

    /**
     * @type {String}
     */
    static GP_REQUIRESSUCCESSFULREGISTRY => "RequiresSuccessfulRegistry"

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_MACHINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_BACKGROUND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_SLOWLINK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_VERBOSE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_NOCHANGES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_LINKTRANSITION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_LOGRSOP_TRANSITION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_FORCED_REFRESH => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_SAFEMODE_BOOT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_INFO_FLAG_ASYNC_FOREGROUND => 4096

    /**
     * @type {String}
     */
    static REGISTRY_EXTENSION_GUID => "{35378eac-683f-11d2-a89a-00c04fbbcfa2}"

    /**
     * @type {String}
     */
    static GROUP_POLICY_TRIGGER_EVENT_PROVIDER_GUID => "{bd2f4252-5e1e-49fc-9a30-f3978ad89ee2}"

    /**
     * @type {String}
     */
    static MACHINE_POLICY_PRESENT_TRIGGER_GUID => "{659fcae6-5bdb-4da9-b1ff-ca2a178d46e0}"

    /**
     * @type {String}
     */
    static USER_POLICY_PRESENT_TRIGGER_GUID => "{54fb46c8-f089-464c-b1fd-59d1b62c3b50}"

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_NO_GPO_FILTER => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_NO_CSE_INVOKE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_ASSUME_SLOW_LINK => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_LOOPBACK_MERGE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_LOOPBACK_REPLACE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_ASSUME_USER_WQLFILTER_TRUE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_ASSUME_COMP_WQLFILTER_TRUE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_PLANNING_MODE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_NO_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_NO_COMPUTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_FORCE_CREATENAMESPACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_USER_ACCESS_DENIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_COMPUTER_ACCESS_DENIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_TEMPNAMESPACE_EXISTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALSTATE_ASSIGNED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALSTATE_PUBLISHED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALSTATE_UNINSTALL_UNMANAGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALSTATE_POLICYREMOVE_ORPHAN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALSTATE_POLICYREMOVE_UNINSTALL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALSTATE_ORPHANED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALSTATE_UNINSTALLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MANAGED_APPS_USERAPPLICATIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MANAGED_APPS_FROMCATEGORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MANAGED_APPS_INFOLEVEL_DEFAULT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MANAGED_APPTYPE_WINDOWSINSTALLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MANAGED_APPTYPE_SETUPEXE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MANAGED_APPTYPE_UNSUPPORTED => 3

    /**
     * @type {String}
     */
    static CLSID_GPESnapIn => "{8fc0b734-a0e1-11d1-a7d3-0000f87571e3}"

    /**
     * @type {String}
     */
    static NODEID_Machine => "{8fc0b737-a0e1-11d1-a7d3-0000f87571e3}"

    /**
     * @type {String}
     */
    static NODEID_MachineSWSettings => "{8fc0b73a-a0e1-11d1-a7d3-0000f87571e3}"

    /**
     * @type {String}
     */
    static NODEID_User => "{8fc0b738-a0e1-11d1-a7d3-0000f87571e3}"

    /**
     * @type {String}
     */
    static NODEID_UserSWSettings => "{8fc0b73c-a0e1-11d1-a7d3-0000f87571e3}"

    /**
     * @type {String}
     */
    static CLSID_GroupPolicyObject => "{ea502722-a23d-11d1-a7d3-0000f87571e3}"

    /**
     * @type {String}
     */
    static ADMXCOMMENTS_EXTENSION_GUID => "{6c5a2a86-9eb3-42b9-aa83-a7371ba011b9}"

    /**
     * @type {String}
     */
    static CLSID_RSOPSnapIn => "{6dc3804b-7212-458d-adb0-9a07e2ae1fa2}"

    /**
     * @type {String}
     */
    static NODEID_RSOPMachine => "{bd4c1a2e-0b7a-4a62-a6b0-c0577539c97e}"

    /**
     * @type {String}
     */
    static NODEID_RSOPMachineSWSettings => "{6a76273e-eb8e-45db-94c5-25663a5f2c1a}"

    /**
     * @type {String}
     */
    static NODEID_RSOPUser => "{ab87364f-0cec-4cd8-9bf8-898f34628fb8}"

    /**
     * @type {String}
     */
    static NODEID_RSOPUserSWSettings => "{e52c5ce3-fd27-4402-84de-d9a5f2858910}"

    /**
     * @type {Integer (UInt32)}
     */
    static RSOP_INFO_FLAG_DIAGNOSTIC_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_BROWSE_DISABLENEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_BROWSE_NOCOMPUTERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_BROWSE_NODSGPOS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_BROWSE_OPENBUTTON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_BROWSE_INITTOALL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_BROWSE_NOUSERGPOS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_BROWSE_SENDAPPLYONEDIT => 64
;@endregion Constants

;@region Methods
    /**
     * The RefreshPolicy function causes policy to be applied immediately on the client computer.
     * @remarks
     * By default, policy is reapplied every 90 minutes.
     * @param {Integer} bMachine Specifies whether to refresh the computer policy or user policy. If this value is <b>TRUE</b>, the system refreshes the computer policy. If this value is <b>FALSE</b>, the system refreshes the user policy.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-refreshpolicy
     * @since windows6.0.6000
     */
    static RefreshPolicy(bMachine) {
        A_LastError := 0

        result := DllCall("USERENV.dll\RefreshPolicy", "int", bMachine, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The RefreshPolicyEx function causes policy to be applied immediately on the computer. The extended function allows you to specify the type of policy refresh to apply.
     * @remarks
     * If you do not need to specify the <i>dwOptions</i> parameter, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-refreshpolicy">RefreshPolicy</a> function instead.
     * 
     * By default, policy is reapplied every 90 minutes.
     * @param {Integer} bMachine Specifies whether to refresh the computer policy or user policy. If this value is <b>TRUE</b>, the system refreshes the computer policy. If this value is <b>FALSE</b>, the system refreshes the user policy.
     * @param {Integer} dwOptions Specifies the type of policy refresh to apply. This parameter can be the following value.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-refreshpolicyex
     * @since windows6.0.6000
     */
    static RefreshPolicyEx(bMachine, dwOptions) {
        A_LastError := 0

        result := DllCall("USERENV.dll\RefreshPolicyEx", "int", bMachine, "uint", dwOptions, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnterCriticalPolicySection function pauses the application of policy to allow applications to safely read policy settings.
     * @remarks
     * The maximum amount of time an application can hold a critical section is 10 minutes. After 10 minutes, the system releases the critical section and policy can be applied again.
     * 
     * To acquire both the computer and user critical section objects, acquire the user critical section object before acquiring the computer critical section object. This will help prevent a deadlock situation.
     * 
     * To close the handle, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-leavecriticalpolicysection">LeaveCriticalPolicySection</a> function. The policy section handle cannot be used in any other Windows functions.
     * @param {Integer} bMachine A value that specifies whether to stop the application of computer policy or user policy. If this value is <b>TRUE</b>, the system stops applying computer policy. If this value is <b>FALSE</b>, the system stops applying user policy.
     * @returns {Pointer<HANDLE>} If the function succeeds, the return value is a handle to a policy section.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-entercriticalpolicysection
     * @since windows6.0.6000
     */
    static EnterCriticalPolicySection(bMachine) {
        A_LastError := 0

        result := DllCall("USERENV.dll\EnterCriticalPolicySection", "int", bMachine, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The LeaveCriticalPolicySection function resumes the background application of policy. This function closes the handle to the policy section.
     * @param {Pointer<HANDLE>} hSection Handle to a policy section, which is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-entercriticalpolicysection">EnterCriticalPolicySection</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-leavecriticalpolicysection
     * @since windows6.0.6000
     */
    static LeaveCriticalPolicySection(hSection) {
        A_LastError := 0

        result := DllCall("USERENV.dll\LeaveCriticalPolicySection", "ptr", hSection, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The RegisterGPNotification function enables an application to receive notification when there is a change in policy. When a policy change occurs, the specified event object is set to the signaled state.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-unregistergpnotification">UnregisterGPNotification</a> function to unregister the handle from receiving policy change notifications. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle when it is no longer required.
     * 
     * An application can also receive notifications about policy changes when a 
     * <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-settingchange">WM_SETTINGCHANGE</a> message is broadcast. In this instance, the <i>wParam</i> parameter value is 1 if computer policy was applied; it is zero if user policy was applied. The <i>lParam</i> parameter points to the string "Policy".
     * @param {Pointer<HANDLE>} hEvent Handle to an event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create the event object.
     * @param {Integer} bMachine Specifies the policy change type. If <b>TRUE</b>, computer policy changes are reported. If <b>FALSE</b>, user policy changes are reported.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-registergpnotification
     * @since windows6.0.6000
     */
    static RegisterGPNotification(hEvent, bMachine) {
        A_LastError := 0

        result := DllCall("USERENV.dll\RegisterGPNotification", "ptr", hEvent, "int", bMachine, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The UnregisterGPNotification function unregisters the specified policy-notification handle from receiving policy change notifications.
     * @remarks
     * The caller must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the handle when it is no longer needed.
     * @param {Pointer<HANDLE>} hEvent Policy-notification handle passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-registergpnotification">RegisterGPNotification</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-unregistergpnotification
     * @since windows6.0.6000
     */
    static UnregisterGPNotification(hEvent) {
        A_LastError := 0

        result := DllCall("USERENV.dll\UnregisterGPNotification", "ptr", hEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetGPOList function retrieves the list of GPOs for the specified user or computer. (ANSI)
     * @remarks
     * The 
     * <b>GetGPOList</b> function is intended for use by services acting on behalf of a user or computer. The service calls this function to obtain a list of GPOs, then checks each GPO for service-specific policy.
     * 
     * Calling this function with a token provides the most accurate list. The system can perform access checking for the user or computer. Calling this function with the user or computer name and the domain controller name is faster than calling it with a token. However, if the token is not specified, the system uses the security access of the caller, which means that the list may not be completely correct for the intended user or computer.
     * 
     * To obtain the most accurate list of GPOs for a computer when calling <b>GetGPOList</b>, the caller must have read access to each OU and site in the computer domain, and also read and apply Group Policy access to all GPOs that are linked to the sites, domain or OUs of that domain. An example of a caller would be a service running on the computer whose name is specified in the <i>lpName</i> parameter. An alternate method of obtaining a list of GPOs would be to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsopplanningmodeprovider-rsopcreatesession">RsopCreateSession</a> method of the <b>RsopPlanningModeProvider</b> WMI class. The method can generate resultant policy data for a computer or user account in a hypothetical scenario.
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-freegpolista">FreeGPOList</a> function to free the GPO list when you have finished processing it.
     * 
     * Generally, you should call 
     * <b>GetGPOList</b> with a token when retrieving a list of GPOs for a user as shown in the following code example.
     * 
     * 
     * ```cpp
     * LPGROUP_POLICY_OBJECT  pGPOList;
     *       if (GetGPOList (hToken, NULL, NULL, NULL, 0, &pGPOList))
     *       {
     * //        Perform processing here. 
     * //
     * //        Free the GPO list when you finish processing.
     *           FreeGPOList (pGPOList);
     *       }
     * ```
     * 
     * 
     * Typically, to retrieve a list of GPOs for a computer, you can call 
     * <b>GetGPOList</b> with the computer name and domain controller name as demonstrated in the following code snippet.
     * 
     * 
     * ```cpp
     * LPGROUP_POLICY_OBJECT  pGPOList;
     *       if (GetGPOList (NULL, lpMachineName, lpHostName, lpMachineName, GPO_LIST_FLAG_MACHINE, &pGPOList))
     *       {
     * //        Perform processing here. 
     * //
     * //        Free the GPO list when you finish processing.
     *           FreeGPOList (pGPOList);
     *       }
     * ```
     * 
     * 
     * To retrieve the list of GPOs applied for a specific user or computer and extension, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getappliedgpolista">GetAppliedGPOList</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The userenv.h header defines GetGPOList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} hToken A token for the user or computer, returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function. This token must have <b>TOKEN_IMPERSONATE</b> and <b>TOKEN_QUERY</b> access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a> and the following Remarks section.
     * 
     * If this parameter is <b>NULL</b>, you must supply values for the <i>lpName</i> and <i>lpHostName</i> parameters.
     * @param {Pointer<PSTR>} lpName A pointer to the user or computer name, in the fully qualified distinguished name format (for example,  "CN=<i>user</i>, OU=<i>users</i>, DC=<i>contoso</i>, DC=<i>com</i>").
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {Pointer<PSTR>} lpHostName A DNS domain name (preferred) or domain controller name. Domain controller name can be retrieved using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function, specifying <b>DS_DIRECTORY_SERVICE_REQUIRED</b> in the <i>flags</i> parameter.
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {Pointer<PSTR>} lpComputerName A pointer to the name of the computer used to determine the site location. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Integer} dwFlags A value that specifies additional flags that are used to control information retrieval. If you specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the computer. If you do not specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the user.
     * 
     * If you specify <b>GPO_LIST_FLAG_SITEONLY</b> the function returns only site information for the computer or user.
     * @param {Pointer<GROUP_POLICY_OBJECTA>} pGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getgpolista
     * @since windows6.0.6000
     */
    static GetGPOListA(hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList) {
        A_LastError := 0

        result := DllCall("USERENV.dll\GetGPOListA", "ptr", hToken, "ptr", lpName, "ptr", lpHostName, "ptr", lpComputerName, "uint", dwFlags, "ptr", pGPOList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetGPOList function retrieves the list of GPOs for the specified user or computer. (Unicode)
     * @remarks
     * The 
     * <b>GetGPOList</b> function is intended for use by services acting on behalf of a user or computer. The service calls this function to obtain a list of GPOs, then checks each GPO for service-specific policy.
     * 
     * Calling this function with a token provides the most accurate list. The system can perform access checking for the user or computer. Calling this function with the user or computer name and the domain controller name is faster than calling it with a token. However, if the token is not specified, the system uses the security access of the caller, which means that the list may not be completely correct for the intended user or computer.
     * 
     * To obtain the most accurate list of GPOs for a computer when calling <b>GetGPOList</b>, the caller must have read access to each OU and site in the computer domain, and also read and apply Group Policy access to all GPOs that are linked to the sites, domain or OUs of that domain. An example of a caller would be a service running on the computer whose name is specified in the <i>lpName</i> parameter. An alternate method of obtaining a list of GPOs would be to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsopplanningmodeprovider-rsopcreatesession">RsopCreateSession</a> method of the <b>RsopPlanningModeProvider</b> WMI class. The method can generate resultant policy data for a computer or user account in a hypothetical scenario.
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-freegpolista">FreeGPOList</a> function to free the GPO list when you have finished processing it.
     * 
     * Generally, you should call 
     * <b>GetGPOList</b> with a token when retrieving a list of GPOs for a user as shown in the following code example.
     * 
     * 
     * ```cpp
     * LPGROUP_POLICY_OBJECT  pGPOList;
     *       if (GetGPOList (hToken, NULL, NULL, NULL, 0, &pGPOList))
     *       {
     * //        Perform processing here. 
     * //
     * //        Free the GPO list when you finish processing.
     *           FreeGPOList (pGPOList);
     *       }
     * ```
     * 
     * 
     * Typically, to retrieve a list of GPOs for a computer, you can call 
     * <b>GetGPOList</b> with the computer name and domain controller name as demonstrated in the following code snippet.
     * 
     * 
     * ```cpp
     * LPGROUP_POLICY_OBJECT  pGPOList;
     *       if (GetGPOList (NULL, lpMachineName, lpHostName, lpMachineName, GPO_LIST_FLAG_MACHINE, &pGPOList))
     *       {
     * //        Perform processing here. 
     * //
     * //        Free the GPO list when you finish processing.
     *           FreeGPOList (pGPOList);
     *       }
     * ```
     * 
     * 
     * To retrieve the list of GPOs applied for a specific user or computer and extension, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getappliedgpolista">GetAppliedGPOList</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The userenv.h header defines GetGPOList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HANDLE>} hToken A token for the user or computer, returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function. This token must have <b>TOKEN_IMPERSONATE</b> and <b>TOKEN_QUERY</b> access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a> and the following Remarks section.
     * 
     * If this parameter is <b>NULL</b>, you must supply values for the <i>lpName</i> and <i>lpHostName</i> parameters.
     * @param {Pointer<PWSTR>} lpName A pointer to the user or computer name, in the fully qualified distinguished name format (for example,  "CN=<i>user</i>, OU=<i>users</i>, DC=<i>contoso</i>, DC=<i>com</i>").
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lpHostName A DNS domain name (preferred) or domain controller name. Domain controller name can be retrieved using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function, specifying <b>DS_DIRECTORY_SERVICE_REQUIRED</b> in the <i>flags</i> parameter.
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} lpComputerName A pointer to the name of the computer used to determine the site location. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Integer} dwFlags A value that specifies additional flags that are used to control information retrieval. If you specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the computer. If you do not specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the user.
     * 
     * If you specify <b>GPO_LIST_FLAG_SITEONLY</b> the function returns only site information for the computer or user.
     * @param {Pointer<GROUP_POLICY_OBJECTW>} pGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getgpolistw
     * @since windows6.0.6000
     */
    static GetGPOListW(hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList) {
        A_LastError := 0

        result := DllCall("USERENV.dll\GetGPOListW", "ptr", hToken, "ptr", lpName, "ptr", lpHostName, "ptr", lpComputerName, "uint", dwFlags, "ptr", pGPOList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FreeGPOList function frees the specified list of GPOs. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The userenv.h header defines FreeGPOList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<GROUP_POLICY_OBJECTA>} pGPOList A pointer to the list of GPO structures. This list is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getgpolista">GetGPOList</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getappliedgpolista">GetAppliedGPOList</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-freegpolista
     * @since windows6.0.6000
     */
    static FreeGPOListA(pGPOList) {
        A_LastError := 0

        result := DllCall("USERENV.dll\FreeGPOListA", "ptr", pGPOList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FreeGPOList function frees the specified list of GPOs. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The userenv.h header defines FreeGPOList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<GROUP_POLICY_OBJECTW>} pGPOList A pointer to the list of GPO structures. This list is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getgpolista">GetGPOList</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getappliedgpolista">GetAppliedGPOList</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-freegpolistw
     * @since windows6.0.6000
     */
    static FreeGPOListW(pGPOList) {
        A_LastError := 0

        result := DllCall("USERENV.dll\FreeGPOListW", "ptr", pGPOList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetAppliedGPOList function retrieves the list of GPOs applied for the specified user or computer. (ANSI)
     * @remarks
     * To free the GPO list when you have finished processing it, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-freegpolista">FreeGPOList</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The userenv.h header defines GetAppliedGPOList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} dwFlags A value that specifies the policy type. This parameter can be the following value.
     * @param {Pointer<PSTR>} pMachineName A pointer to the name of the remote computer. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Pointer<PSID>} pSidUser A value that specifies the SID of the user. If <i>pMachineName</i> is not <b>NULL</b> and <i>dwFlags</i> specifies user policy, then <i>pSidUser</i> cannot be <b>NULL</b>.
     * 
     * If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is <b>NULL</b>, the user is the currently logged-on user. If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is not <b>NULL</b>, the user is represented by <i>pSidUser</i> on the local computer. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
     * @param {Pointer<Guid>} pGuidExtension A value that specifies the <b>GUID</b> of the extension.
     * @param {Pointer<GROUP_POLICY_OBJECTA>} ppGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns a system error code. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getappliedgpolista
     * @since windows6.0.6000
     */
    static GetAppliedGPOListA(dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList) {
        result := DllCall("USERENV.dll\GetAppliedGPOListA", "uint", dwFlags, "ptr", pMachineName, "ptr", pSidUser, "ptr", pGuidExtension, "ptr", ppGPOList, "uint")
        return result
    }

    /**
     * The GetAppliedGPOList function retrieves the list of GPOs applied for the specified user or computer. (Unicode)
     * @remarks
     * To free the GPO list when you have finished processing it, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-freegpolista">FreeGPOList</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The userenv.h header defines GetAppliedGPOList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} dwFlags A value that specifies the policy type. This parameter can be the following value.
     * @param {Pointer<PWSTR>} pMachineName A pointer to the name of the remote computer. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Pointer<PSID>} pSidUser A value that specifies the SID of the user. If <i>pMachineName</i> is not <b>NULL</b> and <i>dwFlags</i> specifies user policy, then <i>pSidUser</i> cannot be <b>NULL</b>.
     * 
     * If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is <b>NULL</b>, the user is the currently logged-on user. If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is not <b>NULL</b>, the user is represented by <i>pSidUser</i> on the local computer. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
     * @param {Pointer<Guid>} pGuidExtension A value that specifies the <b>GUID</b> of the extension.
     * @param {Pointer<GROUP_POLICY_OBJECTW>} ppGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns a system error code. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getappliedgpolistw
     * @since windows6.0.6000
     */
    static GetAppliedGPOListW(dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList) {
        result := DllCall("USERENV.dll\GetAppliedGPOListW", "uint", dwFlags, "ptr", pMachineName, "ptr", pSidUser, "ptr", pGuidExtension, "ptr", ppGPOList, "uint")
        return result
    }

    /**
     * The ProcessGroupPolicyCompleted function notifies the system that the specified extension has finished applying policy.
     * @param {Pointer<Guid>} extensionId Specifies the unique <b>GUID</b> that identifies the extension.
     * @param {Pointer} pAsyncHandle Asynchronous completion handle. This handle is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnprocessgrouppolicy">ProcessGroupPolicy</a> function.
     * @param {Integer} dwStatus Specifies the completion status of asynchronous processing.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-processgrouppolicycompleted
     * @since windows6.0.6000
     */
    static ProcessGroupPolicyCompleted(extensionId, pAsyncHandle, dwStatus) {
        result := DllCall("USERENV.dll\ProcessGroupPolicyCompleted", "ptr", extensionId, "ptr", pAsyncHandle, "uint", dwStatus, "uint")
        return result
    }

    /**
     * The ProcessGroupPolicyCompletedEx function notifies the system that the specified policy extension has finished applying policy. The function also reports the status of Resultant Set of Policy (RSoP) logging.
     * @param {Pointer<Guid>} extensionId Specifies the unique <b>GUID</b> that identifies the policy extension.
     * @param {Pointer} pAsyncHandle Asynchronous completion handle. This handle is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnprocessgrouppolicyex">ProcessGroupPolicyEx</a> callback function.
     * @param {Integer} dwStatus Specifies the completion status of asynchronous processing of policy.
     * @param {Integer} RsopStatus Specifies an <b>HRESULT</b> return code that indicates the status of RSoP logging.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-processgrouppolicycompletedex
     * @since windows6.0.6000
     */
    static ProcessGroupPolicyCompletedEx(extensionId, pAsyncHandle, dwStatus, RsopStatus) {
        result := DllCall("USERENV.dll\ProcessGroupPolicyCompletedEx", "ptr", extensionId, "ptr", pAsyncHandle, "uint", dwStatus, "int", RsopStatus, "uint")
        return result
    }

    /**
     * The RSoPAccessCheckByType function determines whether a security descriptor grants a specified set of access rights to the client identified by an RSOPTOKEN.
     * @remarks
     * The 
     * <b>RSoPAccessCheckByType</b> function compares the specified security descriptor with the specified <b>RSOPTOKEN</b> and indicates, in the <i>pbAccessStatus</i> parameter, whether access is granted or denied.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} pSecurityDescriptor Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> against which access on the object is checked.
     * @param {Pointer<PSID>} pPrincipalSelfSid Pointer to a SID. If the security descriptor is associated with an object that represents a principal (for example, a user object), this parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known <b>PRINCIPAL_SELF</b> SID ("S-1-5-10"). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-Known SIDs</a>.
     * 
     * This parameter should be <b>NULL</b> if the protected object does not represent a principal.
     * @param {Pointer<Void>} pRsopToken Pointer to a valid <b>RSOPTOKEN</b> representing the client attempting to gain access to the object.
     * @param {Integer} dwDesiredAccessMask Specifies an access mask that indicates the access rights to check. This mask can contain a combination of 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">generic</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">standard</a> and specific access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-and-access-masks">Access Rights and Access Masks</a>.
     * @param {Pointer<OBJECT_TYPE_LIST>} pObjectTypeList Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a <b>GUID</b> that identifies the object type and a value indicating the level of the object type in the hierarchy of object types. The array should not have two elements with the same <b>GUID</b>.
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, 
     * <b>RSoPAccessCheckByType</b> fails and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Integer} ObjectTypeListLength Specifies the number of elements in the <i>pObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} pGenericMapping Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {Pointer<PRIVILEGE_SET>} pPrivilegeSet This parameter is currently unused.
     * @param {Pointer<UInt32>} pdwPrivilegeSetLength This parameter is currently unused.
     * @param {Pointer<UInt32>} pdwGrantedAccessMask Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-and-access-masks">access mask</a> that receives the granted access rights.
     * 
     * If the function succeeds, the <i>pbAccessStatus</i> parameter is set to <b>TRUE</b>, and the mask is updated to contain the standard and specific rights granted. If <i>pbAccessStatus</i> is set to <b>FALSE</b>, this parameter is set to zero. If the function fails, the mask is not modified.
     * @param {Pointer<Int32>} pbAccessStatus Pointer to a variable that receives the results of the access check.
     * 
     * If the function succeeds, and the requested set of access rights are granted, this parameter is set to <b>TRUE</b>. Otherwise, this parameter is set to <b>FALSE</b>. If the function fails, the status is not modified.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopaccesscheckbytype
     * @since windows6.0.6000
     */
    static RsopAccessCheckByType(pSecurityDescriptor, pPrincipalSelfSid, pRsopToken, dwDesiredAccessMask, pObjectTypeList, ObjectTypeListLength, pGenericMapping, pPrivilegeSet, pdwPrivilegeSetLength, pdwGrantedAccessMask, pbAccessStatus) {
        A_LastError := 0

        result := DllCall("USERENV.dll\RsopAccessCheckByType", "ptr", pSecurityDescriptor, "ptr", pPrincipalSelfSid, "ptr", pRsopToken, "uint", dwDesiredAccessMask, "ptr", pObjectTypeList, "uint", ObjectTypeListLength, "ptr", pGenericMapping, "ptr", pPrivilegeSet, "ptr", pdwPrivilegeSetLength, "ptr", pdwGrantedAccessMask, "ptr", pbAccessStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The RSoPFileAccessCheck function determines whether a file's security descriptor grants a specified set of file access rights to the client identified by an RSOPTOKEN.
     * @remarks
     * The 
     * <b>RSoPFileAccessCheck</b> function indicates, in the <i>pbAccessStatus</i> parameter, whether access is granted or denied to the client identified by the <b>RSOPTOKEN</b>. If access is granted, the requested access mask becomes the object's granted access mask.
     * @param {Pointer<PWSTR>} pszFileName Pointer to the name of the relevant file. The file must already exist.
     * @param {Pointer<Void>} pRsopToken Pointer to a valid <b>RSOPTOKEN</b> representing the client attempting to gain access to the file.
     * @param {Integer} dwDesiredAccessMask Specifies an access mask that indicates the access rights to check. This mask can contain a combination of 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">generic</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">standard</a>, and specific access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-and-access-masks">Access Rights and Access Masks</a>.
     * @param {Pointer<UInt32>} pdwGrantedAccessMask Pointer to an access mask that receives the granted access rights.
     * 
     * If the function succeeds, the <i>pbAccessStatus</i> parameter is set to <b>TRUE</b>, and the mask is updated to contain the standard and specific rights granted. If <i>pbAccessStatus</i> is set to <b>FALSE</b>, this parameter is set to zero. If the function fails, the mask is not modified.
     * @param {Pointer<Int32>} pbAccessStatus Pointer to a variable that receives the results of the access check.
     * 
     * If the function succeeds, and the requested set of access rights are granted, this parameter is set to <b>TRUE</b>. Otherwise, this parameter is set to <b>FALSE</b>. If the function fails, the status is not modified.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopfileaccesscheck
     * @since windows6.0.6000
     */
    static RsopFileAccessCheck(pszFileName, pRsopToken, dwDesiredAccessMask, pdwGrantedAccessMask, pbAccessStatus) {
        result := DllCall("USERENV.dll\RsopFileAccessCheck", "ptr", pszFileName, "ptr", pRsopToken, "uint", dwDesiredAccessMask, "ptr", pdwGrantedAccessMask, "ptr", pbAccessStatus, "int")
        return result
    }

    /**
     * The RSoPSetPolicySettingStatus function creates an instance of RSOP_PolicySettingStatus and an instance of RSOP_PolicySettingLink. The function links (associates) RSOP_PolicySettingStatus to its RSOP_PolicySetting instance.
     * @remarks
     * To unlink an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsop-policysettingstatus">RSOP_PolicySettingStatus</a> instance from its 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsop-policysetting">RSOP_PolicySetting</a> instance, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-rsopresetpolicysettingstatus">RSoPResetPolicySettingStatus</a> function.
     * @param {Integer} dwFlags This parameter is currently unused.
     * @param {Pointer<IWbemServices>} pServices Specifies a WMI services pointer to the RSoP namespace to which the policy data is to be written. This parameter is required.
     * @param {Pointer<IWbemClassObject>} pSettingInstance Pointer to an instance of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsop-policysetting">RSOP_PolicySetting</a> containing the policy setting. This parameter is required and can point to the instance's children.
     * @param {Integer} nInfo Specifies the number of elements in the <i>pStatus</i> array.
     * @param {Pointer<POLICYSETTINGSTATUSINFO>} pStatus Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-policysettingstatusinfo">POLICYSETTINGSTATUSINFO</a> structures.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopsetpolicysettingstatus
     * @since windows6.0.6000
     */
    static RsopSetPolicySettingStatus(dwFlags, pServices, pSettingInstance, nInfo, pStatus) {
        result := DllCall("USERENV.dll\RsopSetPolicySettingStatus", "uint", dwFlags, "ptr", pServices, "ptr", pSettingInstance, "uint", nInfo, "ptr", pStatus, "int")
        return result
    }

    /**
     * The RSoPResetPolicySettingStatus function unlinks the RSOP_PolicySettingStatus instance from its RSOP_PolicySetting instance.
     * @remarks
     * To link (associate) the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsop-policysettingstatus">RSOP_PolicySettingStatus</a> instance to its 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsop-policysetting">RSOP_PolicySetting</a> instance, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-rsopsetpolicysettingstatus">RSoPSetPolicySettingStatus</a> function.
     * @param {Integer} dwFlags This parameter is currently unused.
     * @param {Pointer<IWbemServices>} pServices Specifies a WMI services pointer to the RSoP namespace to which the policy data is to be written. This parameter is required.
     * @param {Pointer<IWbemClassObject>} pSettingInstance Pointer to an instance of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/rsop-policysetting">RSOP_PolicySetting</a> containing the policy setting. This parameter is required and can also point to the instance's children.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopresetpolicysettingstatus
     * @since windows6.0.6000
     */
    static RsopResetPolicySettingStatus(dwFlags, pServices, pSettingInstance) {
        result := DllCall("USERENV.dll\RsopResetPolicySettingStatus", "uint", dwFlags, "ptr", pServices, "ptr", pSettingInstance, "int")
        return result
    }

    /**
     * 
     * @param {Integer} bMachine 
     * @param {Pointer<PWSTR>} lpwszMgmtProduct 
     * @param {Integer} dwMgmtProductOptions 
     * @returns {Integer} 
     */
    static GenerateGPNotification(bMachine, lpwszMgmtProduct, dwMgmtProductOptions) {
        result := DllCall("USERENV.dll\GenerateGPNotification", "int", bMachine, "ptr", lpwszMgmtProduct, "uint", dwMgmtProductOptions, "uint")
        return result
    }

    /**
     * The InstallApplication function can install applications that have been deployed to target users that belong to a domain.
     * @remarks
     * The <b>InstallApplication</b> function can only install applications that have been deployed by using  Group Policy. A domain administrator can deploy applications to  target users by using  the  user configuration section of Group Policy Objects (GPO). The target user must belong to the target domain and the GPO must apply to this  user in the target  domain. The <b>InstallApplication</b> function installs applications according to standard Group Policy inheritance rules.  If the same application is deployed in multiple GPOs, the function installs the version of the application deployed in the highest precedence GPO.  After an application has been  installed for a user, it is not visible to other users on the computer. This is standard for applications that are deployed through user group policy.
     * 
     * The <b>InstallApplication</b> function can  install deployed applications that  use <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> (.msi files) or software installation settings (.zap files) to handle setup and installation.
     * 
     * The
     *     <b>InstallApplication</b> function can install applications that use a <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> package for their installation.  In this case,  the  user calling <b>InstallApplication</b> is not required to have administrator privileges. The system can install the application because the  Windows Installer  is a trusted application deployed by a domain administrator. The user that receives the application must have access to the location of the .msi files.
     * 
     * Remove applications installed using .msi files by calling the <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> function <a href="https://docs.microsoft.com/windows/desktop/api/msi/nf-msi-msiconfigureproducta">MsiConfigureProduct</a> to uninstall the application. Then call <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/nf-appmgmt-uninstallapplication">UninstallApplication</a>  to  inform the system that the application is no longer managed on the client by Group Policy.  <b>UninstallApplication</b> should be called even if the uninstall fails because this enables the system to keep the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/reporting-group-policy">Resultant Set of Policy (RSoP)</a> accurate.
     * 
     * The
     *     <b>InstallApplication</b> function can also install applications that use setup applications based on software installation settings (.zap files). The user that receives the application must have access to the location of the .zap files. A .zap file is a text file similar to an .ini file, which enables Windows to publish an application (for example, Setup.exe) for installation with <b>Add or Remove Programs</b>. To publish applications that do not use the <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a>, you must create a .zap file, copy the .zap file to the software distribution point servers, and then use Group Policy–based software deployment to publish the application for users. 
     * If the application is deployed using .zap files, the user installing the application must have privileges on the machine to install the software. You cannot use .zap files for assigned applications.
     * 
     * Remove applications using software installation settings (.zap files) by calling the uninstall function or a command  specific for the installation application.
     * 
     * For information about using installation applications other than  the <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> see article 231747, "How to Publish non-MSI Programs with .zap Files," in the Microsoft Knowledge Base.
     * @param {Pointer<INSTALLDATA>} pInstallInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-installdata">INSTALLDATA</a> structure that specifies the application to install.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/appmgmt/nf-appmgmt-installapplication
     * @since windows6.0.6000
     */
    static InstallApplication(pInstallInfo) {
        result := DllCall("ADVAPI32.dll\InstallApplication", "ptr", pInstallInfo, "uint")
        return result
    }

    /**
     * The UninstallApplication function uninstalls a group policy application that handles setup and installation using Windows Installer .msi files.
     * @remarks
     * Remove a group policy application that uses .msi files by calling  the <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> function <a href="https://docs.microsoft.com/windows/desktop/api/msi/nf-msi-msiconfigureproducta">MsiConfigureProduct</a> to uninstall the application. Then call <b>UninstallApplication</b>  to  inform the system that the application is no longer managed on the client by Group Policy.  <b>UninstallApplication</b> should be called even if the uninstall fails because this enables the system to keep the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/reporting-group-policy">Resultant Set of Policy (RSoP)</a> accurate.
     * 
     * Remove applications installed using software installation settings (.zap files) by calling  the uninstall function or command  specific for the installation application. For information about using installation applications other than  the <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> see article 231747, "How to Publish non-MSI Programs with .zap Files," in the Microsoft Knowledge Base.
     * @param {Pointer<PWSTR>} ProductCode The <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> product code of the product being uninstalled. The <a href="https://docs.microsoft.com/windows/desktop/Msi/product-codes">product code</a> of the application should be provided in the form of  a <a href="https://docs.microsoft.com/windows/desktop/Msi/guid">Windows Installer GUID</a> as a string with braces.
     * @param {Integer} dwStatus The status of the uninstall attempt. The <i>dwStatus</i> parameter is the Windows success code of the uninstall attempt returned by <a href="https://docs.microsoft.com/windows/desktop/api/msi/nf-msi-msiconfigureproducta">MsiConfigureProduct</a>.  The system can use this to ensure that the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/reporting-group-policy">Resultant Set of Policy (RSoP)</a> indicates whether the uninstall failed or succeeded.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/appmgmt/nf-appmgmt-uninstallapplication
     * @since windows6.0.6000
     */
    static UninstallApplication(ProductCode, dwStatus) {
        result := DllCall("ADVAPI32.dll\UninstallApplication", "ptr", ProductCode, "uint", dwStatus, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} Descriptor 
     * @param {Pointer<PWSTR>} CommandLine 
     * @param {Pointer<UInt32>} CommandLineLength 
     * @returns {Integer} 
     */
    static CommandLineFromMsiDescriptor(Descriptor, CommandLine, CommandLineLength) {
        result := DllCall("ADVAPI32.dll\CommandLineFromMsiDescriptor", "ptr", Descriptor, "ptr", CommandLine, "ptr", CommandLineLength, "uint")
        return result
    }

    /**
     * The GetManagedApplications function gets a list of applications that are displayed in the Add pane of Add/Remove Programs (ARP) for a specified user context.
     * @param {Pointer<Guid>} pCategory A pointer to a GUID that specifies the  category  
     * 
     * of applications to be listed. If <i>pCategory</i> is not null, <i>dwQueryFlags</i> must   contain <b>MANAGED_APPS_FROMCATEGORY</b>. If <i>pCategory</i> is null, <i>dwQueryFlags</i> cannot contain <b>MANAGED_APPS_FROMCATEGORY</b>.
     * @param {Integer} dwQueryFlags 
     * @param {Integer} dwInfoLevel This parameter must be <b>MANAGED_APPS_INFOLEVEL_DEFAULT</b>.
     * @param {Pointer<UInt32>} pdwApps The count of applications in the list returned by this function.
     * @param {Pointer<MANAGEDAPPLICATION>} prgManagedApps This parameter is a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-managedapplication">MANAGEDAPPLICATION</a> structures. This array contains the list of applications listed in the <b>Add</b> pane of  <b>Add/Remove Programs</b> (ARP). You must call <b>LocalFree</b> to free the array when they array is no longer required.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/appmgmt/nf-appmgmt-getmanagedapplications
     * @since windows6.0.6000
     */
    static GetManagedApplications(pCategory, dwQueryFlags, dwInfoLevel, pdwApps, prgManagedApps) {
        result := DllCall("ADVAPI32.dll\GetManagedApplications", "ptr", pCategory, "uint", dwQueryFlags, "uint", dwInfoLevel, "ptr", pdwApps, "ptr", prgManagedApps, "uint")
        return result
    }

    /**
     * The GetLocalManagedApplications function can be run on the target computer to get a list of managed applications on that computer.
     * @param {Integer} bUserApps A value that, if <b>TRUE</b>, the <i>prgLocalApps</i> parameter contains a list of managed applications that applies to the user.  If the value of this parameter is <b>FALSE</b>, the <i>prgLocalApps</i> parameter contains a list of managed applications that applies to the local computer.
     * @param {Pointer<UInt32>} pdwApps The address of a <b>DWORD</b> that specifies the number of applications in the list returned by <i>prgLocalApps</i>.
     * @param {Pointer<LOCALMANAGEDAPPLICATION>} prgLocalApps The address of an array that contains the list of managed applications. You must call <b>LocalFree</b> to free this array when its contents are no longer required. This parameter cannot be null. The list is returned as a <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-localmanagedapplication">LOCALMANAGEDAPPLICATION</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/appmgmt/nf-appmgmt-getlocalmanagedapplications
     * @since windows6.0.6000
     */
    static GetLocalManagedApplications(bUserApps, pdwApps, prgLocalApps) {
        result := DllCall("ADVAPI32.dll\GetLocalManagedApplications", "int", bUserApps, "ptr", pdwApps, "ptr", prgLocalApps, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ProductCode 
     * @param {Pointer<PWSTR>} DisplayName 
     * @param {Pointer<PWSTR>} SupportUrl 
     * @returns {String} Nothing - always returns an empty string
     */
    static GetLocalManagedApplicationData(ProductCode, DisplayName, SupportUrl) {
        DllCall("ADVAPI32.dll\GetLocalManagedApplicationData", "ptr", ProductCode, "ptr", DisplayName, "ptr", SupportUrl)
    }

    /**
     * The GetManagedApplicationCategories function gets a list of application categories for a domain. The list is the same for all users in the domain.
     * @remarks
     * The structure returned by <b>GetManagedApplicationCategories</b> must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> when the list is no longer required.
     * @param {Pointer<APPCATEGORYINFOLIST>} pAppCategory A <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfolist">APPCATEGORYINFOLIST</a> structure that contains a list of application categories. This structure must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>  when the list is no longer required.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/appmgmt/nf-appmgmt-getmanagedapplicationcategories
     * @since windows6.0.6000
     */
    static GetManagedApplicationCategories(pAppCategory) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ADVAPI32.dll\GetManagedApplicationCategories", "uint", dwReserved, "ptr", pAppCategory, "uint")
        return result
    }

    /**
     * The CreateGPOLink function creates a link between the specified GPO and the specified site, domain, or organizational unit.
     * @param {Pointer<PWSTR>} lpGPO A value that specifies the path to the GPO, in ADSI format 
     *       ("LDAP://cn=<i>user</i>, ou=<i>users</i>, dc=<i>coname</i>, dc=<i>com</i>"). 
     *       You cannot specify a server name in this parameter.
     * @param {Pointer<PWSTR>} lpContainer A value that specifies the Active Directory path to the site, domain, or organizational unit.
     * @param {Integer} fHighPriority A value that specifies the link priority. If this parameter is <b>TRUE</b>, the system 
     *       creates the link as the highest priority. If this parameter is <b>FALSE</b>, the system 
     *       creates the link as the lowest priority.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns 
     *        one of the COM error codes defined in the header file WinError.h. Be aware that you should test explicitly for 
     *        the return value <b>S_OK</b>. Do not use the <b>SUCCEEDED</b> or 
     *        <b>FAILED</b> macro on the returned <b>HRESULT</b> to determine success or failure of the 
     *        function.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-creategpolink
     * @since windows6.0.6000
     */
    static CreateGPOLink(lpGPO, lpContainer, fHighPriority) {
        result := DllCall("GPEDIT.dll\CreateGPOLink", "ptr", lpGPO, "ptr", lpContainer, "int", fHighPriority, "int")
        return result
    }

    /**
     * The DeleteGPOLink function deletes the link between the specified GPO and the specified site, domain, or organizational unit.
     * @param {Pointer<PWSTR>} lpGPO A value that specifies the path to the GPO, in ADSI format (LDAP://cn=<i>user</i>, ou=<i>users</i>, dc=<i>coname</i>, dc=<i>com</i>). You cannot specify a server name in this parameter.
     * @param {Pointer<PWSTR>} lpContainer Specifies the Active Directory path to the site, domain, or organizational unit.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the  header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-deletegpolink
     * @since windows6.0.6000
     */
    static DeleteGPOLink(lpGPO, lpContainer) {
        result := DllCall("GPEDIT.dll\DeleteGPOLink", "ptr", lpGPO, "ptr", lpContainer, "int")
        return result
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @param {Pointer<PWSTR>} lpContainer A value that specifies the path to the site, domain, or organizational unit, in ADSI format (LDAP://cn=<i>user</i>, ou=<i>users</i>, dc=<i>coname</i>, dc=<i>com</i>). You cannot specify a server name in this parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-deleteallgpolinks
     * @since windows6.0.6000
     */
    static DeleteAllGPOLinks(lpContainer) {
        result := DllCall("GPEDIT.dll\DeleteAllGPOLinks", "ptr", lpContainer, "int")
        return result
    }

    /**
     * The BrowseForGPO function creates a GPO browser dialog box that allows the user to open or create a GPO.
     * @param {Pointer<GPOBROWSEINFO>} lpBrowseInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/gpedit/ns-gpedit-gpobrowseinfo">GPOBROWSEINFO</a> structure that contains information used to initialize the dialog box. When 
     * the <b>BrowseForGPO</b> function returns, this structure contains information about the user's actions.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. If the user cancels or closes the dialog box, the return value is <b>HRESULT_FROM_WIN32</b>(<b>ERROR_CANCELLED</b>). Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-browseforgpo
     * @since windows6.0.6000
     */
    static BrowseForGPO(lpBrowseInfo) {
        result := DllCall("GPEDIT.dll\BrowseForGPO", "ptr", lpBrowseInfo, "int")
        return result
    }

    /**
     * The ImportRSoPData function imports a data file containing RSoP data to a WMI namespace. The file must be one generated by a call to the ExportRSoPData function.
     * @param {Pointer<PWSTR>} lpNameSpace Pointer to a string specifying the namespace to contain the RSoP data. The namespace must exist prior to calling 
     * <b>ImportRSoPData</b>.
     * @param {Pointer<PWSTR>} lpFileName Pointer to a string specifying the name of the file that contains the RSoP data.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-importrsopdata
     * @since windows6.0.6000
     */
    static ImportRSoPData(lpNameSpace, lpFileName) {
        result := DllCall("GPEDIT.dll\ImportRSoPData", "ptr", lpNameSpace, "ptr", lpFileName, "int")
        return result
    }

    /**
     * The ExportRSoPData function exports a WMI namespace that contains RSoP information to a data file. The function writes the information to a data file that can be imported to a WMI namespace with a call to the ImportRSoPData function.
     * @remarks
     * It is recommended that you call the 
     * <b>ExportRSoPData</b> function twice: one time to process the user data and a second time to process the computer data.
     * @param {Pointer<PWSTR>} lpNameSpace A pointer to a string that specifies the namespace which contains the RSoP data.
     * @param {Pointer<PWSTR>} lpFileName A pointer to a string that specifies the name of the file to receive the RSoP data.
     * @returns {Integer} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/gpedit/nf-gpedit-exportrsopdata
     * @since windows6.0.6000
     */
    static ExportRSoPData(lpNameSpace, lpFileName) {
        result := DllCall("GPEDIT.dll\ExportRSoPData", "ptr", lpNameSpace, "ptr", lpFileName, "int")
        return result
    }

;@endregion Methods
}
