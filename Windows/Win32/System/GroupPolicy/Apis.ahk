#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
     * @param {BOOL} bMachine Specifies whether to refresh the computer policy or user policy. If this value is <b>TRUE</b>, the system refreshes the computer policy. If this value is <b>FALSE</b>, the system refreshes the user policy.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-refreshpolicy
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
     * @param {BOOL} bMachine Specifies whether to refresh the computer policy or user policy. If this value is <b>TRUE</b>, the system refreshes the computer policy. If this value is <b>FALSE</b>, the system refreshes the user policy.
     * @param {Integer} dwOptions Specifies the type of policy refresh to apply. This parameter can be the following value.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-refreshpolicyex
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
     * @param {BOOL} bMachine A value that specifies whether to stop the application of computer policy or user policy. If this value is <b>TRUE</b>, the system stops applying computer policy. If this value is <b>FALSE</b>, the system stops applying user policy.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to a policy section.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-entercriticalpolicysection
     * @since windows6.0.6000
     */
    static EnterCriticalPolicySection(bMachine) {
        A_LastError := 0

        result := DllCall("USERENV.dll\EnterCriticalPolicySection", "int", bMachine, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * The LeaveCriticalPolicySection function resumes the background application of policy. This function closes the handle to the policy section.
     * @param {HANDLE} hSection Handle to a policy section, which is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-entercriticalpolicysection">EnterCriticalPolicySection</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-leavecriticalpolicysection
     * @since windows6.0.6000
     */
    static LeaveCriticalPolicySection(hSection) {
        hSection := hSection is Win32Handle ? NumGet(hSection, "ptr") : hSection

        A_LastError := 0

        result := DllCall("USERENV.dll\LeaveCriticalPolicySection", "ptr", hSection, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The RegisterGPNotification function enables an application to receive notification when there is a change in policy. When a policy change occurs, the specified event object is set to the signaled state.
     * @param {HANDLE} hEvent Handle to an event object. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function to create the event object.
     * @param {BOOL} bMachine Specifies the policy change type. If <b>TRUE</b>, computer policy changes are reported. If <b>FALSE</b>, user policy changes are reported.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-registergpnotification
     * @since windows6.0.6000
     */
    static RegisterGPNotification(hEvent, bMachine) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        A_LastError := 0

        result := DllCall("USERENV.dll\RegisterGPNotification", "ptr", hEvent, "int", bMachine, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The UnregisterGPNotification function unregisters the specified policy-notification handle from receiving policy change notifications.
     * @param {HANDLE} hEvent Policy-notification handle passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-registergpnotification">RegisterGPNotification</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-unregistergpnotification
     * @since windows6.0.6000
     */
    static UnregisterGPNotification(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        A_LastError := 0

        result := DllCall("USERENV.dll\UnregisterGPNotification", "ptr", hEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetGPOList function retrieves the list of GPOs for the specified user or computer.
     * @param {HANDLE} hToken A token for the user or computer, returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function. This token must have <b>TOKEN_IMPERSONATE</b> and <b>TOKEN_QUERY</b> access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a> and the following Remarks section.
     * 
     * If this parameter is <b>NULL</b>, you must supply values for the <i>lpName</i> and <i>lpHostName</i> parameters.
     * @param {PSTR} lpName A pointer to the user or computer name, in the fully qualified distinguished name format (for example,  "CN=<i>user</i>, OU=<i>users</i>, DC=<i>contoso</i>, DC=<i>com</i>").
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {PSTR} lpHostName A DNS domain name or domain controller name. Domain controller name can be retrieved using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function, specifying <b>DS_DIRECTORY_SERVICE_REQUIRED</b> in the <i>flags</i> parameter.
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {PSTR} lpComputerName A pointer to the name of the computer used to determine the site location. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Integer} dwFlags A value that specifies additional flags that are used to control information retrieval. If you specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the computer. If you do not specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the user.
     * 
     * If you specify <b>GPO_LIST_FLAG_SITEONLY</b> the function returns only site information for the computer or user.
     * @param {Pointer<Pointer<GROUP_POLICY_OBJECTA>>} pGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-getgpolista
     * @since windows6.0.6000
     */
    static GetGPOListA(hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpHostName := lpHostName is String ? StrPtr(lpHostName) : lpHostName
        lpComputerName := lpComputerName is String ? StrPtr(lpComputerName) : lpComputerName

        pGPOListMarshal := pGPOList is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("USERENV.dll\GetGPOListA", "ptr", hToken, "ptr", lpName, "ptr", lpHostName, "ptr", lpComputerName, "uint", dwFlags, pGPOListMarshal, pGPOList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetGPOList function retrieves the list of GPOs for the specified user or computer.
     * @param {HANDLE} hToken A token for the user or computer, returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> function. This token must have <b>TOKEN_IMPERSONATE</b> and <b>TOKEN_QUERY</b> access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a> and the following Remarks section.
     * 
     * If this parameter is <b>NULL</b>, you must supply values for the <i>lpName</i> and <i>lpHostName</i> parameters.
     * @param {PWSTR} lpName A pointer to the user or computer name, in the fully qualified distinguished name format (for example,  "CN=<i>user</i>, OU=<i>users</i>, DC=<i>contoso</i>, DC=<i>com</i>").
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {PWSTR} lpHostName A DNS domain name or domain controller name. Domain controller name can be retrieved using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function, specifying <b>DS_DIRECTORY_SERVICE_REQUIRED</b> in the <i>flags</i> parameter.
     * 
     * If the <i>hToken</i> parameter is not <b>NULL</b>, this parameter must be <b>NULL</b>.
     * @param {PWSTR} lpComputerName A pointer to the name of the computer used to determine the site location. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Integer} dwFlags A value that specifies additional flags that are used to control information retrieval. If you specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the computer. If you do not specify <b>GPO_LIST_FLAG_MACHINE</b>, the function retrieves policy information for the user.
     * 
     * If you specify <b>GPO_LIST_FLAG_SITEONLY</b> the function returns only site information for the computer or user.
     * @param {Pointer<Pointer<GROUP_POLICY_OBJECTW>>} pGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-getgpolistw
     * @since windows6.0.6000
     */
    static GetGPOListW(hToken, lpName, lpHostName, lpComputerName, dwFlags, pGPOList) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpHostName := lpHostName is String ? StrPtr(lpHostName) : lpHostName
        lpComputerName := lpComputerName is String ? StrPtr(lpComputerName) : lpComputerName

        pGPOListMarshal := pGPOList is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("USERENV.dll\GetGPOListW", "ptr", hToken, "ptr", lpName, "ptr", lpHostName, "ptr", lpComputerName, "uint", dwFlags, pGPOListMarshal, pGPOList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FreeGPOList function frees the specified list of GPOs.
     * @param {Pointer<GROUP_POLICY_OBJECTA>} pGPOList A pointer to the list of GPO structures. This list is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getgpolista">GetGPOList</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getappliedgpolista">GetAppliedGPOList</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-freegpolista
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
     * The FreeGPOList function frees the specified list of GPOs.
     * @param {Pointer<GROUP_POLICY_OBJECTW>} pGPOList A pointer to the list of GPO structures. This list is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getgpolista">GetGPOList</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-getappliedgpolista">GetAppliedGPOList</a> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-freegpolistw
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
     * The GetAppliedGPOList function retrieves the list of GPOs applied for the specified user or computer.
     * @param {Integer} dwFlags A value that specifies the policy type. This parameter can be the following value.
     * @param {PSTR} pMachineName A pointer to the name of the remote computer. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {PSID} pSidUser A value that specifies the SID of the user. If <i>pMachineName</i> is not <b>NULL</b> and <i>dwFlags</i> specifies user policy, then <i>pSidUser</i> cannot be <b>NULL</b>.
     * 
     * If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is <b>NULL</b>, the user is the currently logged-on user. If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is not <b>NULL</b>, the user is represented by <i>pSidUser</i> on the local computer. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
     * @param {Pointer<Guid>} pGuidExtension A value that specifies the <b>GUID</b> of the extension.
     * @param {Pointer<Pointer<GROUP_POLICY_OBJECTA>>} ppGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns a system error code. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-getappliedgpolista
     * @since windows6.0.6000
     */
    static GetAppliedGPOListA(dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        ppGPOListMarshal := ppGPOList is VarRef ? "ptr*" : "ptr"

        result := DllCall("USERENV.dll\GetAppliedGPOListA", "uint", dwFlags, "ptr", pMachineName, "ptr", pSidUser, "ptr", pGuidExtension, ppGPOListMarshal, ppGPOList, "uint")
        return result
    }

    /**
     * The GetAppliedGPOList function retrieves the list of GPOs applied for the specified user or computer.
     * @param {Integer} dwFlags A value that specifies the policy type. This parameter can be the following value.
     * @param {PWSTR} pMachineName A pointer to the name of the remote computer. The format of the name is "&#92;&#92;<i>computer_name</i>". If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {PSID} pSidUser A value that specifies the SID of the user. If <i>pMachineName</i> is not <b>NULL</b> and <i>dwFlags</i> specifies user policy, then <i>pSidUser</i> cannot be <b>NULL</b>.
     * 
     * If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is <b>NULL</b>, the user is the currently logged-on user. If <i>pMachineName</i> is <b>NULL</b> and <i>pSidUser</i> is not <b>NULL</b>, the user is represented by <i>pSidUser</i> on the local computer. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
     * @param {Pointer<Guid>} pGuidExtension A value that specifies the <b>GUID</b> of the extension.
     * @param {Pointer<Pointer<GROUP_POLICY_OBJECTW>>} ppGPOList A pointer that receives the list of GPO structures. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-group_policy_objecta">GROUP_POLICY_OBJECT</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns a system error code. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-getappliedgpolistw
     * @since windows6.0.6000
     */
    static GetAppliedGPOListW(dwFlags, pMachineName, pSidUser, pGuidExtension, ppGPOList) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        ppGPOListMarshal := ppGPOList is VarRef ? "ptr*" : "ptr"

        result := DllCall("USERENV.dll\GetAppliedGPOListW", "uint", dwFlags, "ptr", pMachineName, "ptr", pSidUser, "ptr", pGuidExtension, ppGPOListMarshal, ppGPOList, "uint")
        return result
    }

    /**
     * The ProcessGroupPolicyCompleted function notifies the system that the specified extension has finished applying policy.
     * @param {Pointer<Guid>} extensionId Specifies the unique <b>GUID</b> that identifies the extension.
     * @param {Pointer} pAsyncHandle Asynchronous completion handle. This handle is passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnprocessgrouppolicy">ProcessGroupPolicy</a> function.
     * @param {Integer} dwStatus Specifies the completion status of asynchronous processing.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-processgrouppolicycompleted
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
     * @param {HRESULT} RsopStatus Specifies an <b>HRESULT</b> return code that indicates the status of RSoP logging.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-processgrouppolicycompletedex
     * @since windows6.0.6000
     */
    static ProcessGroupPolicyCompletedEx(extensionId, pAsyncHandle, dwStatus, RsopStatus) {
        result := DllCall("USERENV.dll\ProcessGroupPolicyCompletedEx", "ptr", extensionId, "ptr", pAsyncHandle, "uint", dwStatus, "int", RsopStatus, "uint")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {PSID} pPrincipalSelfSid 
     * @param {Pointer<Void>} pRsopToken 
     * @param {Integer} dwDesiredAccessMask 
     * @param {Pointer<OBJECT_TYPE_LIST>} pObjectTypeList 
     * @param {Integer} ObjectTypeListLength 
     * @param {Pointer<GENERIC_MAPPING>} pGenericMapping 
     * @param {Pointer} pPrivilegeSet 
     * @param {Pointer<Integer>} pdwPrivilegeSetLength 
     * @param {Pointer<Integer>} pdwGrantedAccessMask 
     * @param {Pointer<BOOL>} pbAccessStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopaccesscheckbytype
     * @since windows6.0.6000
     */
    static RsopAccessCheckByType(pSecurityDescriptor, pPrincipalSelfSid, pRsopToken, dwDesiredAccessMask, pObjectTypeList, ObjectTypeListLength, pGenericMapping, pPrivilegeSet, pdwPrivilegeSetLength, pdwGrantedAccessMask, pbAccessStatus) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        pRsopTokenMarshal := pRsopToken is VarRef ? "ptr" : "ptr"
        pdwPrivilegeSetLengthMarshal := pdwPrivilegeSetLength is VarRef ? "uint*" : "ptr"
        pdwGrantedAccessMaskMarshal := pdwGrantedAccessMask is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USERENV.dll\RsopAccessCheckByType", "ptr", pSecurityDescriptor, "ptr", pPrincipalSelfSid, pRsopTokenMarshal, pRsopToken, "uint", dwDesiredAccessMask, "ptr", pObjectTypeList, "uint", ObjectTypeListLength, "ptr", pGenericMapping, "ptr", pPrivilegeSet, pdwPrivilegeSetLengthMarshal, pdwPrivilegeSetLength, pdwGrantedAccessMaskMarshal, pdwGrantedAccessMask, "ptr", pbAccessStatus, "int")
        if(A_LastError)
            throw OSError()

        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {Pointer<Void>} pRsopToken 
     * @param {Integer} dwDesiredAccessMask 
     * @param {Pointer<Integer>} pdwGrantedAccessMask 
     * @param {Pointer<BOOL>} pbAccessStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopfileaccesscheck
     * @since windows6.0.6000
     */
    static RsopFileAccessCheck(pszFileName, pRsopToken, dwDesiredAccessMask, pdwGrantedAccessMask, pbAccessStatus) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        pRsopTokenMarshal := pRsopToken is VarRef ? "ptr" : "ptr"
        pdwGrantedAccessMaskMarshal := pdwGrantedAccessMask is VarRef ? "uint*" : "ptr"

        result := DllCall("USERENV.dll\RsopFileAccessCheck", "ptr", pszFileName, pRsopTokenMarshal, pRsopToken, "uint", dwDesiredAccessMask, pdwGrantedAccessMaskMarshal, pdwGrantedAccessMask, "ptr", pbAccessStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IWbemServices} pServices 
     * @param {IWbemClassObject} pSettingInstance 
     * @param {Integer} nInfo 
     * @param {Pointer<POLICYSETTINGSTATUSINFO>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopsetpolicysettingstatus
     * @since windows6.0.6000
     */
    static RsopSetPolicySettingStatus(dwFlags, pServices, pSettingInstance, nInfo, pStatus) {
        result := DllCall("USERENV.dll\RsopSetPolicySettingStatus", "uint", dwFlags, "ptr", pServices, "ptr", pSettingInstance, "uint", nInfo, "ptr", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IWbemServices} pServices 
     * @param {IWbemClassObject} pSettingInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-rsopresetpolicysettingstatus
     * @since windows6.0.6000
     */
    static RsopResetPolicySettingStatus(dwFlags, pServices, pSettingInstance) {
        result := DllCall("USERENV.dll\RsopResetPolicySettingStatus", "uint", dwFlags, "ptr", pServices, "ptr", pSettingInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bMachine 
     * @param {PWSTR} lpwszMgmtProduct 
     * @param {Integer} dwMgmtProductOptions 
     * @returns {Integer} 
     */
    static GenerateGPNotification(bMachine, lpwszMgmtProduct, dwMgmtProductOptions) {
        lpwszMgmtProduct := lpwszMgmtProduct is String ? StrPtr(lpwszMgmtProduct) : lpwszMgmtProduct

        result := DllCall("USERENV.dll\GenerateGPNotification", "int", bMachine, "ptr", lpwszMgmtProduct, "uint", dwMgmtProductOptions, "uint")
        return result
    }

    /**
     * The InstallApplication function can install applications that have been deployed to target users that belong to a domain.
     * @param {Pointer<INSTALLDATA>} pInstallInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-installdata">INSTALLDATA</a> structure that specifies the application to install.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//appmgmt/nf-appmgmt-installapplication
     * @since windows6.0.6000
     */
    static InstallApplication(pInstallInfo) {
        result := DllCall("ADVAPI32.dll\InstallApplication", "ptr", pInstallInfo, "uint")
        return result
    }

    /**
     * The UninstallApplication function uninstalls a group policy application that handles setup and installation using Windows Installer .msi files.
     * @param {PWSTR} ProductCode The <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> product code of the product being uninstalled. The <a href="https://docs.microsoft.com/windows/desktop/Msi/product-codes">product code</a> of the application should be provided in the form of  a <a href="https://docs.microsoft.com/windows/desktop/Msi/guid">Windows Installer GUID</a> as a string with braces.
     * @param {Integer} dwStatus The status of the uninstall attempt. The <i>dwStatus</i> parameter is the Windows success code of the uninstall attempt returned by <a href="https://docs.microsoft.com/windows/desktop/api/msi/nf-msi-msiconfigureproducta">MsiConfigureProduct</a>.  The system can use this to ensure that the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/reporting-group-policy">Resultant Set of Policy (RSoP)</a> indicates whether the uninstall failed or succeeded.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//appmgmt/nf-appmgmt-uninstallapplication
     * @since windows6.0.6000
     */
    static UninstallApplication(ProductCode, dwStatus) {
        ProductCode := ProductCode is String ? StrPtr(ProductCode) : ProductCode

        result := DllCall("ADVAPI32.dll\UninstallApplication", "ptr", ProductCode, "uint", dwStatus, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} Descriptor 
     * @param {PWSTR} CommandLine 
     * @param {Pointer<Integer>} CommandLineLength 
     * @returns {Integer} 
     */
    static CommandLineFromMsiDescriptor(Descriptor, CommandLine, CommandLineLength) {
        Descriptor := Descriptor is String ? StrPtr(Descriptor) : Descriptor
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine

        CommandLineLengthMarshal := CommandLineLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\CommandLineFromMsiDescriptor", "ptr", Descriptor, "ptr", CommandLine, CommandLineLengthMarshal, CommandLineLength, "uint")
        return result
    }

    /**
     * The GetManagedApplications function gets a list of applications that are displayed in the Add pane of Add/Remove Programs (ARP) for a specified user context.
     * @param {Pointer<Guid>} pCategory A pointer to a GUID that specifies the  category  
     * 
     * of applications to be listed. If <i>pCategory</i> is not null, <i>dwQueryFlags</i> must   contain <b>MANAGED_APPS_FROMCATEGORY</b>. If <i>pCategory</i> is null, <i>dwQueryFlags</i> cannot contain <b>MANAGED_APPS_FROMCATEGORY</b>.
     * @param {Integer} dwQueryFlags 
     * @param {Integer} dwInfoLevel This parameter must be <b>MANAGED_APPS_INFOLEVEL_DEFAULT</b>.
     * @param {Pointer<Integer>} pdwApps The count of applications in the list returned by this function.
     * @param {Pointer<Pointer<MANAGEDAPPLICATION>>} prgManagedApps This parameter is a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-managedapplication">MANAGEDAPPLICATION</a> structures. This array contains the list of applications listed in the <b>Add</b> pane of  <b>Add/Remove Programs</b> (ARP). You must call <b>LocalFree</b> to free the array when they array is no longer required.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//appmgmt/nf-appmgmt-getmanagedapplications
     * @since windows6.0.6000
     */
    static GetManagedApplications(pCategory, dwQueryFlags, dwInfoLevel, pdwApps, prgManagedApps) {
        pdwAppsMarshal := pdwApps is VarRef ? "uint*" : "ptr"
        prgManagedAppsMarshal := prgManagedApps is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\GetManagedApplications", "ptr", pCategory, "uint", dwQueryFlags, "uint", dwInfoLevel, pdwAppsMarshal, pdwApps, prgManagedAppsMarshal, prgManagedApps, "uint")
        return result
    }

    /**
     * The GetLocalManagedApplications function can be run on the target computer to get a list of managed applications on that computer.
     * @param {BOOL} bUserApps A value that, if <b>TRUE</b>, the <i>prgLocalApps</i> parameter contains a list of managed applications that applies to the user.  If the value of this parameter is <b>FALSE</b>, the <i>prgLocalApps</i> parameter contains a list of managed applications that applies to the local computer.
     * @param {Pointer<Integer>} pdwApps The address of a <b>DWORD</b> that specifies the number of applications in the list returned by <i>prgLocalApps</i>.
     * @param {Pointer<Pointer<LOCALMANAGEDAPPLICATION>>} prgLocalApps The address of an array that contains the list of managed applications. You must call <b>LocalFree</b> to free this array when its contents are no longer required. This parameter cannot be null. The list is returned as a <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-localmanagedapplication">LOCALMANAGEDAPPLICATION</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//appmgmt/nf-appmgmt-getlocalmanagedapplications
     * @since windows6.0.6000
     */
    static GetLocalManagedApplications(bUserApps, pdwApps, prgLocalApps) {
        pdwAppsMarshal := pdwApps is VarRef ? "uint*" : "ptr"
        prgLocalAppsMarshal := prgLocalApps is VarRef ? "ptr*" : "ptr"

        result := DllCall("ADVAPI32.dll\GetLocalManagedApplications", "int", bUserApps, pdwAppsMarshal, pdwApps, prgLocalAppsMarshal, prgLocalApps, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ProductCode 
     * @param {Pointer<PWSTR>} DisplayName 
     * @param {Pointer<PWSTR>} SupportUrl 
     * @returns {String} Nothing - always returns an empty string
     */
    static GetLocalManagedApplicationData(ProductCode, DisplayName, SupportUrl) {
        ProductCode := ProductCode is String ? StrPtr(ProductCode) : ProductCode

        DllCall("ADVAPI32.dll\GetLocalManagedApplicationData", "ptr", ProductCode, "ptr", DisplayName, "ptr", SupportUrl)
    }

    /**
     * The GetManagedApplicationCategories function gets a list of application categories for a domain. The list is the same for all users in the domain.
     * @param {Pointer<APPCATEGORYINFOLIST>} pAppCategory A <a href="https://docs.microsoft.com/windows/desktop/api/appmgmt/ns-appmgmt-appcategoryinfolist">APPCATEGORYINFOLIST</a> structure that contains a list of application categories. This structure must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>  when the list is no longer required.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//appmgmt/nf-appmgmt-getmanagedapplicationcategories
     * @since windows6.0.6000
     */
    static GetManagedApplicationCategories(pAppCategory) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ADVAPI32.dll\GetManagedApplicationCategories", "uint", dwReserved, "ptr", pAppCategory, "uint")
        return result
    }

    /**
     * The CreateGPOLink function creates a link between the specified GPO and the specified site, domain, or organizational unit.
     * @param {PWSTR} lpGPO A value that specifies the path to the GPO, in ADSI format 
     *       ("LDAP://cn=<i>user</i>, ou=<i>users</i>, dc=<i>coname</i>, dc=<i>com</i>"). 
     *       You cannot specify a server name in this parameter.
     * @param {PWSTR} lpContainer A value that specifies the Active Directory path to the site, domain, or organizational unit.
     * @param {BOOL} fHighPriority A value that specifies the link priority. If this parameter is <b>TRUE</b>, the system 
     *       creates the link as the highest priority. If this parameter is <b>FALSE</b>, the system 
     *       creates the link as the lowest priority.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns 
     *        one of the COM error codes defined in the header file WinError.h. Be aware that you should test explicitly for 
     *        the return value <b>S_OK</b>. Do not use the <b>SUCCEEDED</b> or 
     *        <b>FAILED</b> macro on the returned <b>HRESULT</b> to determine success or failure of the 
     *        function.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-creategpolink
     * @since windows6.0.6000
     */
    static CreateGPOLink(lpGPO, lpContainer, fHighPriority) {
        lpGPO := lpGPO is String ? StrPtr(lpGPO) : lpGPO
        lpContainer := lpContainer is String ? StrPtr(lpContainer) : lpContainer

        result := DllCall("GPEDIT.dll\CreateGPOLink", "ptr", lpGPO, "ptr", lpContainer, "int", fHighPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The DeleteGPOLink function deletes the link between the specified GPO and the specified site, domain, or organizational unit.
     * @param {PWSTR} lpGPO A value that specifies the path to the GPO, in ADSI format (LDAP://cn=<i>user</i>, ou=<i>users</i>, dc=<i>coname</i>, dc=<i>com</i>). You cannot specify a server name in this parameter.
     * @param {PWSTR} lpContainer Specifies the Active Directory path to the site, domain, or organizational unit.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the  header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-deletegpolink
     * @since windows6.0.6000
     */
    static DeleteGPOLink(lpGPO, lpContainer) {
        lpGPO := lpGPO is String ? StrPtr(lpGPO) : lpGPO
        lpContainer := lpContainer is String ? StrPtr(lpContainer) : lpContainer

        result := DllCall("GPEDIT.dll\DeleteGPOLink", "ptr", lpGPO, "ptr", lpContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @param {PWSTR} lpContainer A value that specifies the path to the site, domain, or organizational unit, in ADSI format (LDAP://cn=<i>user</i>, ou=<i>users</i>, dc=<i>coname</i>, dc=<i>com</i>). You cannot specify a server name in this parameter.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-deleteallgpolinks
     * @since windows6.0.6000
     */
    static DeleteAllGPOLinks(lpContainer) {
        lpContainer := lpContainer is String ? StrPtr(lpContainer) : lpContainer

        result := DllCall("GPEDIT.dll\DeleteAllGPOLinks", "ptr", lpContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The BrowseForGPO function creates a GPO browser dialog box that allows the user to open or create a GPO.
     * @param {Pointer<GPOBROWSEINFO>} lpBrowseInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/gpedit/ns-gpedit-gpobrowseinfo">GPOBROWSEINFO</a> structure that contains information used to initialize the dialog box. When 
     * the <b>BrowseForGPO</b> function returns, this structure contains information about the user's actions.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. If the user cancels or closes the dialog box, the return value is <b>HRESULT_FROM_WIN32</b>(<b>ERROR_CANCELLED</b>). Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-browseforgpo
     * @since windows6.0.6000
     */
    static BrowseForGPO(lpBrowseInfo) {
        result := DllCall("GPEDIT.dll\BrowseForGPO", "ptr", lpBrowseInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ImportRSoPData function imports a data file containing RSoP data to a WMI namespace. The file must be one generated by a call to the ExportRSoPData function.
     * @param {PWSTR} lpNameSpace Pointer to a string specifying the namespace to contain the RSoP data. The namespace must exist prior to calling 
     * <b>ImportRSoPData</b>.
     * @param {PWSTR} lpFileName Pointer to a string specifying the name of the file that contains the RSoP data.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the Platform SDK header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-importrsopdata
     * @since windows6.0.6000
     */
    static ImportRSoPData(lpNameSpace, lpFileName) {
        lpNameSpace := lpNameSpace is String ? StrPtr(lpNameSpace) : lpNameSpace
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("GPEDIT.dll\ImportRSoPData", "ptr", lpNameSpace, "ptr", lpFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ExportRSoPData function exports a WMI namespace that contains RSoP information to a data file. The function writes the information to a data file that can be imported to a WMI namespace with a call to the ImportRSoPData function.
     * @param {PWSTR} lpNameSpace A pointer to a string that specifies the namespace which contains the RSoP data.
     * @param {PWSTR} lpFileName A pointer to a string that specifies the name of the file to receive the RSoP data.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//gpedit/nf-gpedit-exportrsopdata
     * @since windows6.0.6000
     */
    static ExportRSoPData(lpNameSpace, lpFileName) {
        lpNameSpace := lpNameSpace is String ? StrPtr(lpNameSpace) : lpNameSpace
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("GPEDIT.dll\ExportRSoPData", "ptr", lpNameSpace, "ptr", lpFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
