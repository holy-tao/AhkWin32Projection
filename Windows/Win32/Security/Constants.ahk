#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import ".\SID_IDENTIFIER_AUTHORITY.ahk" { SID_IDENTIFIER_AUTHORITY }

/**
 * @namespace Windows.Win32.Security
 */

;@region Constants

/**
 * @type {Integer (Byte)}
 */
export global SECURITY_DYNAMIC_TRACKING := 0x01

/**
 * @type {Integer (Byte)}
 */
export global SECURITY_STATIC_TRACKING := 0x00

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_MAX_SID_SIZE := 68

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_NULL_SID_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_NULL_SID_AUTHORITY.Value[1] := 0
SECURITY_NULL_SID_AUTHORITY.Value[2] := 0
SECURITY_NULL_SID_AUTHORITY.Value[3] := 0
SECURITY_NULL_SID_AUTHORITY.Value[4] := 0
SECURITY_NULL_SID_AUTHORITY.Value[5] := 0
SECURITY_NULL_SID_AUTHORITY.Value[6] := 0

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_WORLD_SID_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_WORLD_SID_AUTHORITY.Value[1] := 0
SECURITY_WORLD_SID_AUTHORITY.Value[2] := 0
SECURITY_WORLD_SID_AUTHORITY.Value[3] := 0
SECURITY_WORLD_SID_AUTHORITY.Value[4] := 0
SECURITY_WORLD_SID_AUTHORITY.Value[5] := 0
SECURITY_WORLD_SID_AUTHORITY.Value[6] := 1

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_LOCAL_SID_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_LOCAL_SID_AUTHORITY.Value[1] := 0
SECURITY_LOCAL_SID_AUTHORITY.Value[2] := 0
SECURITY_LOCAL_SID_AUTHORITY.Value[3] := 0
SECURITY_LOCAL_SID_AUTHORITY.Value[4] := 0
SECURITY_LOCAL_SID_AUTHORITY.Value[5] := 0
SECURITY_LOCAL_SID_AUTHORITY.Value[6] := 2

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_CREATOR_SID_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_CREATOR_SID_AUTHORITY.Value[1] := 0
SECURITY_CREATOR_SID_AUTHORITY.Value[2] := 0
SECURITY_CREATOR_SID_AUTHORITY.Value[3] := 0
SECURITY_CREATOR_SID_AUTHORITY.Value[4] := 0
SECURITY_CREATOR_SID_AUTHORITY.Value[5] := 0
SECURITY_CREATOR_SID_AUTHORITY.Value[6] := 3

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_NON_UNIQUE_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_NON_UNIQUE_AUTHORITY.Value[1] := 0
SECURITY_NON_UNIQUE_AUTHORITY.Value[2] := 0
SECURITY_NON_UNIQUE_AUTHORITY.Value[3] := 0
SECURITY_NON_UNIQUE_AUTHORITY.Value[4] := 0
SECURITY_NON_UNIQUE_AUTHORITY.Value[5] := 0
SECURITY_NON_UNIQUE_AUTHORITY.Value[6] := 4

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_NT_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_NT_AUTHORITY.Value[1] := 0
SECURITY_NT_AUTHORITY.Value[2] := 0
SECURITY_NT_AUTHORITY.Value[3] := 0
SECURITY_NT_AUTHORITY.Value[4] := 0
SECURITY_NT_AUTHORITY.Value[5] := 0
SECURITY_NT_AUTHORITY.Value[6] := 5

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_RESOURCE_MANAGER_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_RESOURCE_MANAGER_AUTHORITY.Value[1] := 0
SECURITY_RESOURCE_MANAGER_AUTHORITY.Value[2] := 0
SECURITY_RESOURCE_MANAGER_AUTHORITY.Value[3] := 0
SECURITY_RESOURCE_MANAGER_AUTHORITY.Value[4] := 0
SECURITY_RESOURCE_MANAGER_AUTHORITY.Value[5] := 0
SECURITY_RESOURCE_MANAGER_AUTHORITY.Value[6] := 9

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_APP_PACKAGE_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_APP_PACKAGE_AUTHORITY.Value[1] := 0
SECURITY_APP_PACKAGE_AUTHORITY.Value[2] := 0
SECURITY_APP_PACKAGE_AUTHORITY.Value[3] := 0
SECURITY_APP_PACKAGE_AUTHORITY.Value[4] := 0
SECURITY_APP_PACKAGE_AUTHORITY.Value[5] := 0
SECURITY_APP_PACKAGE_AUTHORITY.Value[6] := 15

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_MANDATORY_LABEL_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_MANDATORY_LABEL_AUTHORITY.Value[1] := 0
SECURITY_MANDATORY_LABEL_AUTHORITY.Value[2] := 0
SECURITY_MANDATORY_LABEL_AUTHORITY.Value[3] := 0
SECURITY_MANDATORY_LABEL_AUTHORITY.Value[4] := 0
SECURITY_MANDATORY_LABEL_AUTHORITY.Value[5] := 0
SECURITY_MANDATORY_LABEL_AUTHORITY.Value[6] := 16

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_SCOPED_POLICY_ID_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_SCOPED_POLICY_ID_AUTHORITY.Value[1] := 0
SECURITY_SCOPED_POLICY_ID_AUTHORITY.Value[2] := 0
SECURITY_SCOPED_POLICY_ID_AUTHORITY.Value[3] := 0
SECURITY_SCOPED_POLICY_ID_AUTHORITY.Value[4] := 0
SECURITY_SCOPED_POLICY_ID_AUTHORITY.Value[5] := 0
SECURITY_SCOPED_POLICY_ID_AUTHORITY.Value[6] := 17

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_AUTHENTICATION_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_AUTHENTICATION_AUTHORITY.Value[1] := 0
SECURITY_AUTHENTICATION_AUTHORITY.Value[2] := 0
SECURITY_AUTHENTICATION_AUTHORITY.Value[3] := 0
SECURITY_AUTHENTICATION_AUTHORITY.Value[4] := 0
SECURITY_AUTHENTICATION_AUTHORITY.Value[5] := 0
SECURITY_AUTHENTICATION_AUTHORITY.Value[6] := 18

/**
 * @type {SID_IDENTIFIER_AUTHORITY}
 */
export global SECURITY_PROCESS_TRUST_AUTHORITY := SID_IDENTIFIER_AUTHORITY()
SECURITY_PROCESS_TRUST_AUTHORITY.Value[1] := 0
SECURITY_PROCESS_TRUST_AUTHORITY.Value[2] := 0
SECURITY_PROCESS_TRUST_AUTHORITY.Value[3] := 0
SECURITY_PROCESS_TRUST_AUTHORITY.Value[4] := 0
SECURITY_PROCESS_TRUST_AUTHORITY.Value[5] := 0
SECURITY_PROCESS_TRUST_AUTHORITY.Value[6] := 19

/**
 * @type {String}
 */
export global SE_CREATE_TOKEN_NAME := "SeCreateTokenPrivilege"

/**
 * @type {String}
 */
export global SE_ASSIGNPRIMARYTOKEN_NAME := "SeAssignPrimaryTokenPrivilege"

/**
 * @type {String}
 */
export global SE_LOCK_MEMORY_NAME := "SeLockMemoryPrivilege"

/**
 * @type {String}
 */
export global SE_INCREASE_QUOTA_NAME := "SeIncreaseQuotaPrivilege"

/**
 * @type {String}
 */
export global SE_UNSOLICITED_INPUT_NAME := "SeUnsolicitedInputPrivilege"

/**
 * @type {String}
 */
export global SE_MACHINE_ACCOUNT_NAME := "SeMachineAccountPrivilege"

/**
 * @type {String}
 */
export global SE_TCB_NAME := "SeTcbPrivilege"

/**
 * @type {String}
 */
export global SE_SECURITY_NAME := "SeSecurityPrivilege"

/**
 * @type {String}
 */
export global SE_TAKE_OWNERSHIP_NAME := "SeTakeOwnershipPrivilege"

/**
 * @type {String}
 */
export global SE_LOAD_DRIVER_NAME := "SeLoadDriverPrivilege"

/**
 * @type {String}
 */
export global SE_SYSTEM_PROFILE_NAME := "SeSystemProfilePrivilege"

/**
 * @type {String}
 */
export global SE_SYSTEMTIME_NAME := "SeSystemtimePrivilege"

/**
 * @type {String}
 */
export global SE_PROF_SINGLE_PROCESS_NAME := "SeProfileSingleProcessPrivilege"

/**
 * @type {String}
 */
export global SE_INC_BASE_PRIORITY_NAME := "SeIncreaseBasePriorityPrivilege"

/**
 * @type {String}
 */
export global SE_CREATE_PAGEFILE_NAME := "SeCreatePagefilePrivilege"

/**
 * @type {String}
 */
export global SE_CREATE_PERMANENT_NAME := "SeCreatePermanentPrivilege"

/**
 * @type {String}
 */
export global SE_BACKUP_NAME := "SeBackupPrivilege"

/**
 * @type {String}
 */
export global SE_RESTORE_NAME := "SeRestorePrivilege"

/**
 * @type {String}
 */
export global SE_SHUTDOWN_NAME := "SeShutdownPrivilege"

/**
 * @type {String}
 */
export global SE_DEBUG_NAME := "SeDebugPrivilege"

/**
 * @type {String}
 */
export global SE_AUDIT_NAME := "SeAuditPrivilege"

/**
 * @type {String}
 */
export global SE_SYSTEM_ENVIRONMENT_NAME := "SeSystemEnvironmentPrivilege"

/**
 * @type {String}
 */
export global SE_CHANGE_NOTIFY_NAME := "SeChangeNotifyPrivilege"

/**
 * @type {String}
 */
export global SE_REMOTE_SHUTDOWN_NAME := "SeRemoteShutdownPrivilege"

/**
 * @type {String}
 */
export global SE_UNDOCK_NAME := "SeUndockPrivilege"

/**
 * @type {String}
 */
export global SE_SYNC_AGENT_NAME := "SeSyncAgentPrivilege"

/**
 * @type {String}
 */
export global SE_ENABLE_DELEGATION_NAME := "SeEnableDelegationPrivilege"

/**
 * @type {String}
 */
export global SE_MANAGE_VOLUME_NAME := "SeManageVolumePrivilege"

/**
 * @type {String}
 */
export global SE_IMPERSONATE_NAME := "SeImpersonatePrivilege"

/**
 * @type {String}
 */
export global SE_CREATE_GLOBAL_NAME := "SeCreateGlobalPrivilege"

/**
 * @type {String}
 */
export global SE_TRUSTED_CREDMAN_ACCESS_NAME := "SeTrustedCredManAccessPrivilege"

/**
 * @type {String}
 */
export global SE_RELABEL_NAME := "SeRelabelPrivilege"

/**
 * @type {String}
 */
export global SE_INC_WORKING_SET_NAME := "SeIncreaseWorkingSetPrivilege"

/**
 * @type {String}
 */
export global SE_TIME_ZONE_NAME := "SeTimeZonePrivilege"

/**
 * @type {String}
 */
export global SE_CREATE_SYMBOLIC_LINK_NAME := "SeCreateSymbolicLinkPrivilege"

/**
 * @type {String}
 */
export global SE_DELEGATE_SESSION_USER_IMPERSONATE_NAME := "SeDelegateSessionUserImpersonatePrivilege"

/**
 * @type {String}
 */
export global wszCERTENROLLSHAREPATH := "CertSrv\CertEnroll"

/**
 * @type {Integer (UInt32)}
 */
export global cwcHRESULTSTRING := 40

/**
 * @type {String}
 */
export global szLBRACE := "{"

/**
 * @type {String}
 */
export global szRBRACE := "}"

/**
 * @type {String}
 */
export global wszLBRACE := "{"

/**
 * @type {String}
 */
export global wszRBRACE := "}"

/**
 * @type {String}
 */
export global szLPAREN := "("

/**
 * @type {String}
 */
export global szRPAREN := ")"

/**
 * @type {String}
 */
export global wszLPAREN := "("

/**
 * @type {String}
 */
export global wszRPAREN := ")"

/**
 * @type {Integer (UInt32)}
 */
export global CVT_SECONDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global cwcFILENAMESUFFIXMAX := 20

/**
 * @type {String}
 */
export global wszFCSAPARM_SERVERDNSNAME := "%1"

/**
 * @type {String}
 */
export global wszFCSAPARM_SERVERSHORTNAME := "%2"

/**
 * @type {String}
 */
export global wszFCSAPARM_SANITIZEDCANAME := "%3"

/**
 * @type {String}
 */
export global wszFCSAPARM_CERTFILENAMESUFFIX := "%4"

/**
 * @type {String}
 */
export global wszFCSAPARM_DOMAINDN := "%5"

/**
 * @type {String}
 */
export global wszFCSAPARM_CONFIGDN := "%6"

/**
 * @type {String}
 */
export global wszFCSAPARM_SANITIZEDCANAMEHASH := "%7"

/**
 * @type {String}
 */
export global wszFCSAPARM_CRLFILENAMESUFFIX := "%8"

/**
 * @type {String}
 */
export global wszFCSAPARM_CRLDELTAFILENAMESUFFIX := "%9"

/**
 * @type {String}
 */
export global wszFCSAPARM_DSCRLATTRIBUTE := "%10"

/**
 * @type {String}
 */
export global wszFCSAPARM_DSCACERTATTRIBUTE := "%11"

/**
 * @type {String}
 */
export global wszFCSAPARM_DSUSERCERTATTRIBUTE := "%12"

/**
 * @type {String}
 */
export global wszFCSAPARM_DSKRACERTATTRIBUTE := "%13"

/**
 * @type {String}
 */
export global wszFCSAPARM_DSCROSSCERTPAIRATTRIBUTE := "%14"

/**
 * @type {Integer (UInt32)}
 */
export global SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIGNING_LEVEL_MICROSOFT := 8
;@endregion Constants
