#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class Security {

;@region Constants

    /**
     * @type {Integer (Byte)}
     */
    static SECURITY_DYNAMIC_TRACKING => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static SECURITY_STATIC_TRACKING => 0x00

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_MAX_SID_SIZE => 68

    /**
     * @type {String}
     */
    static SE_CREATE_TOKEN_NAME => "SeCreateTokenPrivilege"

    /**
     * @type {String}
     */
    static SE_ASSIGNPRIMARYTOKEN_NAME => "SeAssignPrimaryTokenPrivilege"

    /**
     * @type {String}
     */
    static SE_LOCK_MEMORY_NAME => "SeLockMemoryPrivilege"

    /**
     * @type {String}
     */
    static SE_INCREASE_QUOTA_NAME => "SeIncreaseQuotaPrivilege"

    /**
     * @type {String}
     */
    static SE_UNSOLICITED_INPUT_NAME => "SeUnsolicitedInputPrivilege"

    /**
     * @type {String}
     */
    static SE_MACHINE_ACCOUNT_NAME => "SeMachineAccountPrivilege"

    /**
     * @type {String}
     */
    static SE_TCB_NAME => "SeTcbPrivilege"

    /**
     * @type {String}
     */
    static SE_SECURITY_NAME => "SeSecurityPrivilege"

    /**
     * @type {String}
     */
    static SE_TAKE_OWNERSHIP_NAME => "SeTakeOwnershipPrivilege"

    /**
     * @type {String}
     */
    static SE_LOAD_DRIVER_NAME => "SeLoadDriverPrivilege"

    /**
     * @type {String}
     */
    static SE_SYSTEM_PROFILE_NAME => "SeSystemProfilePrivilege"

    /**
     * @type {String}
     */
    static SE_SYSTEMTIME_NAME => "SeSystemtimePrivilege"

    /**
     * @type {String}
     */
    static SE_PROF_SINGLE_PROCESS_NAME => "SeProfileSingleProcessPrivilege"

    /**
     * @type {String}
     */
    static SE_INC_BASE_PRIORITY_NAME => "SeIncreaseBasePriorityPrivilege"

    /**
     * @type {String}
     */
    static SE_CREATE_PAGEFILE_NAME => "SeCreatePagefilePrivilege"

    /**
     * @type {String}
     */
    static SE_CREATE_PERMANENT_NAME => "SeCreatePermanentPrivilege"

    /**
     * @type {String}
     */
    static SE_BACKUP_NAME => "SeBackupPrivilege"

    /**
     * @type {String}
     */
    static SE_RESTORE_NAME => "SeRestorePrivilege"

    /**
     * @type {String}
     */
    static SE_SHUTDOWN_NAME => "SeShutdownPrivilege"

    /**
     * @type {String}
     */
    static SE_DEBUG_NAME => "SeDebugPrivilege"

    /**
     * @type {String}
     */
    static SE_AUDIT_NAME => "SeAuditPrivilege"

    /**
     * @type {String}
     */
    static SE_SYSTEM_ENVIRONMENT_NAME => "SeSystemEnvironmentPrivilege"

    /**
     * @type {String}
     */
    static SE_CHANGE_NOTIFY_NAME => "SeChangeNotifyPrivilege"

    /**
     * @type {String}
     */
    static SE_REMOTE_SHUTDOWN_NAME => "SeRemoteShutdownPrivilege"

    /**
     * @type {String}
     */
    static SE_UNDOCK_NAME => "SeUndockPrivilege"

    /**
     * @type {String}
     */
    static SE_SYNC_AGENT_NAME => "SeSyncAgentPrivilege"

    /**
     * @type {String}
     */
    static SE_ENABLE_DELEGATION_NAME => "SeEnableDelegationPrivilege"

    /**
     * @type {String}
     */
    static SE_MANAGE_VOLUME_NAME => "SeManageVolumePrivilege"

    /**
     * @type {String}
     */
    static SE_IMPERSONATE_NAME => "SeImpersonatePrivilege"

    /**
     * @type {String}
     */
    static SE_CREATE_GLOBAL_NAME => "SeCreateGlobalPrivilege"

    /**
     * @type {String}
     */
    static SE_TRUSTED_CREDMAN_ACCESS_NAME => "SeTrustedCredManAccessPrivilege"

    /**
     * @type {String}
     */
    static SE_RELABEL_NAME => "SeRelabelPrivilege"

    /**
     * @type {String}
     */
    static SE_INC_WORKING_SET_NAME => "SeIncreaseWorkingSetPrivilege"

    /**
     * @type {String}
     */
    static SE_TIME_ZONE_NAME => "SeTimeZonePrivilege"

    /**
     * @type {String}
     */
    static SE_CREATE_SYMBOLIC_LINK_NAME => "SeCreateSymbolicLinkPrivilege"

    /**
     * @type {String}
     */
    static SE_DELEGATE_SESSION_USER_IMPERSONATE_NAME => "SeDelegateSessionUserImpersonatePrivilege"

    /**
     * @type {String}
     */
    static wszCERTENROLLSHAREPATH => "CertSrv\CertEnroll"

    /**
     * @type {Integer (UInt32)}
     */
    static cwcHRESULTSTRING => 40

    /**
     * @type {String}
     */
    static szLBRACE => "{"

    /**
     * @type {String}
     */
    static szRBRACE => "}"

    /**
     * @type {String}
     */
    static wszLBRACE => "{"

    /**
     * @type {String}
     */
    static wszRBRACE => "}"

    /**
     * @type {String}
     */
    static szLPAREN => "("

    /**
     * @type {String}
     */
    static szRPAREN => ")"

    /**
     * @type {String}
     */
    static wszLPAREN => "("

    /**
     * @type {String}
     */
    static wszRPAREN => ")"

    /**
     * @type {Integer (UInt32)}
     */
    static CVT_SECONDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static cwcFILENAMESUFFIXMAX => 20

    /**
     * @type {String}
     */
    static wszFCSAPARM_SERVERDNSNAME => "%1"

    /**
     * @type {String}
     */
    static wszFCSAPARM_SERVERSHORTNAME => "%2"

    /**
     * @type {String}
     */
    static wszFCSAPARM_SANITIZEDCANAME => "%3"

    /**
     * @type {String}
     */
    static wszFCSAPARM_CERTFILENAMESUFFIX => "%4"

    /**
     * @type {String}
     */
    static wszFCSAPARM_DOMAINDN => "%5"

    /**
     * @type {String}
     */
    static wszFCSAPARM_CONFIGDN => "%6"

    /**
     * @type {String}
     */
    static wszFCSAPARM_SANITIZEDCANAMEHASH => "%7"

    /**
     * @type {String}
     */
    static wszFCSAPARM_CRLFILENAMESUFFIX => "%8"

    /**
     * @type {String}
     */
    static wszFCSAPARM_CRLDELTAFILENAMESUFFIX => "%9"

    /**
     * @type {String}
     */
    static wszFCSAPARM_DSCRLATTRIBUTE => "%10"

    /**
     * @type {String}
     */
    static wszFCSAPARM_DSCACERTATTRIBUTE => "%11"

    /**
     * @type {String}
     */
    static wszFCSAPARM_DSUSERCERTATTRIBUTE => "%12"

    /**
     * @type {String}
     */
    static wszFCSAPARM_DSKRACERTATTRIBUTE => "%13"

    /**
     * @type {String}
     */
    static wszFCSAPARM_DSCROSSCERTPAIRATTRIBUTE => "%14"

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNING_LEVEL_MICROSOFT => 8
;@endregion Constants

;@region Methods
    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {HANDLE} ClientToken A handle to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> that represents the client that is attempting to gain access. The handle must have TOKEN_QUERY access to the token; otherwise, the function fails with ERROR_ACCESS_DENIED.
     * @param {Integer} DesiredAccess <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights. 
     * 
     * 
     * 
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the <i>GrantedAccess</i> access mask to indicate the maximum access rights the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> allows the client.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {Pointer} PrivilegeSet A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> used to perform the access validation. If no privileges were used, the function sets the <b>PrivilegeCount</b> member to zero.
     * @param {Pointer<UInt32>} PrivilegeSetLength Specifies the size, in bytes, of the buffer pointed to by the <i>PrivilegeSet</i> parameter.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that receives the granted access rights. If <i>AccessStatus</i> is set to <b>FALSE</b>, the function sets the access mask to zero. If the function fails, it does not set the access mask.
     * @param {Pointer<BOOL>} AccessStatus A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client identified by the access token, <i>AccessStatus</i> is set to <b>TRUE</b>. Otherwise, <i>AccessStatus</i> is set to <b>FALSE</b>, and you can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheck
     * @since windows5.1.2600
     */
    static AccessCheck(pSecurityDescriptor, ClientToken, DesiredAccess, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AccessCheck", "ptr", pSecurityDescriptor, "ptr", ClientToken, "uint", DesiredAccess, "ptr", GenericMapping, "ptr", PrivilegeSet, "uint*", PrivilegeSetLength, "uint*", GrantedAccess, "ptr", AccessStatus, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value representing the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PWSTR} ObjectName A pointer to a null-terminated string specifying the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {Integer} DesiredAccess <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Access mask</a> that specifies the access rights to check. This mask must have been mapped by the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights.
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the <i>GrantedAccess</i> access mask to indicate the maximum access rights the security descriptor allows the client.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation Specifies a flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that receives the granted access rights. If <i>AccessStatus</i> is set to <b>FALSE</b>, the function sets the access mask to zero. If the function fails, it does not set the access mask.
     * @param {Pointer<BOOL>} AccessStatus A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client, <i>AccessStatus</i> is set to <b>TRUE</b>. Otherwise, <i>AccessStatus</i> is set to <b>FALSE</b>.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-objectcloseauditalarmw">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheckandauditalarmw
     */
    static AccessCheckAndAuditAlarmW(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ADVAPI32.dll\AccessCheckAndAuditAlarmW", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "uint", DesiredAccess, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccess, "ptr", AccessStatus, "ptr", pfGenerateOnClose, "ptr")
        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entry</a>  containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>. 
     * 
     * 
     * 
     * 
     * Set this parameter to <b>NULL</b> if the protected object does not represent a principal.
     * @param {HANDLE} ClientToken A handle to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> that represents the client attempting to gain access. The handle must have TOKEN_QUERY access to the token; otherwise, the function fails with ERROR_ACCESS_DENIED.
     * @param {Integer} DesiredAccess <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights. 
     * 
     * 
     * 
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the <i>GrantedAccess</i> access mask to indicate the maximum access rights the security descriptor allows the client.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value indicating the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID. 
     * 
     * 
     * 
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByType</b> fails and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * 
     * If <i>ObjectTypeList</i> is <b>NULL</b>, <b>AccessCheckByType</b> is the same as the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a> function.
     * @param {Integer} ObjectTypeListLength Specifies the number of elements in the <i>ObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked. The <b>GenericAll</b> member of the  <b>GENERIC_MAPPING</b> structure should contain all the access rights that can be granted by the resource manager, including STANDARD_RIGHTS_ALL and all of the rights that are set in the <b>GenericRead</b>, <b>GenericWrite</b>, and <b>GenericExecute</b> members.
     * @param {Pointer} PrivilegeSet A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> used to perform the access validation. If no privileges were used, the function sets the <b>PrivilegeCount</b> member to zero.
     * @param {Pointer<UInt32>} PrivilegeSetLength Specifies the size, in bytes, of the buffer pointed to by the <i>PrivilegeSet</i> parameter.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an access mask that receives the granted access rights. If <i>AccessStatus</i> is set to <b>FALSE</b>, the function sets the access mask to zero. If the function fails, it does not set the access mask.
     * @param {Pointer<BOOL>} AccessStatus A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client identified by the access token, <i>AccessStatus</i> is set to <b>TRUE</b>. Otherwise, <i>AccessStatus</i> is set to <b>FALSE</b>, and you can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheckbytype
     * @since windows5.1.2600
     */
    static AccessCheckByType(pSecurityDescriptor, PrincipalSelfSid, ClientToken, DesiredAccess, ObjectTypeList, ObjectTypeListLength, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccess, AccessStatus) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AccessCheckByType", "ptr", pSecurityDescriptor, "ptr", PrincipalSelfSid, "ptr", ClientToken, "uint", DesiredAccess, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", PrivilegeSet, "uint*", PrivilegeSetLength, "uint*", GrantedAccess, "ptr", AccessStatus, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entry</a> (ACE) that contains the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>. 
     * 
     * 
     * 
     * 
     * If the protected object does not represent a principal, set this parameter to <b>NULL</b>.
     * @param {HANDLE} ClientToken A handle to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> that represents the client attempting to gain access. The handle must have TOKEN_QUERY access to the token; otherwise, the function fails with ERROR_ACCESS_DENIED.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights. 
     * 
     * 
     * 
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the access masks in the <i>GrantedAccess</i> array to indicate the client's maximum access rights to each element in the object type list.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID. 
     * 
     * 
     * 
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByTypeResultList</b> fails and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} ObjectTypeListLength The number of elements in the <i>ObjectTypeList</i> array. This is also the number of elements in the arrays pointed to by the <i>GrantedAccessList</i> and <i>AccessStatusList</i> parameters.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {Pointer} PrivilegeSet A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> used to perform the access validation. If no privileges were used, the function sets the <b>PrivilegeCount</b> member to zero.
     * @param {Pointer<UInt32>} PrivilegeSetLength The size, in bytes, of the buffer pointed to by the <i>PrivilegeSet</i> parameter.
     * @param {Pointer<UInt32>} GrantedAccessList A pointer to an array of access masks. The function sets each access mask to indicate the access rights granted to the corresponding element in the object type list. If the function fails, it does not set the access masks.
     * @param {Pointer<UInt32>} AccessStatusList A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheckbytyperesultlist
     * @since windows5.1.2600
     */
    static AccessCheckByTypeResultList(pSecurityDescriptor, PrincipalSelfSid, ClientToken, DesiredAccess, ObjectTypeList, ObjectTypeListLength, GenericMapping, PrivilegeSet, PrivilegeSetLength, GrantedAccessList, AccessStatusList) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AccessCheckByTypeResultList", "ptr", pSecurityDescriptor, "ptr", PrincipalSelfSid, "ptr", ClientToken, "uint", DesiredAccess, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", PrivilegeSet, "uint*", PrivilegeSetLength, "uint*", GrantedAccessList, "uint*", AccessStatusList, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PWSTR} ObjectName A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>.
     * 
     * If the protected object does not represent a principal, set this parameter to <b>NULL</b>.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights.
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the <i>GrantedAccess</i> access mask to indicate the maximum access rights the security descriptor allows the client.
     * @param {Integer} AuditType The type of audit to be generated. This can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-audit_event_type">AUDIT_EVENT_TYPE</a> enumeration type.
     * @param {Integer} Flags A flag that controls the function's behavior if the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID.
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByTypeAndAuditAlarm</b> fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} ObjectTypeListLength The number of elements in the <i>ObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation A flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an access mask that receives the granted access rights. If <i>AccessStatus</i> is set to <b>FALSE</b>, the function sets the access mask to zero. If the function fails, it does not set the access mask.
     * @param {Pointer<BOOL>} AccessStatus A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client, <i>AccessStatus</i> is set to <b>TRUE</b>. Otherwise, <i>AccessStatus</i> is set to <b>FALSE</b> and you can call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectcloseauditalarma">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheckbytypeandauditalarmw
     */
    static AccessCheckByTypeAndAuditAlarmW(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ADVAPI32.dll\AccessCheckByTypeAndAuditAlarmW", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccess, "ptr", AccessStatus, "ptr", pfGenerateOnClose, "ptr")
        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PWSTR} ObjectName A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE that contains the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>.
     * 
     * Set this parameter to <b>NULL</b> if the protected object does not represent a principal.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function so that it contains no generic access rights.
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the access mask in <i>GrantedAccess</i> to indicate the maximum access rights the security descriptor allows the client.
     * @param {Integer} AuditType The type of audit to be generated. This can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-audit_event_type">AUDIT_EVENT_TYPE</a> enumeration type.
     * @param {Integer} Flags A flag that controls the function's behavior if the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID.
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByTypeResultListAndAuditAlarm</b> fails, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} ObjectTypeListLength The number of elements in the <i>ObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation A flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccessList 
     * @param {Pointer<UInt32>} AccessStatusList A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or to a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-objectcloseauditalarmw">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheckbytyperesultlistandauditalarmw
     */
    static AccessCheckByTypeResultListAndAuditAlarmW(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccessList, AccessStatusList, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ADVAPI32.dll\AccessCheckByTypeResultListAndAuditAlarmW", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccessList, "uint*", AccessStatusList, "ptr", pfGenerateOnClose, "ptr")
        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client that the calling thread is impersonating.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {HANDLE} ClientToken A handle to a token object that represents the client that requested the operation. This handle must be obtained through a communication session layer, such as a local named pipe, to prevent possible security policy violations. The caller must have TOKEN_QUERY access for the specified token.
     * @param {PWSTR} ObjectTypeName A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PWSTR} ObjectName A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a SID. If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>.
     * 
     * Set this parameter to <b>NULL</b> if the protected object does not represent a principal.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the access rights to check. This mask must have been mapped by the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function so that it contains no generic access rights.
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the access mask in <i>GrantedAccess</i> to indicate the maximum access rights the security descriptor allows the client.
     * @param {Integer} AuditType The type of audit to be generated. This can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-audit_event_type">AUDIT_EVENT_TYPE</a> enumeration type.
     * @param {Integer} Flags A flag that controls the function's behavior if the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID.
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByTypeResultListAndAuditAlarmByHandle</b> fails, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} ObjectTypeListLength The number of elements in the <i>ObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation A flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccessList 
     * @param {Pointer<UInt32>} AccessStatusList A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or to a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-objectcloseauditalarmw">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheckbytyperesultlistandauditalarmbyhandlew
     */
    static AccessCheckByTypeResultListAndAuditAlarmByHandleW(SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccessList, AccessStatusList, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ADVAPI32.dll\AccessCheckByTypeResultListAndAuditAlarmByHandleW", "ptr", SubsystemName, "ptr", HandleId, "ptr", ClientToken, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccessList, "uint*", AccessStatusList, "ptr", pfGenerateOnClose, "ptr")
        return result
    }

    /**
     * Adds an access-allowed access control entry (ACE) to an access control list (ACL). The access is granted to a specified security identifier (SID).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL. This function adds an access-allowed ACE to the end of this ACL. The ACE is in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_ace">ACCESS_ALLOWED_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the ACL being modified. 
     * 
     * 
     * This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the ACL contains object-specific ACEs.
     * @param {Integer} AccessMask Specifies the mask of access rights to be granted to the specified SID.
     * @param {PSID} pSid A pointer to the 
     * SID  representing a user, group, or logon account being granted access.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addaccessallowedace
     * @since windows5.1.2600
     */
    static AddAccessAllowedAce(pAcl, dwAceRevision, AccessMask, pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAccessAllowedAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AccessMask, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds an access-allowed access control entry (ACE) to the end of a discretionary access control list (DACL).
     * @param {Pointer<ACL>} pAcl A pointer to a DACL. The <b>AddAccessAllowedAceEx</b> function adds an access-allowed ACE to the end of this DACL. The ACE is in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_ace">ACCESS_ALLOWED_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the DACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the DACL contains object-specific ACEs.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. The function sets these flags in the <b>AceFlags</b> member of the
     * @param {Integer} AccessMask A set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format. These flags specify the access rights that the new ACE allows for the specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @param {PSID} pSid A pointer to a 
     * SID that identifies the user, group, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> to which the new ACE allows access.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AceFlags</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addaccessallowedaceex
     * @since windows5.1.2600
     */
    static AddAccessAllowedAceEx(pAcl, dwAceRevision, AceFlags, AccessMask, pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAccessAllowedAceEx", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds an access-allowed access control entry (ACE) to the end of a discretionary access control list (DACL).
     * @param {Pointer<ACL>} pAcl A pointer to a DACL. The <b>AddAccessAllowedObjectAce</b> function adds an access-allowed ACE to the end of this DACL. The ACE is in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_object_ace">ACCESS_ALLOWED_OBJECT_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the DACL being modified. This value must be ACL_REVISION_DS. If the DACL's revision level is lower than ACL_REVISION_DS, the function changes it to ACL_REVISION_DS.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. The function sets these flags in the <b>AceFlags</b> member of the
     * @param {Integer} AccessMask A set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format. These flags specify the access rights that the new ACE allows for the specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @param {Pointer<Guid>} ObjectTypeGuid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object, property set, or property protected by the new ACE. If this parameter is <b>NULL</b>, the new ACE protects the object to which the DACL is assigned.
     * @param {Pointer<Guid>} InheritedObjectTypeGuid A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object that can inherit the new ACE. If this parameter is non-<b>NULL</b>, only the specified object type can inherit the ACE. If <b>NULL</b>, any type of child object can inherit the ACE. In either case, inheritance is also controlled by the value of the <i>AceFlags</i> parameter, as well as by any protection against inheritance placed on the child objects.
     * @param {PSID} pSid A pointer to a 
     * SID that identifies the user, group, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> to which the new ACE allows access.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AceFlags</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addaccessallowedobjectace
     * @since windows5.1.2600
     */
    static AddAccessAllowedObjectAce(pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAccessAllowedObjectAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", ObjectTypeGuid, "ptr", InheritedObjectTypeGuid, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds an access-denied access control entry (ACE) to an access control list (ACL). The access is denied to a specified security identifier (SID).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL . This function adds an access-denied ACE to the end of this ACL. The ACE is in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_denied_ace">ACCESS_DENIED_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the ACL being modified. 
     * 
     * 
     * This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the ACL contains object-specific ACEs.
     * @param {Integer} AccessMask Specifies the mask of access rights being denied to the specified SID.
     * @param {PSID} pSid A pointer to the SID structure representing the user, group, or logon account being denied access.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addaccessdeniedace
     * @since windows5.1.2600
     */
    static AddAccessDeniedAce(pAcl, dwAceRevision, AccessMask, pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAccessDeniedAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AccessMask, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds an access-denied access control entry (ACE) to the end of a discretionary access control list (DACL).
     * @param {Pointer<ACL>} pAcl A pointer to a DACL. The <b>AddAccessDeniedAceEx</b> function adds an access-denied ACE to the end of this DACL. The ACE is in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_denied_ace">ACCESS_DENIED_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the DACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the DACL contains object-specific ACEs.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. The function sets these flags in the <b>AceFlags</b> member of the
     * @param {Integer} AccessMask A set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format to specify the access rights that the new ACE denies to the specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @param {PSID} pSid A pointer to a 
     * SID  that identifies the user, group, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> to which the new ACE denies access.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AceFlags</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addaccessdeniedaceex
     * @since windows5.1.2600
     */
    static AddAccessDeniedAceEx(pAcl, dwAceRevision, AceFlags, AccessMask, pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAccessDeniedAceEx", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds an access-denied access control entry (ACE) to the end of a discretionary access control list (DACL). The new ACE can deny access to an object, or to a property set or property on an object.
     * @param {Pointer<ACL>} pAcl A pointer to a DACL. The <b>AddAccessDeniedObjectAce</b> function adds an access-denied ACE to the end of this DACL. The ACE is in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_denied_object_ace">ACCESS_DENIED_OBJECT_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the DACL being modified. This value must be ACL_REVISION_DS. If the DACL's revision level is lower than ACL_REVISION_DS, the function changes it to ACL_REVISION_DS.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. The function sets these flags in the <b>AceFlags</b> member of the
     * @param {Integer} AccessMask A set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format to specify the access rights that the new ACE denies to the specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @param {Pointer<Guid>} ObjectTypeGuid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object, property set, or property protected by the new ACE. If this parameter is <b>NULL</b>, the new ACE protects the object to which the ACL is assigned.
     * @param {Pointer<Guid>} InheritedObjectTypeGuid A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object that can inherit the new ACE. If this parameter is non-<b>NULL</b>, only the specified object type can inherit the ACE. If <b>NULL</b>, any type of child object can inherit the ACE. In either case, inheritance is also controlled by the value of the <i>AceFlags</i> parameter, as well as by any protection against inheritance placed on the child objects.
     * @param {PSID} pSid A pointer to a 
     * SID  that identifies the user, group, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> to which the new ACE allows access.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AceFlags</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addaccessdeniedobjectace
     * @since windows5.1.2600
     */
    static AddAccessDeniedObjectAce(pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAccessDeniedObjectAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", ObjectTypeGuid, "ptr", InheritedObjectTypeGuid, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds one or more access control entries (ACEs) to a specified access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL. This function adds an ACE to this ACL.
     * @param {Integer} dwAceRevision Specifies the revision level of the ACL being modified. 
     * 
     * 
     * This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the ACL contains object-specific ACEs. This value must be compatible with the <b>AceType</b> field of all ACEs in <i>pAceList</i>. 
     *  Otherwise, the function will fail and set the last error to ERROR_INVALID_PARAMETER.
     * @param {Integer} dwStartingAceIndex Specifies the position in the ACL's list of ACEs at which to add new ACEs. A value of zero inserts the ACEs at the beginning of the list. A value of MAXDWORD appends the ACEs to the end of the list.
     * @param {Pointer} pAceList A pointer to a list of one or more ACEs to be added to the specified ACL. The ACEs in the list must be stored contiguously.
     * @param {Integer} nAceListLength Specifies the size, in bytes, of the input buffer pointed to by the <i>pAceList</i> parameter.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
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
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addace
     * @since windows5.1.2600
     */
    static AddAce(pAcl, dwAceRevision, dwStartingAceIndex, pAceList, nAceListLength) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAce", "ptr", pAcl, "uint", dwAceRevision, "uint", dwStartingAceIndex, "ptr", pAceList, "uint", nAceListLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a system-audit access control entry (ACE) to a system access control list (ACL). The access of a specified security identifier (SID) is audited.
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL. This function adds a system-audit ACE to this ACL. The ACE is in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_audit_ace">SYSTEM_AUDIT_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the ACL being modified. 
     * 
     * 
     * This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the ACL contains object-specific ACEs.
     * @param {Integer} dwAccessMask Specifies the mask of access rights to be audited for the specified SID.
     * @param {PSID} pSid A pointer to the 
     * SID representing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> whose access is being audited.
     * @param {BOOL} bAuditSuccess Specifies whether successful access attempts are to be audited. Set this flag to <b>TRUE</b> to enable auditing; otherwise, set it to <b>FALSE</b>.
     * @param {BOOL} bAuditFailure Specifies whether unsuccessful access attempts are to be audited. Set this flag to <b>TRUE</b> to enable auditing; otherwise, set it to <b>FALSE</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addauditaccessace
     * @since windows5.1.2600
     */
    static AddAuditAccessAce(pAcl, dwAceRevision, dwAccessMask, pSid, bAuditSuccess, bAuditFailure) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAuditAccessAce", "ptr", pAcl, "uint", dwAceRevision, "uint", dwAccessMask, "ptr", pSid, "ptr", bAuditSuccess, "ptr", bAuditFailure, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a system-audit access control entry (ACE) to the end of a system access control list (SACL).
     * @param {Pointer<ACL>} pAcl A pointer to a SACL. The <b>AddAuditAccessAceEx</b> function adds a system-audit ACE to this SACL. The ACE is in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_audit_ace">SYSTEM_AUDIT_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the SACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the SACL contains object-specific ACEs.
     * @param {Integer} AceFlags 
     * @param {Integer} dwAccessMask A set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format to specify the access rights that the new ACE audits for the specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @param {PSID} pSid A pointer to a 
     * SID that identifies the user, group, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> for which the new ACE audits access.
     * @param {BOOL} bAuditSuccess Specifies whether successful uses of the specified access rights cause the system to generate an audit record in the security event log. If this flag is <b>TRUE</b> or if the <i>AceFlags</i> parameter specifies the SUCCESSFUL_ACCESS_ACE_FLAG flag, the system records successful access attempts; otherwise, it does not.
     * @param {BOOL} bAuditFailure Specifies whether failed attempts to use the specified access rights cause the system to generate an audit record in the security event log. If this flag is <b>TRUE</b> or if the <i>AceFlags</i> parameter specifies the FAILED_ACCESS_ACE_FLAG flag, the system records failed access attempts; otherwise, it does not.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AceFlags</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addauditaccessaceex
     * @since windows5.1.2600
     */
    static AddAuditAccessAceEx(pAcl, dwAceRevision, AceFlags, dwAccessMask, pSid, bAuditSuccess, bAuditFailure) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAuditAccessAceEx", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", dwAccessMask, "ptr", pSid, "ptr", bAuditSuccess, "ptr", bAuditFailure, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a system-audit access control entry (ACE) to the end of a system access control list (SACL).
     * @param {Pointer<ACL>} pAcl A pointer to a SACL. The <b>AddAuditAccessObjectAce</b> function adds a system-audit ACE to the end of this SACL. The ACE is in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_alarm_object_ace">SYSTEM_AUDIT_OBJECT_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the SACL being modified. This value must be ACL_REVISION_DS. If the SACL's revision level is lower than ACL_REVISION_DS, the function changes it to ACL_REVISION_DS.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance and the type of access attempts to audit. The function sets these flags in the <b>AceFlags</b> member of the
     * @param {Integer} AccessMask An 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> that specifies the access rights that the new ACE audits for the specified <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @param {Pointer<Guid>} ObjectTypeGuid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object, property set, or property protected by the new ACE. If this parameter is <b>NULL</b>, the new ACE protects the object to which the ACL is assigned.
     * @param {Pointer<Guid>} InheritedObjectTypeGuid A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object that can inherit the new ACE. If this parameter is non-<b>NULL</b>, only the specified object type can inherit the ACE. If <b>NULL</b>, any type of child object can inherit the ACE. In either case, inheritance is also controlled by the value of the <i>AceFlags</i> parameter, as well as by any protection against inheritance placed on the child objects.
     * @param {PSID} pSid A pointer to a 
     * SID that identifies the user, group, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> for which the new ACE audits access.
     * @param {BOOL} bAuditSuccess Specifies whether successful uses of the specified access rights cause the system to generate an audit record in the security event log. If this flag is <b>TRUE</b> or if the <i>AceFlags</i> parameter specifies the SUCCESSFUL_ACCESS_ACE_FLAG flag, the system records successful access attempts; otherwise, it does not.
     * @param {BOOL} bAuditFailure Specifies whether failed attempts to use the specified access rights cause the system to generate an audit record in the security event log. If this flag is <b>TRUE</b> or if the <i>AceFlags</i> parameter specifies the FAILED_ACCESS_ACE_FLAG flag, the system records failed access attempts; otherwise, it does not.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>AceFlags</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified SID is not structurally valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified revision is not known or is incompatible with that of the ACL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addauditaccessobjectace
     * @since windows5.1.2600
     */
    static AddAuditAccessObjectAce(pAcl, dwAceRevision, AceFlags, AccessMask, ObjectTypeGuid, InheritedObjectTypeGuid, pSid, bAuditSuccess, bAuditFailure) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddAuditAccessObjectAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", ObjectTypeGuid, "ptr", InheritedObjectTypeGuid, "ptr", pSid, "ptr", bAuditSuccess, "ptr", bAuditFailure, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a SYSTEM_MANDATORY_LABEL_ACE access control entry (ACE) to the specified system access control list (SACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     *  SACL. This function adds a mandatory ACE to the end of this SACL. The ACE is in the form of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_mandatory_label_ace">SYSTEM_MANDATORY_LABEL_ACE</a> structure.
     * @param {Integer} dwAceRevision The revision level of the SACL being modified.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. This function sets these flags in the <b>AceFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure of the new ACE.
     * @param {Integer} MandatoryPolicy The access policy for principals with a mandatory integrity level lower than the object associated with the SACL that contains this ACE.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYSTEM_MANDATORY_LABEL_NO_WRITE_UP"></a><a id="system_mandatory_label_no_write_up"></a><dl>
     * <dt><b>SYSTEM_MANDATORY_LABEL_NO_WRITE_UP</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A principal with a lower mandatory level than the object cannot write to the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYSTEM_MANDATORY_LABEL_NO_READ_UP"></a><a id="system_mandatory_label_no_read_up"></a><dl>
     * <dt><b>SYSTEM_MANDATORY_LABEL_NO_READ_UP</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A principal with a lower mandatory level than the object cannot read the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP"></a><a id="system_mandatory_label_no_execute_up"></a><dl>
     * <dt><b>SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A principal with a lower mandatory level than the object cannot execute the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSID} pLabelSid A pointer to an SID that specifies the mandatory integrity level of the object associated with the SACL being appended.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALLOTTED_SPACE_EXCEEDED</b></dt>
     * <dt>0x540</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the <i>pAcl</i> buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addmandatoryace
     * @since windows6.0.6000
     */
    static AddMandatoryAce(pAcl, dwAceRevision, AceFlags, MandatoryPolicy, pLabelSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddMandatoryAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", MandatoryPolicy, "ptr", pLabelSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a SYSTEM_RESOURCE_ATTRIBUTE_ACEaccess control entry (ACE) to the end of a system access control list (SACL).
     * @param {Pointer<ACL>} pAcl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL). This function adds an ACE to this ACL. The value of this parameter cannot be <b>NULL</b>. The ACE is in the form of a  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_resource_attribute_ace">SYSTEM_RESOURCE_ATTRIBUTE_ACE</a> structure.
     * @param {Integer} dwAceRevision Specifies the revision level of the ACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the ACL contains object-specific ACEs.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. The function sets these flags in the <b>AceFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure of the new ACE.
     * 
     * For consistency with the Windows 8 Advanced File Permissions UI, applications should specify the CONTAINER_INHERIT_ACE and OBJECT_INHERIT_ACE flags in the <i>AceFlags</i> parameter.
     * @param {Integer} AccessMask Must be zero for Windows 8 and Windows Server 2012.
     * @param {PSID} pSid Must be the Everyone SID (S-1-1-0) for Windows 8 and Windows Server 2012.
     * @param {Pointer<CLAIM_SECURITY_ATTRIBUTES_INFORMATION>} pAttributeInfo Specifies the attribute information that will be appended after the SID in the ACE.
     * @param {Pointer<UInt32>} pReturnLength The size, in bytes, of the actual ACL buffer used. If the buffer specified by the <i>pAcl</i> parameter is not big enough, the value of this parameter is the total size required for the ACL buffer.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addresourceattributeace
     * @since windows8.0
     */
    static AddResourceAttributeAce(pAcl, dwAceRevision, AceFlags, AccessMask, pSid, pAttributeInfo, pReturnLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddResourceAttributeAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", pSid, "ptr", pAttributeInfo, "uint*", pReturnLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a SYSTEM_SCOPED_POLICY_ID_ACEaccess control entry (ACE) to the end of a system access control list (SACL).
     * @param {Pointer<ACL>} pAcl A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL). This function adds an ACE to this ACL. The value of this parameter cannot be <b>NULL</b>.
     * @param {Integer} dwAceRevision Specifies the revision level of the ACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the ACL contains object-specific ACEs.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. The function sets these flags in the <b>AceFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure of the new ACE.
     * 
     * For consistency with the Windows 8 Advanced File Permissions UI, applications should specify the CONTAINER_INHERIT_ACE and OBJECT_INHERIT_ACE flags in the <i>AceFlags</i> parameter.
     * @param {Integer} AccessMask Must be zero for Windows 8 and Windows Server 2012.
     * @param {PSID} pSid A pointer to the SID (S-1-17-*) that identifies the Central Access Policy to be associated with the resource.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addscopedpolicyidace
     * @since windows8.0
     */
    static AddScopedPolicyIDAce(pAcl, dwAceRevision, AceFlags, AccessMask, pSid) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddScopedPolicyIDAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables or disables groups already present in the specified access token. Access to TOKEN_ADJUST_GROUPS is required to enable or disable groups in an access token.
     * @param {HANDLE} TokenHandle A handle to the access token that contains the groups to be enabled or disabled. The handle must have TOKEN_ADJUST_GROUPS access to the token. If the <i>PreviousState</i> parameter is not <b>NULL</b>, the handle must also have TOKEN_QUERY access.
     * @param {BOOL} ResetToDefault Boolean value that indicates whether the groups are to be set to their default enabled and disabled states. If this value is <b>TRUE</b>, the groups are set to their default states and the <i>NewState</i> parameter is ignored. If this value is <b>FALSE</b>, the groups are set according to the information pointed to by the <i>NewState</i> parameter.
     * @param {Pointer<TOKEN_GROUPS>} NewState A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the groups to be enabled or disabled. If the <i>ResetToDefault</i> parameter is <b>FALSE</b>, the function sets each of the groups to the value of that group's SE_GROUP_ENABLED attribute in the <b>TOKEN_GROUPS</b> structure. If <i>ResetToDefault</i> is <b>TRUE</b>, this parameter is ignored.
     * @param {Integer} BufferLength The size, in bytes, of the buffer pointed to by the <i>PreviousState</i> parameter. This parameter can be zero if the <i>PreviousState</i> parameter is <b>NULL</b>.
     * @param {Pointer} PreviousState A pointer to a buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure containing the previous state of any groups the function modifies. That is, if a group has been modified by this function, the group and its previous state are contained in the <b>TOKEN_GROUPS</b> structure referenced by <i>PreviousState</i>. If the <b>GroupCount</b> member of <b>TOKEN_GROUPS</b> is zero, then no groups have been changed by this function. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If a buffer is specified but it does not contain enough space to receive the complete list of modified groups, no group states are changed and the function fails. In this case, the function sets the variable pointed to by the <i>ReturnLength</i> parameter to the number of bytes required to hold the complete list of modified groups.
     * @param {Pointer<UInt32>} ReturnLength A pointer to a variable that receives the actual number of bytes needed for the buffer pointed to by the <i>PreviousState</i> parameter. This parameter can be <b>NULL</b> and is ignored if <i>PreviousState</i> is <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-adjusttokengroups
     * @since windows5.1.2600
     */
    static AdjustTokenGroups(TokenHandle, ResetToDefault, NewState, BufferLength, PreviousState, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AdjustTokenGroups", "ptr", TokenHandle, "ptr", ResetToDefault, "ptr", NewState, "uint", BufferLength, "ptr", PreviousState, "uint*", ReturnLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables or disables privileges in the specified access token. Enabling or disabling privileges in an access token requires TOKEN_ADJUST_PRIVILEGES access.
     * @param {HANDLE} TokenHandle A handle to the access token that contains the privileges to be modified. The handle must have TOKEN_ADJUST_PRIVILEGES access to the token. If the <i>PreviousState</i> parameter is not <b>NULL</b>, the handle must also have TOKEN_QUERY access.
     * @param {BOOL} DisableAllPrivileges Specifies whether the function disables all of the token's privileges. If this value is <b>TRUE</b>, the function disables all privileges and ignores the <i>NewState</i> parameter. If it is <b>FALSE</b>, the function modifies privileges based on the information pointed to by the <i>NewState</i> parameter.
     * @param {Pointer<TOKEN_PRIVILEGES>} NewState A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that specifies an array of privileges and their attributes. If the <i>DisableAllPrivileges</i> parameter is <b>FALSE</b>, the  <b>AdjustTokenPrivileges</b>  function enables, disables, or removes these privileges for the token. The following table describes the action taken by the <b>AdjustTokenPrivileges</b> function, based on the privilege attribute.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_PRIVILEGE_ENABLED"></a><a id="se_privilege_enabled"></a><dl>
     * <dt><b>SE_PRIVILEGE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function enables the privilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_PRIVILEGE_REMOVED"></a><a id="se_privilege_removed"></a><dl>
     * <dt><b>SE_PRIVILEGE_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The privilege is removed from the list of privileges in the token. The other privileges in the list are reordered to remain contiguous.
     *            
     * 
     * SE_PRIVILEGE_REMOVED supersedes SE_PRIVILEGE_ENABLED.
     * 
     * Because the privilege has been removed from the token, attempts to reenable the privilege result in the warning ERROR_NOT_ALL_ASSIGNED as if the privilege had never existed.
     * 
     * Attempting to remove a privilege that does not exist in the token results in ERROR_NOT_ALL_ASSIGNED being returned.
     * 
     * Privilege checks for removed privileges result in STATUS_PRIVILEGE_NOT_HELD.  Failed privilege check auditing occurs as normal.
     * 
     * The removal of the privilege is irreversible, so the name of the removed privilege is not included in the <i>PreviousState</i> parameter after a call to <b>AdjustTokenPrivileges</b>.
     * 
     * <b>Windows XP with SP1:  </b>The function cannot remove privileges. This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="None"></a><a id="none"></a><a id="NONE"></a><dl>
     * <dt><b>None</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function disables the privilege.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>DisableAllPrivileges</i> is <b>TRUE</b>, the function ignores this parameter.
     * @param {Integer} BufferLength Specifies the size, in bytes, of the buffer pointed to by the <i>PreviousState</i> parameter. This parameter can be zero if the <i>PreviousState</i> parameter is <b>NULL</b>.
     * @param {Pointer} PreviousState A pointer to a buffer that the function fills with a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that contains the previous state of any privileges that the function modifies.  That is, if a privilege has been modified by this function, the privilege and its previous state are contained in the <b>TOKEN_PRIVILEGES</b> structure referenced by <i>PreviousState</i>. If the <b>PrivilegeCount</b> member of <b>TOKEN_PRIVILEGES</b> is zero, then no privileges have been changed by this function. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If you specify a buffer that is too small to receive the complete list of modified privileges, the function fails and does not adjust any privileges. In this case, the function sets the variable pointed to by the <i>ReturnLength</i> parameter to the number of bytes required to hold the complete list of modified privileges.
     * @param {Pointer<UInt32>} ReturnLength A pointer to a variable that receives the required size, in bytes, of the buffer pointed to by the <i>PreviousState</i> parameter. This parameter can be <b>NULL</b> if <i>PreviousState</i> is <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. To determine whether the function adjusted all of the specified privileges, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which returns one of the following values when the function succeeds:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function adjusted all specified privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ALL_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The token does not have one or more of the privileges specified in the <i>NewState</i> parameter. The function may succeed with this error value even if no privileges were adjusted. The <i>PreviousState</i> parameter indicates the privileges that were adjusted.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-adjusttokenprivileges
     * @since windows5.1.2600
     */
    static AdjustTokenPrivileges(TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AdjustTokenPrivileges", "ptr", TokenHandle, "ptr", DisableAllPrivileges, "ptr", NewState, "uint", BufferLength, "ptr", PreviousState, "uint*", ReturnLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates and initializes a security identifier (SID) with up to eight subauthorities.
     * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} pIdentifierAuthority A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_identifier_authority">SID_IDENTIFIER_AUTHORITY</a> structure. This structure provides the top-level identifier authority value to set in the SID.
     * @param {Integer} nSubAuthorityCount Specifies the number of subauthorities to place in the SID. This parameter also identifies how many of the subauthority parameters have meaningful values. This parameter must contain a value from 1 to 8. 
     * 
     * 
     * 
     * 
     * For example, a value of 3 indicates that the subauthority values specified by the <i>dwSubAuthority0</i>, <i>dwSubAuthority1</i>, and <i>dwSubAuthority2</i> parameters have meaningful values and to ignore the remainder.
     * @param {Integer} nSubAuthority0 Subauthority value to place in the SID.
     * @param {Integer} nSubAuthority1 Subauthority value to place in the SID.
     * @param {Integer} nSubAuthority2 Subauthority value to place in the SID.
     * @param {Integer} nSubAuthority3 Subauthority value to place in the SID.
     * @param {Integer} nSubAuthority4 Subauthority value to place in the SID.
     * @param {Integer} nSubAuthority5 Subauthority value to place in the SID.
     * @param {Integer} nSubAuthority6 Subauthority value to place in the SID.
     * @param {Integer} nSubAuthority7 Subauthority value to place in the SID.
     * @param {Pointer<PSID>} pSid A pointer to a variable that receives the pointer to the allocated and initialized 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-allocateandinitializesid
     * @since windows5.1.2600
     */
    static AllocateAndInitializeSid(pIdentifierAuthority, nSubAuthorityCount, nSubAuthority0, nSubAuthority1, nSubAuthority2, nSubAuthority3, nSubAuthority4, nSubAuthority5, nSubAuthority6, nSubAuthority7, pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AllocateAndInitializeSid", "ptr", pIdentifierAuthority, "char", nSubAuthorityCount, "uint", nSubAuthority0, "uint", nSubAuthority1, "uint", nSubAuthority2, "uint", nSubAuthority3, "uint", nSubAuthority4, "uint", nSubAuthority5, "uint", nSubAuthority6, "uint", nSubAuthority7, "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a locally unique identifier (LUID).
     * @param {Pointer<LUID>} Luid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure that receives the allocated LUID.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-allocatelocallyuniqueid
     * @since windows5.1.2600
     */
    static AllocateLocallyUniqueId(Luid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AllocateLocallyUniqueId", "ptr", Luid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Checks whether a set of requested access rights has been granted. The access rights are represented as bit flags in an access mask.
     * @param {Integer} GrantedAccess An access mask that specifies the access rights that have been granted.
     * @param {Integer} DesiredAccess An access mask that specifies the access rights that have been requested. This mask must have been mapped from generic to specific and standard access rights, usually by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function.
     * @returns {BOOL} If all requested access rights have been granted, the return value is nonzero.
     * 
     * If not all requested access rights have been granted, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-areallaccessesgranted
     * @since windows5.1.2600
     */
    static AreAllAccessesGranted(GrantedAccess, DesiredAccess) {
        result := DllCall("ADVAPI32.dll\AreAllAccessesGranted", "uint", GrantedAccess, "uint", DesiredAccess, "ptr")
        return result
    }

    /**
     * Tests whether any of a set of requested access rights has been granted. The access rights are represented as bit flags in an access mask.
     * @param {Integer} GrantedAccess Specifies the granted access mask.
     * @param {Integer} DesiredAccess Specifies the access mask to be requested. This mask must have been mapped from generic to specific and standard access rights, usually by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function.
     * @returns {BOOL} If any of the requested access rights have been granted, the return value is nonzero.
     * 
     * If none of the requested access rights have been granted, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-areanyaccessesgranted
     * @since windows5.1.2600
     */
    static AreAnyAccessesGranted(GrantedAccess, DesiredAccess) {
        result := DllCall("ADVAPI32.dll\AreAnyAccessesGranted", "uint", GrantedAccess, "uint", DesiredAccess, "ptr")
        return result
    }

    /**
     * Determines whether a specified security identifier (SID) is enabled in an access token.
     * @param {HANDLE} TokenHandle A handle to an access token. The handle must have TOKEN_QUERY access to the token. The token must be an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>. 
     * 
     * 
     * 
     * 
     * If <i>TokenHandle</i> is <b>NULL</b>, <b>CheckTokenMembership</b> uses the impersonation token of the calling thread. If the thread is not impersonating, the function duplicates the thread's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a> to create an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>.
     * @param {PSID} SidToCheck A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure. The <b>CheckTokenMembership</b> function checks for the presence of this SID in the user and group SIDs of the access token.
     * @param {Pointer<BOOL>} IsMember A pointer to a variable that receives the results of the check. If the SID is present and has the SE_GROUP_ENABLED attribute, <i>IsMember</i> returns <b>TRUE</b>; otherwise, it returns <b>FALSE</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-checktokenmembership
     * @since windows5.1.2600
     */
    static CheckTokenMembership(TokenHandle, SidToCheck, IsMember) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CheckTokenMembership", "ptr", TokenHandle, "ptr", SidToCheck, "ptr", IsMember, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Checks the capabilities of a given token.
     * @param {HANDLE} TokenHandle A handle to an access token. The handle must have TOKEN_QUERY access to the token. The token must be an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>. 
     *       
     * 
     * If <i>TokenHandle</i> is <b>NULL</b>, <b>CheckTokenCapability</b> uses the impersonation token of the calling thread. If the thread is not impersonating, the function duplicates the thread's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a> to create an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>.
     * @param {PSID} CapabilitySidToCheck A pointer to a capability <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure. The <b>CheckTokenCapability</b> function checks the capabilities of this access token.
     * @param {Pointer<BOOL>} HasCapability Receives the results of the check. If the access token has the capability, it returns <b>TRUE</b>, otherwise, it returns <b>FALSE</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-checktokencapability
     * @since windows8.0
     */
    static CheckTokenCapability(TokenHandle, CapabilitySidToCheck, HasCapability) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CheckTokenCapability", "ptr", TokenHandle, "ptr", CapabilitySidToCheck, "ptr", HasCapability, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} Acl 
     * @param {Integer} StartingAceIndex 
     * @param {Pointer<Void>} AppContainerAce 
     * @param {Pointer<UInt32>} AppContainerAceIndex 
     * @returns {BOOL} 
     */
    static GetAppContainerAce(Acl, StartingAceIndex, AppContainerAce, AppContainerAceIndex) {
        result := DllCall("KERNEL32.dll\GetAppContainerAce", "ptr", Acl, "uint", StartingAceIndex, "ptr", AppContainerAce, "uint*", AppContainerAceIndex, "ptr")
        return result
    }

    /**
     * Determines whether the specified SID is enabled in the specified token.
     * @param {HANDLE} TokenHandle A handle to an access token. If present, this token is checked for the SID. If not present, then the current effective token is used. This must be an impersonation token.
     * @param {PSID} SidToCheck A pointer to a SID structure. The function checks for the presence of this SID in the presence of the token.
     * @param {Integer} Flags Flags that affect the behavior of the function. Currently the only valid flag is CTMF_INCLUDE_APPCONTAINER which allows app containers to pass the call as long as the other requirements of the token are met, such as the group specified is present and enabled.
     * @param {Pointer<BOOL>} IsMember <b>TRUE</b> if the SID is enabled in the token; otherwise, <b>FALSE</b>.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-checktokenmembershipex
     * @since windows8.0
     */
    static CheckTokenMembershipEx(TokenHandle, SidToCheck, Flags, IsMember) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CheckTokenMembershipEx", "ptr", TokenHandle, "ptr", SidToCheck, "uint", Flags, "ptr", IsMember, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a security descriptor and its access control lists (ACLs) to a format that supports automatic propagation of inheritable access control entries (ACEs).
     * @param {PSECURITY_DESCRIPTOR} ParentDescriptor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> for the parent container of the object. If there is no parent container, this parameter is <b>NULL</b>.
     * @param {PSECURITY_DESCRIPTOR} CurrentSecurityDescriptor A pointer to the current security descriptor of the object.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewSecurityDescriptor A pointer to a variable that receives a pointer to the newly allocated <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative security descriptor</a>. It is the caller's responsibility to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-destroyprivateobjectsecurity">DestroyPrivateObjectSecurity</a> function to free this security descriptor.
     * @param {Pointer<Guid>} ObjectType A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object associated with the <i>CurrentSecurityDescriptor</i> parameter. If the object does not have a GUID, this parameter must be <b>NULL</b>.
     * @param {BOOLEAN} IsDirectoryObject If <b>TRUE</b>, the new object is a container and can contain other objects. If <b>FALSE</b>, the new object is not a container.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure that specifies the mapping from each generic right to specific rights for the object.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-converttoautoinheritprivateobjectsecurity
     * @since windows5.1.2600
     */
    static ConvertToAutoInheritPrivateObjectSecurity(ParentDescriptor, CurrentSecurityDescriptor, NewSecurityDescriptor, ObjectType, IsDirectoryObject, GenericMapping) {
        ParentDescriptor := ParentDescriptor is Win32Handle ? NumGet(ParentDescriptor, "ptr") : ParentDescriptor
        CurrentSecurityDescriptor := CurrentSecurityDescriptor is Win32Handle ? NumGet(CurrentSecurityDescriptor, "ptr") : CurrentSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ConvertToAutoInheritPrivateObjectSecurity", "ptr", ParentDescriptor, "ptr", CurrentSecurityDescriptor, "ptr", NewSecurityDescriptor, "ptr", ObjectType, "ptr", IsDirectoryObject, "ptr", GenericMapping, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a security identifier (SID) to a buffer.
     * @param {Integer} nDestinationSidLength Specifies the length, in bytes, of the buffer receiving the copy of the SID.
     * @param {Pointer} pDestinationSid A pointer to a buffer that receives a copy of the source 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * @param {PSID} pSourceSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that the function copies to the buffer pointed to by the <i>pDestinationSid</i> parameter.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-copysid
     * @since windows5.1.2600
     */
    static CopySid(nDestinationSidLength, pDestinationSid, pSourceSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CopySid", "uint", nDestinationSidLength, "ptr", pDestinationSid, "ptr", pSourceSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates and initializes a self-relative security descriptor for a new private object. A protected server calls this function when it creates a new private object.
     * @param {PSECURITY_DESCRIPTOR} ParentDescriptor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> for the parent directory in which a new object is being created. If there is no parent directory, this parameter can be <b>NULL</b>.
     * @param {PSECURITY_DESCRIPTOR} CreatorDescriptor A pointer to a security descriptor provided by the creator of the object. If the object's creator does not explicitly pass security information for the new object, this parameter is intended to be <b>NULL</b>.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewDescriptor A pointer to a variable that receives a pointer to the newly allocated self-relative security descriptor. The caller must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-destroyprivateobjectsecurity">DestroyPrivateObjectSecurity</a> function to free this security descriptor.
     * @param {BOOL} IsDirectoryObject Specifies whether the new object is a container. A value of <b>TRUE</b> indicates the object contains other objects, such as a directory.
     * @param {HANDLE} Token A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> for the client <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> on whose behalf the object is being created. If this is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>, it must be at SecurityIdentification level or higher. For a full description of the SecurityIdentification impersonation level, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumerated type. 
     * 
     * 
     * 
     * 
     * A client token is used to retrieve default security information for the new object, such as its default owner, primary group, and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a>. The token must be open for <b>TOKEN_QUERY</b> access.
     * 
     * If all of the following conditions are true, then the handle must be opened for <b>TOKEN_DUPLICATE</b> access in addition to <b>TOKEN_QUERY</b> access.
     * 
     * <ul>
     * <li>The token handle refers to a primary token.</li>
     * <li>The security descriptor of the token contains one or more ACEs with the <b>OwnerRights</b> SID.</li>
     * <li>A security descriptor is specified for the <i>CreatorDescriptor</i> parameter.</li>
     * <li>The caller of this function does not set the <b>SEF_AVOID_OWNER_RESTRICTION</b> flag in the <i>AutoInheritFlags</i> parameter.</li>
     * </ul>
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure that specifies the mapping from each generic right to specific rights for the object.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-createprivateobjectsecurity
     * @since windows5.1.2600
     */
    static CreatePrivateObjectSecurity(ParentDescriptor, CreatorDescriptor, NewDescriptor, IsDirectoryObject, Token, GenericMapping) {
        ParentDescriptor := ParentDescriptor is Win32Handle ? NumGet(ParentDescriptor, "ptr") : ParentDescriptor
        CreatorDescriptor := CreatorDescriptor is Win32Handle ? NumGet(CreatorDescriptor, "ptr") : CreatorDescriptor
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreatePrivateObjectSecurity", "ptr", ParentDescriptor, "ptr", CreatorDescriptor, "ptr", NewDescriptor, "ptr", IsDirectoryObject, "ptr", Token, "ptr", GenericMapping, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates and initializes a self-relative security descriptor for a new private object created by the resource manager calling this function.
     * @param {PSECURITY_DESCRIPTOR} ParentDescriptor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> for the parent container of the object. If there is no parent container, this parameter is <b>NULL</b>.
     * @param {PSECURITY_DESCRIPTOR} CreatorDescriptor A pointer to a security descriptor provided by the creator of the object. If the object's creator does not explicitly pass security information for the new object, this parameter can be <b>NULL</b>. Alternatively, this parameter can point to a default security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewDescriptor A pointer to a variable that receives a pointer to the newly allocated self-relative security descriptor. When you have finished using the security descriptor, free it by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-destroyprivateobjectsecurity">DestroyPrivateObjectSecurity</a> function.
     * @param {Pointer<Guid>} ObjectType A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object associated with <i>NewDescriptor</i>. If the object does not have a GUID, set <i>ObjectType</i> to <b>NULL</b>.
     * @param {BOOL} IsContainerObject Specifies whether the new object can contain other objects. A value of <b>TRUE</b> indicates that the new object is a container. A value of <b>FALSE</b> indicates that the new object is not a container.
     * @param {Integer} AutoInheritFlags 
     * @param {HANDLE} Token A handle to the access token for the client process on whose behalf the object is being created. If this is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>, it must be at SecurityIdentification level or higher. For a full description of the SecurityIdentification impersonation level, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumerated type. 
     * 
     * 
     * 
     * 
     * The client token contains default security information, such as the default owner, primary group, and DACL. The function uses these defaults if the information is not in the input security descriptors. The token must be open for <b>TOKEN_QUERY</b> access.
     * 
     * If all of the following conditions are true, then the handle must be opened for <b>TOKEN_DUPLICATE</b> access in addition to <b>TOKEN_QUERY</b> access.
     * 
     * <ul>
     * <li>The token handle refers to a primary token.</li>
     * <li>The security descriptor of the token contains one or more ACEs with the <b>OwnerRights</b> SID.</li>
     * <li>A security descriptor is specified for the <i>CreatorDescriptor</i> parameter.</li>
     * <li>The caller of this function does not set the <b>SEF_AVOID_OWNER_RESTRICTION</b> flag in the <i>AutoInheritFlags</i> parameter.</li>
     * </ul>
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure that specifies the mapping from each generic right to specific rights for the object.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Some of the extended error codes and their meanings are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot retrieve an owner for the new security descriptor or the SID cannot be assigned as an owner. This occurs when validating the owner SID against the passed-in token.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PRIMARY_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot retrieve a primary group for the new security descriptor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received <b>NULL</b> instead of a token for owner validation or privilege checking.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A SACL is being set, SEF_AVOID_PRIVILEGE_CHECK was not passed in, and the token passed in did not have SE_SECURITY_NAME enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-createprivateobjectsecurityex
     * @since windows5.1.2600
     */
    static CreatePrivateObjectSecurityEx(ParentDescriptor, CreatorDescriptor, NewDescriptor, ObjectType, IsContainerObject, AutoInheritFlags, Token, GenericMapping) {
        ParentDescriptor := ParentDescriptor is Win32Handle ? NumGet(ParentDescriptor, "ptr") : ParentDescriptor
        CreatorDescriptor := CreatorDescriptor is Win32Handle ? NumGet(CreatorDescriptor, "ptr") : CreatorDescriptor
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreatePrivateObjectSecurityEx", "ptr", ParentDescriptor, "ptr", CreatorDescriptor, "ptr", NewDescriptor, "ptr", ObjectType, "ptr", IsContainerObject, "uint", AutoInheritFlags, "ptr", Token, "ptr", GenericMapping, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates and initializes a self-relative security descriptor for a new private object created by the resource manager calling this function.
     * @param {PSECURITY_DESCRIPTOR} ParentDescriptor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>for the parent container of the object. If there is no parent container, this parameter is <b>NULL</b>.
     * @param {PSECURITY_DESCRIPTOR} CreatorDescriptor A pointer to a security descriptor provided by the creator of the object. If the object's creator does not explicitly pass security information for the new object, this parameter can be <b>NULL</b>. Alternatively, this parameter can point to a default security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewDescriptor A pointer to a variable to receive a pointer to the newly allocated self-relative security descriptor. When you have finished using the security descriptor, free it by calling the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-destroyprivateobjectsecurity">DestroyPrivateObjectSecurity</a> function.
     * @param {Pointer<Guid>} ObjectTypes An array of pointers to <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structures that identify the object types or classes of the object associated with <i>NewDescriptor</i>. For Active Directory objects, this array contains pointers to the class GUIDs of the object's structural class and all attached auxiliary classes. Set <i>ObjectTypes</i> to <b>NULL</b> if the object does not have a GUID.
     * @param {Integer} GuidCount The number of GUIDs present in the <i>ObjectTypes</i> parameter.
     * @param {BOOL} IsContainerObject Specifies whether the new object can contain other objects. A value of <b>TRUE</b> indicates that the new object is a container. A value of <b>FALSE</b> indicates that the new object is not a container.
     * @param {Integer} AutoInheritFlags 
     * @param {HANDLE} Token A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> for the client <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> on whose behalf the object is being created. If this is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>, it must be at SecurityIdentification level or higher. For a full description of the SecurityIdentification impersonation level, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumerated type. 
     * 
     * 
     * 
     * 
     * The client token contains default security information, such as the default owner, primary group, and DACL. This function uses these defaults if the information is not in the input security descriptors. The token must be open for <b>TOKEN_QUERY</b> access.
     * 
     * If all of the following conditions are true, then the handle must be opened for <b>TOKEN_DUPLICATE</b> access in addition to <b>TOKEN_QUERY</b> access.
     * 
     * <ul>
     * <li>The token handle refers to a primary token.</li>
     * <li>The security descriptor of the token contains one or more ACEs with the <b>OwnerRights</b> SID.</li>
     * <li>A security descriptor is specified for the <i>CreatorDescriptor</i> parameter.</li>
     * <li>The caller of this function does not set the <b>SEF_AVOID_OWNER_RESTRICTION</b> flag in the <i>AutoInheritFlags</i> parameter.</li>
     * </ul>
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure that specifies the mapping from each generic right to specific rights for the object.
     * @returns {BOOL} If the function succeeds, the function returns a nonzero value. 
     * 
     * If the function fails, it returns zero. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information. Some extended error codes and their meanings are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PRIMARY_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot retrieve a primary group for the new security descriptor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot retrieve an owner for the new security descriptor or the <a href="/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) cannot be assigned as an owner. This occurs when validating the owner SID against the passed-in token.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received <b>NULL</b> instead of a token for owner validation or <a href="/windows/desktop/SecGloss/p-gly">privilege</a> checking.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A SACL is being set, SEF_AVOID_PRIVILEGE_CHECK was not passed in, and the token passed in did not have SE_SECURITY_NAME enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-createprivateobjectsecuritywithmultipleinheritance
     * @since windows5.1.2600
     */
    static CreatePrivateObjectSecurityWithMultipleInheritance(ParentDescriptor, CreatorDescriptor, NewDescriptor, ObjectTypes, GuidCount, IsContainerObject, AutoInheritFlags, Token, GenericMapping) {
        ParentDescriptor := ParentDescriptor is Win32Handle ? NumGet(ParentDescriptor, "ptr") : ParentDescriptor
        CreatorDescriptor := CreatorDescriptor is Win32Handle ? NumGet(CreatorDescriptor, "ptr") : CreatorDescriptor
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreatePrivateObjectSecurityWithMultipleInheritance", "ptr", ParentDescriptor, "ptr", CreatorDescriptor, "ptr", NewDescriptor, "ptr", ObjectTypes, "uint", GuidCount, "ptr", IsContainerObject, "uint", AutoInheritFlags, "ptr", Token, "ptr", GenericMapping, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new access token that is a restricted version of an existing access token. The restricted token can have disabled security identifiers (SIDs), deleted privileges, and a list of restricting SIDs.
     * @param {HANDLE} ExistingTokenHandle A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>. The token can also be a restricted token. The handle must have TOKEN_DUPLICATE access to the token.
     * @param {Integer} Flags 
     * @param {Integer} DisableSidCount Specifies the number of entries in the <i>SidsToDisable</i> array.
     * @param {Pointer<SID_AND_ATTRIBUTES>} SidsToDisable A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures that specify the deny-only SIDs in the restricted token. The system uses a deny-only SID to deny access to a securable object. The absence of a deny-only SID does not allow access. 
     * 
     * 
     * 
     * 
     * Disabling a SID turns on SE_GROUP_USE_FOR_DENY_ONLY and turns off SE_GROUP_ENABLED and SE_GROUP_ENABLED_BY_DEFAULT. All other attributes are ignored.
     * 
     * Deny-only attributes apply to any combination of an existing token's SIDs, including the user SID and group SIDs that have the SE_GROUP_MANDATORY attribute. To get the SIDs associated with the existing token, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> function with the TokenUser and TokenGroups flags. The function ignores any SIDs in the array that are not also found in the existing token.
     * 
     * The function ignores the <b>Attributes</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure.
     * 
     * This parameter can be <b>NULL</b> if no SIDs are to be disabled.
     * @param {Integer} DeletePrivilegeCount Specifies the number of entries in the <i>PrivilegesToDelete</i> array.
     * @param {Pointer<LUID_AND_ATTRIBUTES>} PrivilegesToDelete A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid_and_attributes">LUID_AND_ATTRIBUTES</a> structures that specify the privileges to delete in the restricted token. 
     * 
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> function can be used with the TokenPrivileges flag to retrieve the privileges held by the existing token. The function ignores any privileges in the array that are not held by the existing token.
     * 
     * The function ignores the <b>Attributes</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid_and_attributes">LUID_AND_ATTRIBUTES</a> structures.
     * 
     * This parameter can be <b>NULL</b> if you do not want to delete any privileges.
     * 
     * If the calling program passes too many privileges in this array, <b>CreateRestrictedToken</b> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} RestrictedSidCount Specifies the number of entries in the <i>SidsToRestrict</i> array.
     * @param {Pointer<SID_AND_ATTRIBUTES>} SidsToRestrict A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures that specify a list of restricting SIDs for the new token. If the existing token is a restricted token, the list of restricting SIDs for the new token is the intersection of this array and the list of restricting SIDs for the existing token. No check is performed to remove duplicate SIDs that were placed on the <i>SidsToRestrict</i> parameter. Duplicate SIDs allow a restricted token to have redundant information in the restricting SID list. 
     * 
     * 
     * 
     * 
     * The <b>Attributes</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure must be zero. Restricting SIDs are always enabled for access checks.
     * 
     * This parameter can be <b>NULL</b> if you do not want to specify any restricting SIDs.
     * @param {Pointer<HANDLE>} NewTokenHandle A pointer to a variable that receives a handle to the new restricted token. This handle has the same access rights as <i>ExistingTokenHandle</i>. The new token is the same type, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation</a>, as the existing token. The handle returned in <i>NewTokenHandle</i> can be duplicated.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-createrestrictedtoken
     * @since windows5.1.2600
     */
    static CreateRestrictedToken(ExistingTokenHandle, Flags, DisableSidCount, SidsToDisable, DeletePrivilegeCount, PrivilegesToDelete, RestrictedSidCount, SidsToRestrict, NewTokenHandle) {
        ExistingTokenHandle := ExistingTokenHandle is Win32Handle ? NumGet(ExistingTokenHandle, "ptr") : ExistingTokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateRestrictedToken", "ptr", ExistingTokenHandle, "uint", Flags, "uint", DisableSidCount, "ptr", SidsToDisable, "uint", DeletePrivilegeCount, "ptr", PrivilegesToDelete, "uint", RestrictedSidCount, "ptr", SidsToRestrict, "ptr", NewTokenHandle, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a SID for predefined aliases.
     * @param {Integer} WellKnownSidType Member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-well_known_sid_type">WELL_KNOWN_SID_TYPE</a> enumeration that specifies what the SID will identify.
     * @param {PSID} DomainSid A pointer to a SID that identifies the domain to use when creating the SID. Pass <b>NULL</b> to use the local computer.
     * @param {Pointer} pSid A pointer to memory where <b>CreateWellKnownSid</b> will store the new SID.
     * @param {Pointer<UInt32>} cbSid A pointer to a <b>DWORD</b> that contains the number of bytes available at <i>pSid</i>. The <b>CreateWellKnownSid</b> function stores the number of bytes actually used at this location.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-createwellknownsid
     * @since windows5.1.2600
     */
    static CreateWellKnownSid(WellKnownSidType, DomainSid, pSid, cbSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateWellKnownSid", "int", WellKnownSidType, "ptr", DomainSid, "ptr", pSid, "uint*", cbSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether two SIDs are from the same domain.
     * @param {PSID} pSid1 A pointer to one of the two SIDs to compare. This SID must be either an account domain SID or a BUILTIN SID.
     * @param {PSID} pSid2 A pointer to one of the two SIDs to compare. This SID must be either an account domain SID or a BUILTIN SID.
     * @param {Pointer<BOOL>} pfEqual A pointer to a BOOL that <b>EqualDomainSid</b> sets to <b>TRUE</b> if the domains of the two SIDs are equal or <b>FALSE</b> if they are not equal. This value cannot be <b>NULL</b>.
     * @returns {BOOL} If both SIDs are  account domain SIDs and/or BUILTIN SIDs, the return value is nonzero. In addition, *<i>pfEqual</i> is set to <b>TRUE</b> if the domains of the two SIDs are equal; otherwise  *<i>pfEqual</i> is set to <b>FALSE</b>.
     * 
     * If one or more of the SIDS is neither an account domain SID nor a BUILTIN SID, then the return value is <b>FALSE</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>GetLastError</b> returns ERROR_NON_DOMAIN_SID if either SID is not an account domain SID or BUILTIN SID.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-equaldomainsid
     * @since windows5.1.2600
     */
    static EqualDomainSid(pSid1, pSid2, pfEqual) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EqualDomainSid", "ptr", pSid1, "ptr", pSid2, "ptr", pfEqual, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes an access control entry (ACE) from an access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL. The ACE specified by the <i>dwAceIndex</i> parameter is removed from this ACL.
     * @param {Integer} dwAceIndex The ACE to delete. A value of zero corresponds to the first ACE in the ACL, a value of one to the second ACE, and so on.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-deleteace
     * @since windows5.1.2600
     */
    static DeleteAce(pAcl, dwAceIndex) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DeleteAce", "ptr", pAcl, "uint", dwAceIndex, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a private object's security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectDescriptor A pointer to a pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure to be deleted. This security descriptor must have been created by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createprivateobjectsecurity">CreatePrivateObjectSecurity</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-destroyprivateobjectsecurity
     * @since windows5.1.2600
     */
    static DestroyPrivateObjectSecurity(ObjectDescriptor) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DestroyPrivateObjectSecurity", "ptr", ObjectDescriptor, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new access token that duplicates one already in existence.
     * @param {HANDLE} ExistingTokenHandle A handle to an access token opened with TOKEN_DUPLICATE access.
     * @param {Integer} ImpersonationLevel Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumerated type that supplies the impersonation level of the new token.
     * @param {Pointer<HANDLE>} DuplicateTokenHandle A pointer to a variable that receives a handle to the duplicate token. This handle has TOKEN_IMPERSONATE and TOKEN_QUERY access to the new token.
     * 
     * When you have finished using the new token, call the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the token handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-duplicatetoken
     * @since windows5.1.2600
     */
    static DuplicateToken(ExistingTokenHandle, ImpersonationLevel, DuplicateTokenHandle) {
        ExistingTokenHandle := ExistingTokenHandle is Win32Handle ? NumGet(ExistingTokenHandle, "ptr") : ExistingTokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DuplicateToken", "ptr", ExistingTokenHandle, "int", ImpersonationLevel, "ptr", DuplicateTokenHandle, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new access token that duplicates an existing token. This function can create either a primary token or an impersonation token.
     * @param {HANDLE} hExistingToken A handle to an access token opened with TOKEN_DUPLICATE access.
     * @param {Integer} dwDesiredAccess Specifies the requested access rights for the new token. The <b>DuplicateTokenEx</b> function compares the requested access rights with the existing token's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) to determine which rights are granted or denied. To request the same access rights as the existing token, specify zero. To request all access rights that are valid for the caller, specify MAXIMUM_ALLOWED. 
     * 
     * 
     * 
     * 
     * For a list of access rights for access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpTokenAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> for the new token and determines whether child processes can inherit the token. If <i>lpTokenAttributes</i> is <b>NULL</b>, the token gets a default security descriptor and the handle cannot be inherited. If the security descriptor contains a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL), the token gets ACCESS_SYSTEM_SECURITY access right, even if it was not requested in <i>dwDesiredAccess</i>.
     * 
     * To set the owner in the security descriptor for the new token, the caller's process token must have the <b>SE_RESTORE_NAME</b> privilege set.
     * @param {Integer} ImpersonationLevel Specifies a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumeration that indicates the impersonation level of the new token.
     * @param {Integer} TokenType 
     * @param {Pointer<HANDLE>} phNewToken A pointer to a <b>HANDLE</b> variable that receives the new token.
     * 
     * When you have finished using the new token, call the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the token handle.
     * @returns {BOOL} If the function succeeds, the function returns a nonzero value.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-duplicatetokenex
     * @since windows5.1.2600
     */
    static DuplicateTokenEx(hExistingToken, dwDesiredAccess, lpTokenAttributes, ImpersonationLevel, TokenType, phNewToken) {
        hExistingToken := hExistingToken is Win32Handle ? NumGet(hExistingToken, "ptr") : hExistingToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DuplicateTokenEx", "ptr", hExistingToken, "uint", dwDesiredAccess, "ptr", lpTokenAttributes, "int", ImpersonationLevel, "int", TokenType, "ptr", phNewToken, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Tests two security-identifier (SID) prefix values for equality. A SID prefix is the entire SID except for the last subauthority value.
     * @param {PSID} pSid1 A pointer to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to compare. This structure is assumed to be valid.
     * @param {PSID} pSid2 A pointer to the second <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to compare. This structure is assumed to be valid.
     * @returns {BOOL} If the SID prefixes are equal, the return value is nonzero.
     * 
     * If the SID prefixes are not equal, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-equalprefixsid
     * @since windows5.1.2600
     */
    static EqualPrefixSid(pSid1, pSid2) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EqualPrefixSid", "ptr", pSid1, "ptr", pSid2, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Tests two security identifier (SID) values for equality. Two SIDs must match exactly to be considered equal.
     * @param {PSID} pSid1 A pointer to the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to compare. This structure is assumed to be valid.
     * @param {PSID} pSid2 A pointer to the second <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to compare. This structure is assumed to be valid.
     * @returns {BOOL} If the 
     * <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures are equal, the return value is nonzero.
     * 
     * If the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures are not equal, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If either <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid, the return value is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-equalsid
     * @since windows5.1.2600
     */
    static EqualSid(pSid1, pSid2) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EqualSid", "ptr", pSid1, "ptr", pSid2, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a pointer to the first free byte in an access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL.
     * @param {Pointer<Void>} pAce The address of a pointer to the first free position in the ACL created when the function returns. If the ACL is not valid, this parameter is <b>NULL</b>. If the ACL is full, this parameter points to the byte immediately following the ACL.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-findfirstfreeace
     * @since windows5.1.2600
     */
    static FindFirstFreeAce(pAcl, pAce) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\FindFirstFreeAce", "ptr", pAcl, "ptr", pAce, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees a security identifier (SID) previously allocated by using the AllocateAndInitializeSid function.
     * @param {PSID} pSid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to free.
     * @returns {Pointer<Void>} If the function succeeds, the function returns <b>NULL</b>.
     * 
     * If the function fails, it returns a pointer to the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure represented by the <i>pSid</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-freesid
     * @since windows5.1.2600
     */
    static FreeSid(pSid) {
        result := DllCall("ADVAPI32.dll\FreeSid", "ptr", pSid, "ptr")
        return result
    }

    /**
     * Obtains a pointer to an access control entry (ACE) in an access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL that contains the ACE to be retrieved.
     * @param {Integer} dwAceIndex The index of the ACE to be retrieved. A value of zero corresponds to the first ACE in the ACL, a value of one to the second ACE, and so on.
     * @param {Pointer<Void>} pAce A pointer to a pointer that the function sets to the address of the ACE.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getace
     * @since windows5.1.2600
     */
    static GetAce(pAcl, dwAceIndex, pAce) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetAce", "ptr", pAcl, "uint", dwAceIndex, "ptr", pAce, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about an access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL. The function retrieves information about this ACL. If a null value is passed, the function causes an access violation.
     * @param {Pointer} pAclInformation A pointer to a buffer to receive the requested information. The structure that is placed into the buffer depends on the information class requested in the <i>dwAclInformationClass</i> parameter.
     * @param {Integer} nAclInformationLength The size, in bytes, of the buffer pointed to by the <i>pAclInformation</i> parameter.
     * @param {Integer} dwAclInformationClass A value of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-acl_information_class">ACL_INFORMATION_CLASS</a> enumeration that indicates the class of information requested. This parameter can be one of two values from this enumeration:
     * 
     * <ul>
     * <li>If the value is <b>AclRevisionInformation</b>, the function fills the buffer pointed to by the <i>pAclInformation</i> parameter with an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_revision_information">ACL_REVISION_INFORMATION</a> structure.</li>
     * <li>If the value is <b>AclSizeInformation</b>, the function fills the buffer pointed to by the <i>pAclInformation</i> parameter with an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_size_information">ACL_SIZE_INFORMATION</a> structure.</li>
     * </ul>
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getaclinformation
     * @since windows5.1.2600
     */
    static GetAclInformation(pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetAclInformation", "ptr", pAcl, "ptr", pAclInformation, "uint", nAclInformationLength, "int", dwAclInformationClass, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Obtains specified information about the security of a file or directory. The information obtained is constrained by the caller's access rights and privileges.
     * @param {PWSTR} lpFileName A pointer to a null-terminated string that specifies the file or directory for which security information is retrieved.
     * @param {Integer} RequestedInformation A 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that identifies the security information being requested.
     * @param {Pointer} pSecurityDescriptor A pointer to a buffer that receives a copy of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the object specified by the <i>lpFileName</i> parameter. The calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> must have permission to view the specified aspects of the object's security status. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is returned in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative security descriptor</a> format.
     * @param {Integer} nLength Specifies the size, in bytes, of the buffer pointed to by the <i>pSecurityDescriptor</i> parameter.
     * @param {Pointer<UInt32>} lpnLengthNeeded A pointer to the variable that receives the number of bytes necessary to store the complete <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>. If the returned number of bytes is less than or equal to <i>nLength</i>, the entire security descriptor is returned in the output buffer; otherwise, none of the descriptor is returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getfilesecurityw
     */
    static GetFileSecurityW(lpFileName, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("ADVAPI32.dll\GetFileSecurityW", "ptr", lpFileName, "uint", RequestedInformation, "ptr", pSecurityDescriptor, "uint", nLength, "uint*", lpnLengthNeeded, "ptr")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor that protects a kernel object.
     * @param {HANDLE} Handle A handle to a kernel object.
     * @param {Integer} RequestedInformation Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that identifies the security information being requested.
     * @param {Pointer} pSecurityDescriptor A pointer to a buffer the function fills with a copy of the security descriptor of the specified object. The calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> must have the right to view the specified aspects of the object's security status. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is returned in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> format.
     * @param {Integer} nLength Specifies the size, in bytes, of the buffer pointed to by the <i>pSecurityDescriptor</i> parameter.
     * @param {Pointer<UInt32>} lpnLengthNeeded A pointer to a variable that receives the number of bytes required for the buffer pointed to by the <i>pSecurityDescriptor</i> parameter. If this variable's value is greater than the value of the <i>nLength</i> parameter when the function returns, none of the security descriptor is copied to the buffer.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getkernelobjectsecurity
     * @since windows5.1.2600
     */
    static GetKernelObjectSecurity(Handle, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetKernelObjectSecurity", "ptr", Handle, "uint", RequestedInformation, "ptr", pSecurityDescriptor, "uint", nLength, "uint*", lpnLengthNeeded, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the length, in bytes, of a valid security identifier (SID).
     * @param {PSID} pSid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure whose length is returned. The structure is assumed to be valid.
     * @returns {Integer} If the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is valid, the return value is the length, in bytes, of the <b>SID</b> structure.
     * 
     * If the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid, the return value is undefined. Before calling <b>GetLengthSid</b>, pass the SID to the 
     * <a href="/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsid">IsValidSid</a> function to verify that the SID is valid.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getlengthsid
     * @since windows5.1.2600
     */
    static GetLengthSid(pSid) {
        result := DllCall("ADVAPI32.dll\GetLengthSid", "ptr", pSid, "uint")
        return result
    }

    /**
     * Retrieves information from a private object's security descriptor.
     * @param {PSECURITY_DESCRIPTOR} ObjectDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure. This is the security descriptor to be queried.
     * @param {Integer} SecurityInformation A set of bit flags that indicate the parts of the security descriptor to retrieve. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer} ResultantDescriptor A pointer to a buffer that receives a copy of the requested information from the specified security descriptor. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is returned in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> format.
     * @param {Integer} DescriptorLength Specifies the size, in bytes, of the buffer pointed to by the <i>ResultantDescriptor</i> parameter.
     * @param {Pointer<UInt32>} ReturnLength A pointer to a variable the function sets to zero if the descriptor is copied successfully. If the buffer is too small for the security descriptor, this variable receives the number of bytes required. If this variable's value is greater than the value of the <i>DescriptorLength</i> parameter when the function returns, the function returns <b>FALSE</b> and none of the security descriptor is copied to the buffer.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getprivateobjectsecurity
     * @since windows5.1.2600
     */
    static GetPrivateObjectSecurity(ObjectDescriptor, SecurityInformation, ResultantDescriptor, DescriptorLength, ReturnLength) {
        ObjectDescriptor := ObjectDescriptor is Win32Handle ? NumGet(ObjectDescriptor, "ptr") : ObjectDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetPrivateObjectSecurity", "ptr", ObjectDescriptor, "uint", SecurityInformation, "ptr", ResultantDescriptor, "uint", DescriptorLength, "uint*", ReturnLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a security descriptor control and revision information.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure whose control and revision information the function retrieves.
     * @param {Pointer<UInt16>} pControl A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure that receives the security descriptor's control information.
     * @param {Pointer<UInt32>} lpdwRevision A pointer to a variable that receives the security descriptor's revision value. This value is always set, even when <b>GetSecurityDescriptorControl</b> returns an error.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsecuritydescriptorcontrol
     * @since windows5.1.2600
     */
    static GetSecurityDescriptorControl(pSecurityDescriptor, pControl, lpdwRevision) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSecurityDescriptorControl", "ptr", pSecurityDescriptor, "ushort*", pControl, "uint*", lpdwRevision, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a pointer to the discretionary access control list (DACL) in a specified security descriptor.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the DACL. The function retrieves a pointer to it.
     * @param {Pointer<BOOL>} lpbDaclPresent A pointer to a value that indicates the presence of a DACL in the specified security descriptor. If <i>lpbDaclPresent</i> is <b>TRUE</b>, the security descriptor contains a DACL, and the remaining output parameters in this function receive valid values. If <i>lpbDaclPresent</i> is <b>FALSE</b>, the security descriptor does not contain a DACL, and the remaining output parameters do not receive valid values.
     * 
     * A value of <b>TRUE</b> for <i>lpbDaclPresent</i> does not mean that <i>pDacl</i> is not <b>NULL</b>.  That is, <i>lpbDaclPresent</i> can be <b>TRUE</b> while <i>pDacl</i> is <b>NULL</b>, meaning that a <b>NULL</b> DACL is in effect.   A <b>NULL</b> DACL implicitly allows all access to an object and is not the same as an empty DACL. An empty DACL permits no access to an object.  For information about creating a proper DACL, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/creating-a-dacl">Creating a DACL</a>.
     * @param {Pointer<ACL>} pDacl A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL). If a DACL exists, the function sets the pointer pointed to by <i>pDacl</i> to the address of the security descriptor's DACL. If a DACL does not exist, no value is stored. 
     * 
     * 
     * 
     * 
     * If the function stores a <b>NULL</b> value in the pointer pointed to by <i>pDacl</i>, the security descriptor has a <b>NULL</b> DACL. A <b>NULL</b> DACL implicitly allows all access to an object.
     * 
     * If an application expects a non-<b>NULL</b> DACL but encounters a <b>NULL</b> DACL, the application should fail securely and not allow access.
     * @param {Pointer<BOOL>} lpbDaclDefaulted A pointer to a flag set to the value of the SE_DACL_DEFAULTED flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure if a DACL exists for the security descriptor. If this flag is <b>TRUE</b>, the DACL was retrieved by a default mechanism; if <b>FALSE</b>, the DACL was explicitly specified by a user.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsecuritydescriptordacl
     * @since windows5.1.2600
     */
    static GetSecurityDescriptorDacl(pSecurityDescriptor, lpbDaclPresent, pDacl, lpbDaclDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSecurityDescriptorDacl", "ptr", pSecurityDescriptor, "ptr", lpbDaclPresent, "ptr", pDacl, "ptr", lpbDaclDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the primary group information from a security descriptor.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure whose primary group information the function retrieves.
     * @param {Pointer<PSID>} pGroup A pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) that identifies the primary group when the function returns. If the security descriptor does not contain a primary group, the function sets the pointer pointed to by <i>pGroup</i> to <b>NULL</b> and ignores the remaining output parameter, <i>lpbGroupDefaulted</i>. If the security descriptor contains a primary group, the function sets the pointer pointed to by <i>pGroup</i> to the address of the security descriptor's group SID and provides a valid value for the variable pointed to by <i>lpbGroupDefaulted</i>.
     * @param {Pointer<BOOL>} lpbGroupDefaulted A pointer to a flag that is set to the value of the SE_GROUP_DEFAULTED flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure when the function returns. If the value stored in the variable pointed to by the <i>pGroup</i> parameter is <b>NULL</b>, no value is set.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsecuritydescriptorgroup
     * @since windows5.1.2600
     */
    static GetSecurityDescriptorGroup(pSecurityDescriptor, pGroup, lpbGroupDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSecurityDescriptorGroup", "ptr", pSecurityDescriptor, "ptr", pGroup, "ptr", lpbGroupDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the length, in bytes, of a structurally valid security descriptor. The length includes the length of all associated structures.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure whose length the function returns. The pointer is assumed to be valid.
     * @returns {Integer} If the function succeeds, the function returns the length, in bytes, of the <a href="/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure.
     * 
     * If the <a href="/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is not valid, the return value is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsecuritydescriptorlength
     * @since windows5.1.2600
     */
    static GetSecurityDescriptorLength(pSecurityDescriptor) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("ADVAPI32.dll\GetSecurityDescriptorLength", "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Retrieves the owner information from a security descriptor.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure whose owner information the function retrieves.
     * @param {Pointer<PSID>} pOwner A pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) that identifies the owner when the function returns. If the security descriptor does not contain an owner, the function sets the pointer pointed to by <i>pOwner</i> to <b>NULL</b> and ignores the remaining output parameter, <i>lpbOwnerDefaulted</i>. If the security descriptor contains an owner, the function sets the pointer pointed to by <i>pOwner</i> to the address of the security descriptor's owner SID and provides a valid value for the variable pointed to by <i>lpbOwnerDefaulted</i>.
     * @param {Pointer<BOOL>} lpbOwnerDefaulted A pointer to a flag that is set to the value of the SE_OWNER_DEFAULTED flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure when the function returns. If the value stored in the variable pointed to by the <i>pOwner</i> parameter is <b>NULL</b>, no value is set.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsecuritydescriptorowner
     * @since windows5.1.2600
     */
    static GetSecurityDescriptorOwner(pSecurityDescriptor, pOwner, lpbOwnerDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSecurityDescriptorOwner", "ptr", pSecurityDescriptor, "ptr", pOwner, "ptr", lpbOwnerDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the resource manager control bits.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager</a> control bits. The value of the <b>Control</b> member is set to SE_RM_CONTROL_VALID.
     * @param {Pointer<Byte>} RMControl A pointer to a buffer that receives the resource manager control bits.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the following value is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SE_RM_CONTROL_VALID bit flag is not set in the specified 
     * <a href="/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsecuritydescriptorrmcontrol
     * @since windows5.1.2600
     */
    static GetSecurityDescriptorRMControl(SecurityDescriptor, RMControl) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ADVAPI32.dll\GetSecurityDescriptorRMControl", "ptr", SecurityDescriptor, "char*", RMControl, "uint")
        return result
    }

    /**
     * Retrieves a pointer to the system access control list (SACL) in a specified security descriptor.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the SACL to which the function retrieves a pointer.
     * @param {Pointer<BOOL>} lpbSaclPresent A pointer to a flag the function sets to indicate the presence of a SACL in the specified security descriptor. If this parameter is <b>TRUE</b>, the security descriptor contains a SACL, and the remaining output parameters in this function receive valid values. If this parameter is <b>FALSE</b>, the security descriptor does not contain a SACL, and the remaining output parameters do not receive valid values.
     * @param {Pointer<ACL>} pSacl A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL). If a SACL exists, the function sets the pointer pointed to by <i>pSacl</i> to the address of the security descriptor's SACL. If a SACL does not exist, no value is stored. 
     * 
     * 
     * 
     * 
     * If the function stores a <b>NULL</b> value in the pointer pointed to by <i>pSacl</i>, the security descriptor has a <b>NULL</b> SACL.
     * @param {Pointer<BOOL>} lpbSaclDefaulted A pointer to a flag that is set to the value of the SE_SACL_DEFAULTED flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure if a SACL exists for the security descriptor.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsecuritydescriptorsacl
     * @since windows5.1.2600
     */
    static GetSecurityDescriptorSacl(pSecurityDescriptor, lpbSaclPresent, pSacl, lpbSaclDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSecurityDescriptorSacl", "ptr", pSecurityDescriptor, "ptr", lpbSaclPresent, "ptr", pSacl, "ptr", lpbSaclDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a pointer to the SID_IDENTIFIER_AUTHORITY structure in a specified security identifier (SID).
     * @param {PSID} pSid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure for which a pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_identifier_authority">SID_IDENTIFIER_AUTHORITY</a> structure is returned.
     * 
     * This function does not handle <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures that are not valid. Call the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsid">IsValidSid</a> function to verify that the <b>SID</b> structure is valid before you call this function.
     * @returns {Pointer<SID_IDENTIFIER_AUTHORITY>} If the function succeeds, the return value is a pointer to the <a href="/windows/desktop/api/winnt/ns-winnt-sid_identifier_authority">SID_IDENTIFIER_AUTHORITY</a> structure for the specified 
     * <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * 
     * If the function fails, the return value is undefined. The function fails if the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure pointed to by the <i>pSid</i> parameter is not valid. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsididentifierauthority
     * @since windows5.1.2600
     */
    static GetSidIdentifierAuthority(pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSidIdentifierAuthority", "ptr", pSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the length, in bytes, of the buffer required to store a SID with a specified number of subauthorities.
     * @param {Integer} nSubAuthorityCount Specifies the number of subauthorities to be stored in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * @returns {Integer} The return value is the length, in bytes, of the buffer required to store the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure. This function cannot fail.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsidlengthrequired
     * @since windows5.1.2600
     */
    static GetSidLengthRequired(nSubAuthorityCount) {
        result := DllCall("ADVAPI32.dll\GetSidLengthRequired", "char", nSubAuthorityCount, "uint")
        return result
    }

    /**
     * Returns a pointer to a specified subauthority in a security identifier (SID). The subauthority value is a relative identifier (RID).
     * @param {PSID} pSid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure from which a pointer to a subauthority is to be returned.
     * 
     * This function does not handle <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures that are not valid. Call the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsid">IsValidSid</a> function to verify that the <b>SID</b> structure is valid before you call this function.
     * @param {Integer} nSubAuthority Specifies an index value identifying the subauthority array element whose address the function will return. The function performs no validation tests on this value. An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getsidsubauthoritycount">GetSidSubAuthorityCount</a> function to discover the range of acceptable values.
     * @returns {Pointer<UInt32>} If the function succeeds, the return value is a pointer to the specified <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> subauthority. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the function fails, the return value is undefined. The function fails if the specified <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid or if the index value specified by the <i>nSubAuthority</i> parameter is out of bounds.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsidsubauthority
     * @since windows5.1.2600
     */
    static GetSidSubAuthority(pSid, nSubAuthority) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSidSubAuthority", "ptr", pSid, "uint", nSubAuthority, "uint*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a pointer to the member in a security identifier (SID) structure that contains the subauthority count.
     * @param {PSID} pSid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure from which a pointer to the subauthority count is returned.
     * 
     * This function does not handle <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures that are not valid. Call the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsid">IsValidSid</a> function to verify that the <b>SID</b> structure is valid before you call this function.
     * @returns {Pointer<Byte>} If the function succeeds, the return value is a pointer to the subauthority count for the specified <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * 
     * If the function fails, the return value is undefined. The function fails if the specified <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getsidsubauthoritycount
     * @since windows5.1.2600
     */
    static GetSidSubAuthorityCount(pSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetSidSubAuthorityCount", "ptr", pSid, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a specified type of information about an access token. The calling process must have appropriate access rights to obtain the information.
     * @param {HANDLE} TokenHandle A handle to an access token from which information is retrieved. If <i>TokenInformationClass</i> specifies TokenSource, the handle must have TOKEN_QUERY_SOURCE access. For all other <i>TokenInformationClass</i> values, the handle must have TOKEN_QUERY access.
     * @param {Integer} TokenInformationClass Specifies a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_information_class">TOKEN_INFORMATION_CLASS</a> enumerated type to identify the type of information the function retrieves. Any callers who check the <b>TokenIsAppContainer</b> and have it return 0 should also verify that the caller token is not an identify level impersonation token. If the current token is not an app container but is an identity level token, you should return <b>AccessDenied</b>.
     * @param {Pointer} TokenInformation A pointer to a buffer the function fills with the requested information. The structure put into this buffer depends upon the type of information specified by the <i>TokenInformationClass</i> parameter.
     * @param {Integer} TokenInformationLength Specifies the size, in bytes, of the buffer pointed to by the <i>TokenInformation</i> parameter. If <i>TokenInformation</i> is <b>NULL</b>, this parameter must be zero.
     * @param {Pointer<UInt32>} ReturnLength A pointer to a variable that receives the number of bytes needed for the buffer pointed to by the <i>TokenInformation</i> parameter. If this value is larger than the value specified in the <i>TokenInformationLength</i> parameter, the function fails and stores no data in the buffer.
     * 
     * If the value of the <i>TokenInformationClass</i> parameter is TokenDefaultDacl and the token has no default DACL, the function sets the variable pointed to by <i>ReturnLength</i> to <c>sizeof(</code><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_default_dacl">TOKEN_DEFAULT_DACL</a><code>)</c> and sets the <b>DefaultDacl</b> member of the <b>TOKEN_DEFAULT_DACL</b> structure to <b>NULL</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-gettokeninformation
     * @since windows5.1.2600
     */
    static GetTokenInformation(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetTokenInformation", "ptr", TokenHandle, "int", TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, "uint*", ReturnLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Receives a security identifier (SID) and returns a SID representing the domain of that SID.
     * @param {PSID} pSid A pointer to the SID to examine.
     * @param {Pointer} pDomainSid Pointer that <b>GetWindowsAccountDomainSid</b> fills with a pointer to a SID representing the domain.
     * @param {Pointer<UInt32>} cbDomainSid A pointer to a <b>DWORD</b> that <b>GetWindowsAccountDomainSid</b> fills with the size of the domain SID, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful.
     * 
     * Otherwise, returns <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-getwindowsaccountdomainsid
     * @since windows5.1.2600
     */
    static GetWindowsAccountDomainSid(pSid, pDomainSid, cbDomainSid) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetWindowsAccountDomainSid", "ptr", pSid, "ptr", pDomainSid, "uint*", cbDomainSid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables the specified thread to impersonate the system's anonymous logon token.
     * @param {HANDLE} ThreadHandle A handle to the thread to impersonate the system's anonymous logon token. The thread handle must have the THREAD_IMPERSONATE access right in order for the thread to impersonate the system's anonymous logon token.
     * 
     * To grant such access, the thread must be opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthread">OpenThread</a> with the desired access right to THREAD_IMPERSONATE.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * An error of ACCESS_DENIED might indicate that the token is for a restricted process. Use [OpenProcessToken](/windows/win32/api/processthreadsapi/nf-processthreadsapi-openprocesstoken) and [IsTokenRestricted](/windows/win32/api/securitybaseapi/nf-securitybaseapi-istokenrestricted) to check if the process is restricted. ACCESS_DENIED is also returned if the thread handle lacks right access to THREAD_IMPERSONATE.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-impersonateanonymoustoken
     * @since windows5.1.2600
     */
    static ImpersonateAnonymousToken(ThreadHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ImpersonateAnonymousToken", "ptr", ThreadHandle, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Lets the calling thread impersonate the security context of a logged-on user. The user is represented by a token handle.
     * @param {HANDLE} hToken A handle to a primary or impersonation <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> that represents a logged-on user. This can be a token handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> functions. If <i>hToken</i> is a handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a>, the token must have <b>TOKEN_QUERY</b> and <b>TOKEN_DUPLICATE</b> access. If <i>hToken</i> is a handle to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>, the token must have <b>TOKEN_QUERY</b> and <b>TOKEN_IMPERSONATE</b> access.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-impersonateloggedonuser
     * @since windows5.1.2600
     */
    static ImpersonateLoggedOnUser(hToken) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ImpersonateLoggedOnUser", "ptr", hToken, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Obtains an access token that impersonates the security context of the calling process. The token is assigned to the calling thread.
     * @param {Integer} ImpersonationLevel Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumerated type that supplies the impersonation level of the new token.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-impersonateself
     * @since windows5.1.2600
     */
    static ImpersonateSelf(ImpersonationLevel) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ImpersonateSelf", "int", ImpersonationLevel, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a new ACL structure.
     * @param {Pointer} pAcl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure  to be initialized by this function. Allocate memory for <i>pAcl</i> before calling this function.
     * @param {Integer} nAclLength The length, in bytes, of the buffer pointed to by the <i>pAcl</i> parameter. This value must be large enough to contain the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> header and all of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) to be stored in the <b>ACL</b>. In addition, this value must be <b>DWORD</b>-aligned. For more information about calculating the size of an <b>ACL</b>, see Remarks.
     * @param {Integer} dwAclRevision The revision level of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure being created. 
     * 
     * 
     * This value can be ACL_REVISION or ACL_REVISION_DS. Use ACL_REVISION_DS if the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) supports object-specific ACEs.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-initializeacl
     * @since windows5.1.2600
     */
    static InitializeAcl(pAcl, nAclLength, dwAclRevision) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\InitializeAcl", "ptr", pAcl, "uint", nAclLength, "uint", dwAclRevision, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a new security descriptor.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that the function initializes.
     * @param {Integer} dwRevision The revision level to assign to the security descriptor. This parameter must be SECURITY_DESCRIPTOR_REVISION.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-initializesecuritydescriptor
     * @since windows5.1.2600
     */
    static InitializeSecurityDescriptor(pSecurityDescriptor, dwRevision) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\InitializeSecurityDescriptor", "ptr", pSecurityDescriptor, "uint", dwRevision, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a security identifier (SID).
     * @param {PSID} Sid A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to be initialized.
     * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} pIdentifierAuthority A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_identifier_authority">SID_IDENTIFIER_AUTHORITY</a> structure to set in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * @param {Integer} nSubAuthorityCount Specifies the number of subauthorities to set in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>. Values of the subauthority must be set separately, as described in the following Remarks section.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-initializesid
     * @since windows5.1.2600
     */
    static InitializeSid(Sid, pIdentifierAuthority, nSubAuthorityCount) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\InitializeSid", "ptr", Sid, "ptr", pIdentifierAuthority, "char", nSubAuthorityCount, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Indicates whether a token contains a list of restricted security identifiers (SIDs).
     * @param {HANDLE} TokenHandle A handle to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> to test.
     * @returns {BOOL} If the token contains a list of restricting SIDs, the return value is nonzero.
     * 
     * If the token does not contain a list of restricting SIDs, the return value is zero.
     * 
     * If an error occurs, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-istokenrestricted
     * @since windows5.1.2600
     */
    static IsTokenRestricted(TokenHandle) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\IsTokenRestricted", "ptr", TokenHandle, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Validates an access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure validated by this function. This value must not be <b>NULL</b>.
     * @returns {BOOL} If the ACL is valid, the function returns nonzero.
     *       
     * 
     * If the ACL is not valid, the function returns zero. There is no extended error information for this function; do not call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-isvalidacl
     * @since windows5.1.2600
     */
    static IsValidAcl(pAcl) {
        result := DllCall("ADVAPI32.dll\IsValidAcl", "ptr", pAcl, "ptr")
        return result
    }

    /**
     * Determines whether the components of a security descriptor are valid.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that the function validates.
     * @returns {BOOL} If the components of the security descriptor are valid, the return value is nonzero.
     * 
     * If any of the components of the security descriptor are not valid, the return value is zero. There is no extended error information for this function; do not call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-isvalidsecuritydescriptor
     * @since windows5.1.2600
     */
    static IsValidSecurityDescriptor(pSecurityDescriptor) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("ADVAPI32.dll\IsValidSecurityDescriptor", "ptr", pSecurityDescriptor, "ptr")
        return result
    }

    /**
     * Validates a security identifier (SID) by verifying that the revision number is within a known range, and that the number of subauthorities is less than the maximum.
     * @param {PSID} pSid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure to validate. This parameter cannot be <b>NULL</b>.
     * @returns {BOOL} If the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is valid, the return value is nonzero.
     * 
     * If the <a href="/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid, the return value is zero. There is no extended error information for this function; do not call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-isvalidsid
     * @since windows5.1.2600
     */
    static IsValidSid(pSid) {
        result := DllCall("ADVAPI32.dll\IsValidSid", "ptr", pSid, "ptr")
        return result
    }

    /**
     * Compares a SID to a well-known SID and returns TRUE if they match.
     * @param {PSID} pSid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> to test.
     * @param {Integer} WellKnownSidType Member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-well_known_sid_type">WELL_KNOWN_SID_TYPE</a> enumeration to compare with the SID at <i>pSid</i>.
     * @returns {BOOL} Returns <b>TRUE</b> if the SID at <i>pSid</i> matches the well-known SID indicated by <i>WellKnownSidType</i>.
     * 
     * Otherwise, returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-iswellknownsid
     * @since windows5.1.2600
     */
    static IsWellKnownSid(pSid, WellKnownSidType) {
        result := DllCall("ADVAPI32.dll\IsWellKnownSid", "ptr", pSid, "int", WellKnownSidType, "ptr")
        return result
    }

    /**
     * Creates a security descriptor in absolute format by using a security descriptor in self-relative format as a template.
     * @param {PSECURITY_DESCRIPTOR} pSelfRelativeSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure in self-relative format. The function creates an absolute-format version of this security descriptor without modifying the original security descriptor.
     * @param {Pointer} pAbsoluteSecurityDescriptor A pointer to a buffer that the function fills with the main body of an absolute-format security descriptor. This information is formatted as a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure.
     * @param {Pointer<UInt32>} lpdwAbsoluteSecurityDescriptorSize A pointer to a variable that specifies the size of the buffer pointed to by the <i>pAbsoluteSD</i> parameter. If the buffer is not large enough for the security descriptor, the function fails and sets this variable to the minimum required size.
     * @param {Pointer} pDacl A pointer to a buffer the function fills with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) of the absolute-format security descriptor. The main body of the absolute-format security descriptor references this pointer.
     * @param {Pointer<UInt32>} lpdwDaclSize A pointer to a variable that specifies the size of the buffer pointed to by the <i>pDacl</i> parameter. If the buffer is not large enough for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL), the function fails and sets this variable to the minimum required size.
     * @param {Pointer} pSacl A pointer to a buffer the function fills with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) of the absolute-format security descriptor. The main body of the absolute-format security descriptor references this pointer.
     * @param {Pointer<UInt32>} lpdwSaclSize A pointer to a variable that specifies the size of the buffer pointed to by the <i>pSacl</i> parameter. If the buffer is not large enough for the ACL, the function fails and sets this variable to the minimum required size.
     * @param {Pointer} pOwner A pointer to a buffer the function fills with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the owner of the absolute-format security descriptor. The main body of the absolute-format security descriptor references this pointer.
     * @param {Pointer<UInt32>} lpdwOwnerSize A pointer to a variable that specifies the size of the buffer pointed to by the <i>pOwner</i> parameter. If the buffer is not large enough for the SID, the function fails and sets this variable to the minimum required size.
     * @param {Pointer} pPrimaryGroup A pointer to a buffer the function fills with the SID of the absolute-format security descriptor's primary group. The main body of the absolute-format security descriptor references this pointer.
     * @param {Pointer<UInt32>} lpdwPrimaryGroupSize A pointer to a variable that specifies the size of the buffer pointed to by the <i>pPrimaryGroup</i> parameter. If the buffer is not large enough for the SID, the function fails and sets this variable to the minimum required size.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible return codes include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * <dt>0x7A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the buffers is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-makeabsolutesd
     * @since windows5.1.2600
     */
    static MakeAbsoluteSD(pSelfRelativeSecurityDescriptor, pAbsoluteSecurityDescriptor, lpdwAbsoluteSecurityDescriptorSize, pDacl, lpdwDaclSize, pSacl, lpdwSaclSize, pOwner, lpdwOwnerSize, pPrimaryGroup, lpdwPrimaryGroupSize) {
        pSelfRelativeSecurityDescriptor := pSelfRelativeSecurityDescriptor is Win32Handle ? NumGet(pSelfRelativeSecurityDescriptor, "ptr") : pSelfRelativeSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\MakeAbsoluteSD", "ptr", pSelfRelativeSecurityDescriptor, "ptr", pAbsoluteSecurityDescriptor, "uint*", lpdwAbsoluteSecurityDescriptorSize, "ptr", pDacl, "uint*", lpdwDaclSize, "ptr", pSacl, "uint*", lpdwSaclSize, "ptr", pOwner, "uint*", lpdwOwnerSize, "ptr", pPrimaryGroup, "uint*", lpdwPrimaryGroupSize, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a security descriptor in self-relative format by using a security descriptor in absolute format as a template.
     * @param {PSECURITY_DESCRIPTOR} pAbsoluteSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure in absolute format. The function creates a version of this security descriptor in self-relative format without modifying the original.
     * @param {Pointer} pSelfRelativeSecurityDescriptor A pointer to a buffer the function fills with a security descriptor in self-relative format.
     * @param {Pointer<UInt32>} lpdwBufferLength A pointer to a variable specifying the size of the buffer pointed to by the <i>pSelfRelativeSD</i> parameter. If the buffer is not large enough for the security descriptor, the function fails and sets this variable to the minimum required size.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.  Possible return codes include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * <dt>0x7A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the buffers is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-makeselfrelativesd
     * @since windows5.1.2600
     */
    static MakeSelfRelativeSD(pAbsoluteSecurityDescriptor, pSelfRelativeSecurityDescriptor, lpdwBufferLength) {
        pAbsoluteSecurityDescriptor := pAbsoluteSecurityDescriptor is Win32Handle ? NumGet(pAbsoluteSecurityDescriptor, "ptr") : pAbsoluteSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\MakeSelfRelativeSD", "ptr", pAbsoluteSecurityDescriptor, "ptr", pSelfRelativeSecurityDescriptor, "uint*", lpdwBufferLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps the generic access rights in an access mask to specific and standard access rights. The function applies a mapping supplied in a GENERIC_MAPPING structure.
     * @remarks
     * 
     * After calling the <b>MapGenericMask</b> function, the access mask pointed to by the <i>AccessMask</i> parameter has none of its generic bits (GenericRead, GenericWrite, GenericExecute, or GenericAll) or undefined bits set, although it can have other bits set. If bits other than the generic bits are provided on input, this function does not clear them.
     * 
     * 
     * 
     * @param {Pointer<UInt32>} AccessMask A pointer to an access mask.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure specifying a mapping of generic access types to specific and standard access types.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-mapgenericmask
     * @since windows5.1.2600
     */
    static MapGenericMask(AccessMask, GenericMapping) {
        DllCall("ADVAPI32.dll\MapGenericMask", "uint*", AccessMask, "ptr", GenericMapping)
    }

    /**
     * Generates an audit message in the security event log when a handle to a private object is deleted.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A unique value representing the client's handle to the object. This should be the same value that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheckandauditalarmw">AccessCheckAndAuditAlarm</a> or <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-objectopenauditalarmw">ObjectOpenAuditAlarm</a> function.
     * @param {BOOL} GenerateOnClose Specifies a flag set by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheckandauditalarmw">AccessCheckAndAuditAlarm</a> or <b>ObjectCloseAuditAlarm</b> function when the object handle is created. If this flag is <b>TRUE</b>, the function generates an audit message. If it is <b>FALSE</b>, the function does not generate an audit message.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-objectcloseauditalarmw
     */
    static ObjectCloseAuditAlarmW(SubsystemName, HandleId, GenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName

        result := DllCall("ADVAPI32.dll\ObjectCloseAuditAlarmW", "ptr", SubsystemName, "ptr", HandleId, "ptr", GenerateOnClose, "ptr")
        return result
    }

    /**
     * Generates audit messages when an object is deleted.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId Specifies a unique value representing the client's handle to the object. This must be the same value that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheckandauditalarmw">AccessCheckAndAuditAlarm</a> or <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-objectopenauditalarmw">ObjectOpenAuditAlarm</a> function.
     * @param {BOOL} GenerateOnClose Specifies a flag set by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheckandauditalarmw">AccessCheckAndAuditAlarm</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-objectopenauditalarmw">ObjectOpenAuditAlarm</a> function when the object handle is created.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-objectdeleteauditalarmw
     */
    static ObjectDeleteAuditAlarmW(SubsystemName, HandleId, GenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName

        result := DllCall("ADVAPI32.dll\ObjectDeleteAuditAlarmW", "ptr", SubsystemName, "ptr", HandleId, "ptr", GenerateOnClose, "ptr")
        return result
    }

    /**
     * Generates audit messages when a client application attempts to gain access to an object or to create a new one.
     * @param {PWSTR} SubsystemName A pointer to a <b>null</b>-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value representing the client's handle to the object. If the access is denied, this parameter is ignored.  
     * 
     * For cross-platform compatibility, the value addressed by this pointer must be sizeof(LPVOID) bytes long.
     * @param {PWSTR} ObjectTypeName A pointer to a <b>null</b>-terminated string specifying the type of object to which the client is requesting access. This string appears in any audit message that the function generates.
     * @param {PWSTR} ObjectName A pointer to a <b>null</b>-terminated string specifying the name of the object to which the client is requesting access. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure for the object being accessed.
     * @param {HANDLE} ClientToken Identifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> representing the client requesting the operation. This handle must be obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access.
     * @param {Integer} DesiredAccess Specifies the desired <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a>. This mask must have been previously mapped by the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights.
     * @param {Integer} GrantedAccess Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> indicating which access rights are granted. This access mask is intended to be the same value set by one of the access-checking functions in its <i>GrantedAccess</i> parameter. Examples of access-checking functions include <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheckandauditalarmw">AccessCheckAndAuditAlarm</a> and <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a>.
     * @param {Pointer<PRIVILEGE_SET>} Privileges A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure that specifies the set of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> required for the access attempt. This parameter can be <b>NULL</b>.
     * @param {BOOL} ObjectCreation Specifies a flag that determines whether the application creates a new object when access is granted. When this value is <b>TRUE</b>, the application creates a new object; when it is <b>FALSE</b>, the application opens an existing object.
     * @param {BOOL} AccessGranted Specifies a flag indicating whether access was granted or denied in a previous call to an access-checking function, such as <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a>. If access was granted, this value is <b>TRUE</b>. If not, it is <b>FALSE</b>.
     * @param {Pointer<BOOL>} GenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. This value must be passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-objectcloseauditalarmw">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-objectopenauditalarmw
     */
    static ObjectOpenAuditAlarmW(SubsystemName, HandleId, ObjectTypeName, ObjectName, pSecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        result := DllCall("ADVAPI32.dll\ObjectOpenAuditAlarmW", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", pSecurityDescriptor, "ptr", ClientToken, "uint", DesiredAccess, "uint", GrantedAccess, "ptr", Privileges, "ptr", ObjectCreation, "ptr", AccessGranted, "ptr", GenerateOnClose, "ptr")
        return result
    }

    /**
     * Generates an audit message in the security event log.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in the audit message.
     * @param {Pointer<Void>} HandleId A pointer to a unique value representing the client's handle to the object.
     * @param {HANDLE} ClientToken Identifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> representing the client that requested the operation. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access. The function uses this token to get the identity of the client for the audit message.
     * @param {Integer} DesiredAccess Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> indicating the privileged access types being used or whose use is being attempted. The access mask can be mapped by the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function so it does not contain any generic access types.
     * @param {Pointer<PRIVILEGE_SET>} Privileges A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> that the client attempted to use. The names of the privileges appear in the audit message.
     * @param {BOOL} AccessGranted Indicates whether the client's attempt to use the privileges was successful. If this value is <b>TRUE</b>, the audit message indicates success. If this value is <b>FALSE</b>, the audit message indicates failure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-objectprivilegeauditalarmw
     */
    static ObjectPrivilegeAuditAlarmW(SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        result := DllCall("ADVAPI32.dll\ObjectPrivilegeAuditAlarmW", "ptr", SubsystemName, "ptr", HandleId, "ptr", ClientToken, "uint", DesiredAccess, "ptr", Privileges, "ptr", AccessGranted, "ptr")
        return result
    }

    /**
     * Determines whether a specified set of privileges are enabled in an access token.
     * @param {HANDLE} ClientToken A handle to an access token representing a client <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a>. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access.
     * @param {Pointer<PRIVILEGE_SET>} RequiredPrivileges A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure. The <b>Privilege</b> member of this structure is an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid_and_attributes">LUID_AND_ATTRIBUTES</a> structures. Before calling <b>PrivilegeCheck</b>, use the <b>Privilege</b> array to indicate the set of privileges to check. Set the <b>Control</b> member to PRIVILEGE_SET_ALL_NECESSARY if all of the privileges must be enabled; or set it to zero if it is sufficient that any one of the privileges be enabled. 
     * 
     * 
     * 
     * 
     * When <b>PrivilegeCheck</b> returns, the <b>Attributes</b> member of each <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid_and_attributes">LUID_AND_ATTRIBUTES</a> structure is set to SE_PRIVILEGE_USED_FOR_ACCESS if the corresponding privilege is enabled.
     * @param {Pointer<BOOL>} pfResult A pointer to a value the function sets to indicate whether any or all of the specified privileges are enabled in the access token. If the <b>Control</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure specifies PRIVILEGE_SET_ALL_NECESSARY, this value is <b>TRUE</b> only if all the privileges are enabled; otherwise, this value is <b>TRUE</b> if any of the privileges are enabled.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-privilegecheck
     * @since windows5.1.2600
     */
    static PrivilegeCheck(ClientToken, RequiredPrivileges, pfResult) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\PrivilegeCheck", "ptr", ClientToken, "ptr", RequiredPrivileges, "ptr", pfResult, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates an audit message in the security event log.
     * @param {PWSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This information appears in the security event log record.
     * @param {PWSTR} ServiceName A pointer to a null-terminated string specifying the name of the privileged subsystem service. This information appears in the security event log record.
     * @param {HANDLE} ClientToken Identifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> representing the client that requested the operation. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access. The function uses this token to get the identity of the client for the security event log record.
     * @param {Pointer<PRIVILEGE_SET>} Privileges A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure containing the privileges that the client attempted to use. The names of the privileges appear in the security event log record.
     * @param {BOOL} AccessGranted Indicates whether the client's attempt to use the privileges was successful. If this value is <b>TRUE</b>, the security event log record indicates success. If this value is <b>FALSE</b>, the security event log record indicates failure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-privilegedserviceauditalarmw
     */
    static PrivilegedServiceAuditAlarmW(SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        result := DllCall("ADVAPI32.dll\PrivilegedServiceAuditAlarmW", "ptr", SubsystemName, "ptr", ServiceName, "ptr", ClientToken, "ptr", Privileges, "ptr", AccessGranted, "ptr")
        return result
    }

    /**
     * Creates an access mask that represents the access permissions necessary to query the specified object security information.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that specifies the security information to be queried.
     * @param {Pointer<UInt32>} DesiredAccess A pointer to the access mask that this function creates.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-querysecurityaccessmask
     * @since windows6.0.6000
     */
    static QuerySecurityAccessMask(SecurityInformation, DesiredAccess) {
        DllCall("ADVAPI32.dll\QuerySecurityAccessMask", "uint", SecurityInformation, "uint*", DesiredAccess)
    }

    /**
     * Terminates the impersonation of a client application.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-reverttoself
     * @since windows5.1.2600
     */
    static RevertToSelf() {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RevertToSelf", "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets information about an access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL. The function sets information in this ACL.
     * @param {Pointer} pAclInformation A pointer to a buffer that contains the information to be set. This must be a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_revision_information">ACL_REVISION_INFORMATION</a> structure.
     * @param {Integer} nAclInformationLength The size, in bytes, of the buffer pointed to by the <i>pAclInfo</i> parameter.
     * @param {Integer} dwAclInformationClass An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-acl_information_class">ACL_INFORMATION_CLASS</a> enumerated type that gives the class of information requested. 
     * 
     * 
     * 
     * 
     * Currently, this parameter can be <b>AclRevisionInformation</b>. This means that the buffer pointed to by the <i>pAclInformation</i> parameter contains an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_revision_information">ACL_REVISION_INFORMATION</a> structure.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setaclinformation
     * @since windows5.1.2600
     */
    static SetAclInformation(pAcl, pAclInformation, nAclInformationLength, dwAclInformationClass) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetAclInformation", "ptr", pAcl, "ptr", pAclInformation, "uint", nAclInformationLength, "int", dwAclInformationClass, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the security of a file or directory object.
     * @param {PWSTR} lpFileName A pointer to a null-terminated string that specifies the file or directory for which security is set. Note that security applied to a directory is not inherited by its children.
     * @param {Integer} SecurityInformation Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that identifies the contents of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> pointed to by the <i>pSecurityDescriptor</i> parameter.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setfilesecurityw
     */
    static SetFileSecurityW(lpFileName, SecurityInformation, pSecurityDescriptor) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("ADVAPI32.dll\SetFileSecurityW", "ptr", lpFileName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "ptr")
        return result
    }

    /**
     * Sets the security of a kernel object.
     * @param {HANDLE} Handle A handle to a kernel object for which security information is set.
     * @param {Integer} SecurityInformation A set of 
     * bit flags that indicate the type of security information to set. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the new security information.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setkernelobjectsecurity
     * @since windows5.1.2600
     */
    static SetKernelObjectSecurity(Handle, SecurityInformation, SecurityDescriptor) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetKernelObjectSecurity", "ptr", Handle, "uint", SecurityInformation, "ptr", SecurityDescriptor, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Modifies a private object's security descriptor.
     * @param {Integer} SecurityInformation Indicates the parts of the security descriptor to set. This value can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {PSECURITY_DESCRIPTOR} ModificationDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure. The parts of this security descriptor indicated by the <i>SecurityInformation</i> parameter are applied to the <i>ObjectsSecurityDescriptor</i> security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure. This security descriptor must be in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> form. **The memory for the security descriptor must be allocated from the process heap (GetProcessHeap) with the HeapAlloc function.**
     * 
     * 
     * 
     * 
     * On input, this is the current security descriptor of the private object. The function modifies it to produce the new security descriptor. If necessary, the <b>SetPrivateObjectSecurity</b> function allocates additional memory to produce a larger security descriptor.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure that specifies the specific and standard access rights that correspond to each of the generic access rights.
     * @param {HANDLE} Token A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> for the client on whose behalf the private object's security is being modified. This parameter is required to ensure that the client has provided a legitimate value for a new owner <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). The token must be open for TOKEN_QUERY access.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setprivateobjectsecurity
     * @since windows5.1.2600
     */
    static SetPrivateObjectSecurity(SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, GenericMapping, Token) {
        ModificationDescriptor := ModificationDescriptor is Win32Handle ? NumGet(ModificationDescriptor, "ptr") : ModificationDescriptor
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetPrivateObjectSecurity", "uint", SecurityInformation, "ptr", ModificationDescriptor, "ptr", ObjectsSecurityDescriptor, "ptr", GenericMapping, "ptr", Token, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Modifies the security descriptor of a private object maintained by the resource manager calling this function.
     * @param {Integer} SecurityInformation The parts of the security descriptor to set. This value can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {PSECURITY_DESCRIPTOR} ModificationDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure. The parts of this security descriptor indicated by the <i>SecurityInformation</i> parameter are applied to the <i>ObjectsSecurityDescriptor</i> security descriptor.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure. This security descriptor must be in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> form. **The memory for the security descriptor must be allocated from the process heap (GetProcessHeap) with the HeapAlloc function.**
     * 
     * 
     * 
     * 
     * On input, this is the current security descriptor of the private object. The function modifies it to produce the new security descriptor. If necessary, the <b>SetPrivateObjectSecurityEx</b> function allocates additional memory to produce a larger security descriptor.
     * @param {Integer} AutoInheritFlags 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure that specifies the specific and standard access rights that correspond to each of the generic access rights.
     * @param {HANDLE} Token Identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> for the client on whose behalf the private object's security is being modified. This parameter is required to ensure that the client has provided a legitimate value for a new owner <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). The token must be open for TOKEN_QUERY access.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setprivateobjectsecurityex
     * @since windows5.1.2600
     */
    static SetPrivateObjectSecurityEx(SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, AutoInheritFlags, GenericMapping, Token) {
        ModificationDescriptor := ModificationDescriptor is Win32Handle ? NumGet(ModificationDescriptor, "ptr") : ModificationDescriptor
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetPrivateObjectSecurityEx", "uint", SecurityInformation, "ptr", ModificationDescriptor, "ptr", ObjectsSecurityDescriptor, "uint", AutoInheritFlags, "ptr", GenericMapping, "ptr", Token, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates an access mask that represents the access permissions necessary to set the specified object security information.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that specifies the security information to be set.
     * @param {Pointer<UInt32>} DesiredAccess A pointer to the access mask that this function creates.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setsecurityaccessmask
     * @since windows6.0.6000
     */
    static SetSecurityAccessMask(SecurityInformation, DesiredAccess) {
        DllCall("ADVAPI32.dll\SetSecurityAccessMask", "uint", SecurityInformation, "uint*", DesiredAccess)
    }

    /**
     * Sets the control bits of a security descriptor. The function can set only the control bits that relate to automatic inheritance of ACEs.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure whose control and revision information are set.
     * @param {Integer} ControlBitsOfInterest A 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> mask that indicates the control bits to set.
     * @param {Integer} ControlBitsToSet A 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> mask that indicates the new values for the control bits specified by the <i>ControlBitsOfInterest</i> mask.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setsecuritydescriptorcontrol
     * @since windows5.1.2600
     */
    static SetSecurityDescriptorControl(pSecurityDescriptor, ControlBitsOfInterest, ControlBitsToSet) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetSecurityDescriptorControl", "ptr", pSecurityDescriptor, "ushort", ControlBitsOfInterest, "ushort", ControlBitsToSet, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets information in a discretionary access control list (DACL). If a DACL is already present in the security descriptor, the DACL is replaced.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure to which the function adds the DACL. This security descriptor must be in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">absolute</a> format, meaning that its members must be pointers to other structures, rather than offsets to contiguous data.
     * @param {BOOL} bDaclPresent A flag that indicates the presence of a DACL in the security descriptor. If this parameter is <b>TRUE</b>, the function sets the SE_DACL_PRESENT flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure and uses the values in the <i>pDacl</i> and <i>bDaclDefaulted</i> parameters. If this parameter is <b>FALSE</b>, the function clears the SE_DACL_PRESENT flag, and <i>pDacl</i> and <i>bDaclDefaulted</i> are ignored.
     * @param {Pointer<ACL>} pDacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that specifies the DACL for the security descriptor. If this parameter is <b>NULL</b>, a <b>NULL</b> DACL is assigned to the security descriptor, which allows all access to the object. The DACL is referenced by, not copied into, the security descriptor.
     * @param {BOOL} bDaclDefaulted A flag that indicates the source of the DACL. If this flag is <b>TRUE</b>, the DACL has been retrieved by some default mechanism. If <b>FALSE</b>, the DACL has been explicitly specified by a user. The function stores this value in the SE_DACL_DEFAULTED flag of the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure. If this parameter is not specified, the SE_DACL_DEFAULTED flag is cleared.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setsecuritydescriptordacl
     * @since windows5.1.2600
     */
    static SetSecurityDescriptorDacl(pSecurityDescriptor, bDaclPresent, pDacl, bDaclDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetSecurityDescriptorDacl", "ptr", pSecurityDescriptor, "ptr", bDaclPresent, "ptr", pDacl, "ptr", bDaclDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the primary group information of an absolute-format security descriptor, replacing any primary group information already present in the security descriptor.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure whose primary group is set by this function. The function replaces any existing primary group with the new primary group.
     * @param {PSID} pGroup A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure for the security descriptor's new primary group. The <b>SID</b> structure is referenced by, not copied into, the security descriptor. If this parameter is <b>NULL</b>, the function clears the security descriptor's primary group information. This marks the security descriptor as having no primary group.
     * @param {BOOL} bGroupDefaulted Indicates whether the primary group information was derived from a default mechanism. If this value is <b>TRUE</b>, it is default information, and the function stores this value as the SE_GROUP_DEFAULTED flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure. If this parameter is zero, the SE_GROUP_DEFAULTED flag is cleared.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setsecuritydescriptorgroup
     * @since windows5.1.2600
     */
    static SetSecurityDescriptorGroup(pSecurityDescriptor, pGroup, bGroupDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetSecurityDescriptorGroup", "ptr", pSecurityDescriptor, "ptr", pGroup, "ptr", bGroupDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the owner information of an absolute-format security descriptor. It replaces any owner information already present in the security descriptor.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure whose owner is set by this function. The function replaces any existing owner with the new owner.
     * @param {PSID} pOwner A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure for the security descriptor's new primary owner. The <b>SID</b> structure is referenced by, not copied into, the security descriptor. If this parameter is <b>NULL</b>, the function clears the security descriptor's owner information. This marks the security descriptor as having no owner.
     * @param {BOOL} bOwnerDefaulted Indicates whether the owner information is derived from a default mechanism. If this value is <b>TRUE</b>, it is default information. The function stores this value as the SE_OWNER_DEFAULTED flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure. If this parameter is zero, the SE_OWNER_DEFAULTED flag is cleared.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setsecuritydescriptorowner
     * @since windows5.1.2600
     */
    static SetSecurityDescriptorOwner(pSecurityDescriptor, pOwner, bOwnerDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetSecurityDescriptorOwner", "ptr", pSecurityDescriptor, "ptr", pOwner, "ptr", bOwnerDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the resource manager control bits in the SECURITY_DESCRIPTOR structure.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager</a> control bits.
     * @param {Pointer<Byte>} RMControl A pointer to the bitfield value that the resource manager control bits in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure will be set to. If the value of this parameter is <b>NULL</b>, the resource manager control bits will be cleared.
     * @returns {Integer} The return value is ERROR_SUCCESS.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setsecuritydescriptorrmcontrol
     * @since windows5.1.2600
     */
    static SetSecurityDescriptorRMControl(SecurityDescriptor, RMControl) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ADVAPI32.dll\SetSecurityDescriptorRMControl", "ptr", SecurityDescriptor, "char*", RMControl, "uint")
        return result
    }

    /**
     * Sets information in a system access control list (SACL). If there is already a SACL present in the security descriptor, it is replaced.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure to which the function adds the SACL. This security descriptor must be in absolute format, meaning that its members must be pointers to other structures, rather than offsets to contiguous data.
     * @param {BOOL} bSaclPresent Indicates the presence of a SACL in the security descriptor. If this parameter is <b>TRUE</b>, the function sets the SE_SACL_PRESENT flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure and uses the values in the <i>pSacl</i> and <i>bSaclDefaulted</i> parameters. If it is <b>FALSE</b>, the function does not set the SE_SACL_PRESENT flag, and <i>pSacl</i> and <i>bSaclDefaulted</i> are ignored.
     * @param {Pointer<ACL>} pSacl A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that specifies the SACL for the security descriptor. If this parameter is <b>NULL</b>, a <b>NULL</b> SACL is assigned to the security descriptor. The SACL is referenced by, not copied into, the security descriptor.
     * @param {BOOL} bSaclDefaulted Indicates the source of the SACL. If this flag is <b>TRUE</b>, the SACL has been retrieved by some default mechanism. If it is <b>FALSE</b>, the SACL has been explicitly specified by a user. The function stores this value in the SE_SACL_DEFAULTED flag of the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-control">SECURITY_DESCRIPTOR_CONTROL</a> structure. If this parameter is not specified, the SE_SACL_DEFAULTED flag is cleared.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-setsecuritydescriptorsacl
     * @since windows5.1.2600
     */
    static SetSecurityDescriptorSacl(pSecurityDescriptor, bSaclPresent, pSacl, bSaclDefaulted) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetSecurityDescriptorSacl", "ptr", pSecurityDescriptor, "ptr", bSaclPresent, "ptr", pSacl, "ptr", bSaclDefaulted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets various types of information for a specified access token.
     * @param {HANDLE} TokenHandle A handle to the access token for which information is to be set.
     * @param {Integer} TokenInformationClass A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_information_class">TOKEN_INFORMATION_CLASS</a> enumerated type that identifies the type of information the function sets. The valid values from <b>TOKEN_INFORMATION_CLASS</b> are described in the <i>TokenInformation</i> parameter.
     * @param {Pointer} TokenInformation A pointer to a buffer that contains the information set in the access token. The structure of this buffer depends on the type of information specified by the <i>TokenInformationClass</i> parameter.
     * @param {Integer} TokenInformationLength Specifies the length, in bytes, of the buffer pointed to by <i>TokenInformation</i>.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-settokeninformation
     * @since windows5.1.2600
     */
    static SetTokenInformation(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetTokenInformation", "ptr", TokenHandle, "int", TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} SourceFiles 
     * @param {Integer} SourceFileCount 
     * @param {Integer} Flags 
     * @param {HANDLE} TargetFile 
     * @returns {BOOL} 
     */
    static SetCachedSigningLevel(SourceFiles, SourceFileCount, Flags, TargetFile) {
        TargetFile := TargetFile is Win32Handle ? NumGet(TargetFile, "ptr") : TargetFile

        result := DllCall("KERNEL32.dll\SetCachedSigningLevel", "ptr", SourceFiles, "uint", SourceFileCount, "uint", Flags, "ptr", TargetFile, "ptr")
        return result
    }

    /**
     * 
     * @param {HANDLE} File 
     * @param {Pointer<UInt32>} Flags 
     * @param {Pointer<UInt32>} SigningLevel 
     * @param {Pointer} Thumbprint 
     * @param {Pointer<UInt32>} ThumbprintSize 
     * @param {Pointer<UInt32>} ThumbprintAlgorithm 
     * @returns {BOOL} 
     */
    static GetCachedSigningLevel(File, Flags, SigningLevel, Thumbprint, ThumbprintSize, ThumbprintAlgorithm) {
        File := File is Win32Handle ? NumGet(File, "ptr") : File

        result := DllCall("KERNEL32.dll\GetCachedSigningLevel", "ptr", File, "uint*", Flags, "uint*", SigningLevel, "ptr", Thumbprint, "uint*", ThumbprintSize, "uint*", ThumbprintAlgorithm, "ptr")
        return result
    }

    /**
     * This function constructs two arrays of SIDs out of a capability name. One is an array group SID with NT Authority, and the other is an array of capability SIDs with AppAuthority.
     * @param {PWSTR} CapName Name of the capability in string form.
     * @param {Pointer<PSID>} CapabilityGroupSids The GroupSids with NTAuthority.
     * @param {Pointer<UInt32>} CapabilityGroupSidCount The count of GroupSids in the array.
     * @param {Pointer<PSID>} CapabilitySids CapabilitySids with AppAuthority.
     * @param {Pointer<UInt32>} CapabilitySidCount The count of CapabilitySid with AppAuthority.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-derivecapabilitysidsfromname
     */
    static DeriveCapabilitySidsFromName(CapName, CapabilityGroupSids, CapabilityGroupSidCount, CapabilitySids, CapabilitySidCount) {
        CapName := CapName is String ? StrPtr(CapName) : CapName

        A_LastError := 0

        result := DllCall("api-ms-win-security-base-l1-2-2.dll\DeriveCapabilitySidsFromName", "ptr", CapName, "ptr", CapabilityGroupSids, "uint*", CapabilityGroupSidCount, "ptr", CapabilitySids, "uint*", CapabilitySidCount, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} SecurityDescriptor 
     * @param {Integer} SecurityDescriptorLength 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewSecurityDescriptor 
     * @param {Pointer<UInt32>} NewSecurityDescriptorLength 
     * @param {BOOLEAN} CheckOnly 
     * @returns {BOOLEAN} 
     */
    static RtlNormalizeSecurityDescriptor(SecurityDescriptor, SecurityDescriptorLength, NewSecurityDescriptor, NewSecurityDescriptorLength, CheckOnly) {
        result := DllCall("ntdll.dll\RtlNormalizeSecurityDescriptor", "ptr", SecurityDescriptor, "uint", SecurityDescriptorLength, "ptr", NewSecurityDescriptor, "uint*", NewSecurityDescriptorLength, "ptr", CheckOnly, "ptr")
        return result
    }

    /**
     * Sets the security of a user object. This can be, for example, a window or a DDE conversation.
     * @param {HANDLE} hObj A handle to a user object for which security information is set.
     * @param {Pointer<UInt32>} pSIRequested 
     * @param {PSECURITY_DESCRIPTOR} pSID A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the new security information. 
     * 
     * 
     * 
     * 
     * This buffer must be aligned on a 4-byte boundary.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setuserobjectsecurity
     * @since windows5.1.2600
     */
    static SetUserObjectSecurity(hObj, pSIRequested, pSID) {
        hObj := hObj is Win32Handle ? NumGet(hObj, "ptr") : hObj
        pSID := pSID is Win32Handle ? NumGet(pSID, "ptr") : pSID

        A_LastError := 0

        result := DllCall("USER32.dll\SetUserObjectSecurity", "ptr", hObj, "uint*", pSIRequested, "ptr", pSID, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves security information for the specified user object.
     * @param {HANDLE} hObj A handle to the user object for which to return security information.
     * @param {Pointer<UInt32>} pSIRequested A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies the security information being requested.
     * @param {Pointer} pSID A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> format that contains the requested information when the function returns. This buffer must be aligned on a 4-byte boundary.
     * @param {Integer} nLength The length, in bytes, of the buffer pointed to by the <i>pSD</i> parameter.
     * @param {Pointer<UInt32>} lpnLengthNeeded A pointer to a variable to receive the number of bytes required to store the complete <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>. If this variable's value is greater than the value of the <i>nLength</i> parameter when the function returns, the function returns <b>FALSE</b> and none of the security descriptor is copied to the buffer. Otherwise, the entire security descriptor is copied.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 						
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getuserobjectsecurity
     * @since windows5.1.2600
     */
    static GetUserObjectSecurity(hObj, pSIRequested, pSID, nLength, lpnLengthNeeded) {
        hObj := hObj is Win32Handle ? NumGet(hObj, "ptr") : hObj

        A_LastError := 0

        result := DllCall("USER32.dll\GetUserObjectSecurity", "ptr", hObj, "uint*", pSIRequested, "ptr", pSID, "uint", nLength, "uint*", lpnLengthNeeded, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value representing the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {PSTR} ObjectTypeName A pointer to a null-terminated string specifying the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSTR} ObjectName A pointer to a null-terminated string specifying the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {Integer} DesiredAccess <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights. 
     * 
     * 
     * 
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the <i>GrantedAccess</i> access mask to indicate the maximum access rights the security descriptor allows the client.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation Specifies a flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that receives the granted access rights. If <i>AccessStatus</i> is set to <b>FALSE</b>, the function sets the access mask to zero. If the function fails, it does not set the access mask.
     * @param {Pointer<BOOL>} AccessStatus A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client, <i>AccessStatus</i> is set to <b>TRUE</b>. Otherwise, <i>AccessStatus</i> is set to <b>FALSE</b>.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectcloseauditalarma">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-accesscheckandauditalarma
     * @since windows5.1.2600
     */
    static AccessCheckAndAuditAlarmA(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AccessCheckAndAuditAlarmA", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "uint", DesiredAccess, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccess, "ptr", AccessStatus, "ptr", pfGenerateOnClose, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {PSTR} ObjectTypeName A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSTR} ObjectName A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>. 
     * 
     * 
     * 
     * 
     * If the protected object does not represent a principal, set this parameter to <b>NULL</b>.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights. 
     * 
     * 
     * 
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the <i>GrantedAccess</i> access mask to indicate the maximum access rights the security descriptor allows the client.
     * @param {Integer} AuditType The type of audit to be generated. This can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-audit_event_type">AUDIT_EVENT_TYPE</a> enumeration type.
     * @param {Integer} Flags A flag that controls the function's behavior if the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID. 
     * 
     * 
     * 
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByTypeAndAuditAlarm</b> fails and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} ObjectTypeListLength The number of elements in the <i>ObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation A flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an access mask that receives the granted access rights. If <i>AccessStatus</i> is set to <b>FALSE</b>, the function sets the access mask to zero. If the function fails, it does not set the access mask.
     * @param {Pointer<BOOL>} AccessStatus A pointer to a variable that receives the results of the access check. If the security descriptor allows the requested access rights to the client, <i>AccessStatus</i> is set to <b>TRUE</b>. Otherwise, <i>AccessStatus</i> is set to <b>FALSE</b> and you can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectcloseauditalarma">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     *       
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-accesscheckbytypeandauditalarma
     * @since windows5.1.2600
     */
    static AccessCheckByTypeAndAuditAlarmA(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AccessCheckByTypeAndAuditAlarmA", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccess, "ptr", AccessStatus, "ptr", pfGenerateOnClose, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client being impersonated by the calling thread.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {PSTR} ObjectTypeName A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSTR} ObjectName A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID). If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE that contains the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>.
     * 
     * Set this parameter to <b>NULL</b> if the protected object does not represent a principal.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function so that it contains no generic access rights.
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the access mask in <i>GrantedAccess</i> to indicate the maximum access rights the security descriptor allows the client.
     * @param {Integer} AuditType The type of audit to be generated. This can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-audit_event_type">AUDIT_EVENT_TYPE</a> enumeration type.
     * @param {Integer} Flags A flag that controls the function's behavior if the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID.
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByTypeResultListAndAuditAlarm</b> fails, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} ObjectTypeListLength The number of elements in the <i>ObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation A flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an array of access masks. The function sets each access mask to indicate the access rights granted to the corresponding element in the object type list. If the function fails, it does not set the access masks.
     * @param {Pointer<UInt32>} AccessStatusList A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or to a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectcloseauditalarma">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-accesscheckbytyperesultlistandauditalarma
     * @since windows5.1.2600
     */
    static AccessCheckByTypeResultListAndAuditAlarmA(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatusList, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AccessCheckByTypeResultListAndAuditAlarmA", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccess, "uint*", AccessStatusList, "ptr", pfGenerateOnClose, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client that the calling thread is impersonating.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string that specifies the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value that represents the client's handle to the object. If the access is denied, the system ignores this value.
     * @param {HANDLE} ClientToken A handle to a token object that represents the client that requested the operation. This handle must be obtained through a communication session layer, such as a local named pipe, to prevent possible security policy violations. The caller must have TOKEN_QUERY access for the specified token.
     * @param {PSTR} ObjectTypeName A pointer to a null-terminated string that specifies the type of object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSTR} ObjectName A pointer to a null-terminated string that specifies the name of the object being created or accessed. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure against which access is checked.
     * @param {PSID} PrincipalSelfSid A pointer to a SID. If the security descriptor is associated with an object that represents a principal (for example, a user object), the <i>PrincipalSelfSid</i> parameter should be the SID of the object. When evaluating access, this SID logically replaces the SID in any ACE containing the well-known PRINCIPAL_SELF SID (S-1-5-10). For information about well-known SIDs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-known SIDs</a>.
     * 
     * Set this parameter to <b>NULL</b> if the protected object does not represent a principal.
     * @param {Integer} DesiredAccess An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the access rights to check. This mask must have been mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function so that it contains no generic access rights.
     * 
     * If this parameter is MAXIMUM_ALLOWED, the function sets the access mask in <i>GrantedAccess</i> to indicate the maximum access rights the security descriptor allows the client.
     * @param {Integer} AuditType The type of audit to be generated. This can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-audit_event_type">AUDIT_EVENT_TYPE</a> enumeration type.
     * @param {Integer} Flags A flag that controls the function's behavior if the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> does not have the SE_AUDIT_NAME privilege enabled. If the AUDIT_ALLOW_NO_PRIVILEGE flag is set, the function performs the access check without generating audit messages when the privilege is not enabled. If this parameter is zero, the function fails if the privilege is not enabled.
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that identify the hierarchy of object types for which to check access. Each element in the array specifies a GUID that identifies the object type and a value that indicates the level of the object type in the hierarchy of object types. The array should not have two elements with the same GUID.
     * 
     * The array must have at least one element. The first element in the array must be at level zero and identify the object itself. The array can have only one level zero element. The second element is a subobject, such as a property set, at level 1. Following each level 1 entry are subordinate entries for the level 2 through 4 subobjects. Thus, the levels for the elements in the array might be {0, 1, 2, 2, 1, 2, 3}. If the object type list is out of order, <b>AccessCheckByTypeResultListAndAuditAlarmByHandle</b> fails, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INVALID_PARAMETER.
     * @param {Integer} ObjectTypeListLength The number of elements in the <i>ObjectTypeList</i> array.
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-generic_mapping">GENERIC_MAPPING</a> structure associated with the object for which access is being checked.
     * @param {BOOL} ObjectCreation A flag that determines whether the calling application will create a new object when access is granted. A value of <b>TRUE</b> indicates the application will create a new object. A value of <b>FALSE</b> indicates the application will open an existing object.
     * @param {Pointer<UInt32>} GrantedAccess A pointer to an array of access masks. The function sets each access mask to indicate the access rights granted to the corresponding element in the object type list. If the function fails, it does not set the access masks.
     * @param {Pointer<UInt32>} AccessStatusList A pointer to an array of status codes for the corresponding elements in the object type list. The function sets an element to zero to indicate success or to a nonzero value to indicate the specific error during the access check. If the function fails, it does not set any of the elements in the array.
     * @param {Pointer<BOOL>} pfGenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. Pass this flag to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectcloseauditalarma">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-accesscheckbytyperesultlistandauditalarmbyhandlea
     * @since windows5.1.2600
     */
    static AccessCheckByTypeResultListAndAuditAlarmByHandleA(SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatusList, pfGenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AccessCheckByTypeResultListAndAuditAlarmByHandleA", "ptr", SubsystemName, "ptr", HandleId, "ptr", ClientToken, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "ptr", ObjectCreation, "uint*", GrantedAccess, "uint*", AccessStatusList, "ptr", pfGenerateOnClose, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates audit messages when a client application attempts to gain access to an object or to create a new one.
     * @param {PSTR} SubsystemName A pointer to a <b>null</b>-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A pointer to a unique value representing the client's handle to the object. If the access is denied, this parameter is ignored.  
     * 
     * 
     * 
     * 
     * For cross-platform compatibility, the value addressed by this pointer must be sizeof(LPVOID) bytes long.
     * @param {PSTR} ObjectTypeName A pointer to a <b>null</b>-terminated string specifying the type of object to which the client is requesting access. This string appears in any audit message that the function generates.
     * @param {PSTR} ObjectName A pointer to a <b>null</b>-terminated string specifying the name of the object to which the client is requesting access. This string appears in any audit message that the function generates.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure for the object being accessed.
     * @param {HANDLE} ClientToken Identifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> representing the client requesting the operation. This handle must be obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access.
     * @param {Integer} DesiredAccess Specifies the desired <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a>. This mask must have been previously mapped by the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function to contain no generic access rights.
     * @param {Integer} GrantedAccess Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> indicating which access rights are granted. This access mask is intended to be the same value set by one of the access-checking functions in its <i>GrantedAccess</i> parameter. Examples of access-checking functions include <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-accesscheckandauditalarma">AccessCheckAndAuditAlarm</a> and <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a>.
     * @param {Pointer<PRIVILEGE_SET>} Privileges A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure that specifies the set of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> required for the access attempt. This parameter can be <b>NULL</b>.
     * @param {BOOL} ObjectCreation Specifies a flag that determines whether the application creates a new object when access is granted. When this value is <b>TRUE</b>, the application creates a new object; when it is <b>FALSE</b>, the application opens an existing object.
     * @param {BOOL} AccessGranted Specifies a flag indicating whether access was granted or denied in a previous call to an access-checking function, such as <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a>. If access was granted, this value is <b>TRUE</b>. If not, it is <b>FALSE</b>.
     * @param {Pointer<BOOL>} GenerateOnClose A pointer to a flag set by the audit-generation routine when the function returns. This value must be passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectcloseauditalarma">ObjectCloseAuditAlarm</a> function when the object handle is closed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-objectopenauditalarma
     * @since windows5.1.2600
     */
    static ObjectOpenAuditAlarmA(SubsystemName, HandleId, ObjectTypeName, ObjectName, pSecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ObjectTypeName := ObjectTypeName is String ? StrPtr(ObjectTypeName) : ObjectTypeName
        ObjectName := ObjectName is String ? StrPtr(ObjectName) : ObjectName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ObjectOpenAuditAlarmA", "ptr", SubsystemName, "ptr", HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", pSecurityDescriptor, "ptr", ClientToken, "uint", DesiredAccess, "uint", GrantedAccess, "ptr", Privileges, "ptr", ObjectCreation, "ptr", AccessGranted, "ptr", GenerateOnClose, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates an audit message in the security event log.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in the audit message.
     * @param {Pointer<Void>} HandleId A pointer to a unique value representing the client's handle to the object.
     * @param {HANDLE} ClientToken Identifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> representing the client that requested the operation. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access. The function uses this token to get the identity of the client for the audit message.
     * @param {Integer} DesiredAccess Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> indicating the privileged access types being used or whose use is being attempted. The access mask can be mapped by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-mapgenericmask">MapGenericMask</a> function so it does not contain any generic access types.
     * @param {Pointer<PRIVILEGE_SET>} Privileges A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> that the client attempted to use. The names of the privileges appear in the audit message.
     * @param {BOOL} AccessGranted Indicates whether the client's attempt to use the privileges was successful. If this value is <b>TRUE</b>, the audit message indicates success. If this value is <b>FALSE</b>, the audit message indicates failure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-objectprivilegeauditalarma
     * @since windows5.1.2600
     */
    static ObjectPrivilegeAuditAlarmA(SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ObjectPrivilegeAuditAlarmA", "ptr", SubsystemName, "ptr", HandleId, "ptr", ClientToken, "uint", DesiredAccess, "ptr", Privileges, "ptr", AccessGranted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates an audit message in the security event log when a handle to a private object is deleted.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId A unique value representing the client's handle to the object. This should be the same value that was passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-accesscheckandauditalarma">AccessCheckAndAuditAlarm</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectopenauditalarma">ObjectOpenAuditAlarm</a> function.
     * @param {BOOL} GenerateOnClose Specifies a flag set by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-accesscheckandauditalarma">AccessCheckAndAuditAlarm</a> or <b>ObjectCloseAuditAlarm</b> function when the object handle is created. If this flag is <b>TRUE</b>, the function generates an audit message. If it is <b>FALSE</b>, the function does not generate an audit message.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-objectcloseauditalarma
     * @since windows5.1.2600
     */
    static ObjectCloseAuditAlarmA(SubsystemName, HandleId, GenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ObjectCloseAuditAlarmA", "ptr", SubsystemName, "ptr", HandleId, "ptr", GenerateOnClose, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates audit messages when an object is deleted.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This string appears in any audit message that the function generates.
     * @param {Pointer<Void>} HandleId Specifies a unique value representing the client's handle to the object. This must be the same value that was passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-accesscheckandauditalarma">AccessCheckAndAuditAlarm</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectopenauditalarma">ObjectOpenAuditAlarm</a> function.
     * @param {BOOL} GenerateOnClose Specifies a flag set by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-accesscheckandauditalarma">AccessCheckAndAuditAlarm</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-objectopenauditalarma">ObjectOpenAuditAlarm</a> function when the object handle is created.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-objectdeleteauditalarma
     * @since windows5.1.2600
     */
    static ObjectDeleteAuditAlarmA(SubsystemName, HandleId, GenerateOnClose) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ObjectDeleteAuditAlarmA", "ptr", SubsystemName, "ptr", HandleId, "ptr", GenerateOnClose, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates an audit message in the security event log.
     * @param {PSTR} SubsystemName A pointer to a null-terminated string specifying the name of the subsystem calling the function. This information appears in the security event log record.
     * @param {PSTR} ServiceName A pointer to a null-terminated string specifying the name of the privileged subsystem service. This information appears in the security event log record.
     * @param {HANDLE} ClientToken Identifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> representing the client that requested the operation. This handle must have been obtained by opening the token of a thread impersonating the client. The token must be open for TOKEN_QUERY access. The function uses this token to get the identity of the client for the security event log record.
     * @param {Pointer<PRIVILEGE_SET>} Privileges A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure containing the privileges that the client attempted to use. The names of the privileges appear in the security event log record.
     * @param {BOOL} AccessGranted Indicates whether the client's attempt to use the privileges was successful. If this value is <b>TRUE</b>, the security event log record indicates success. If this value is <b>FALSE</b>, the security event log record indicates failure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-privilegedserviceauditalarma
     * @since windows5.1.2600
     */
    static PrivilegedServiceAuditAlarmA(SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted) {
        SubsystemName := SubsystemName is String ? StrPtr(SubsystemName) : SubsystemName
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\PrivilegedServiceAuditAlarmA", "ptr", SubsystemName, "ptr", ServiceName, "ptr", ClientToken, "ptr", Privileges, "ptr", AccessGranted, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a conditional access control entry (ACE) to the specified access control list (ACL).
     * @param {Pointer<ACL>} pAcl A pointer to an 
     * ACL. This function adds an ACE to this ACL.
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * @param {Integer} dwAceRevision Specifies the revision level of the ACL being modified. This value can be ACL_REVISION or ACL_REVISION_DS. 
     *       Use ACL_REVISION_DS if the ACL contains object-specific ACEs.
     * @param {Integer} AceFlags A set of bit flags that control ACE inheritance. The function sets these flags in the <b>AceFlags</b> member of the
     * @param {Integer} AceType The type of the ACE.
     * @param {Integer} AccessMask Specifies the mask of access rights to be granted to the specified SID.
     * @param {PSID} pSid A pointer to the 
     * SID  that represents a user, group, or logon account being granted access.
     * @param {PWSTR} ConditionStr A string that specifies the conditional statement to be evaluated for the ACE.
     * @param {Pointer<UInt32>} ReturnLength The size, in bytes, of the ACL. If the buffer specified by the <i>pACL</i> parameter is not of sufficient size, the value of this parameter is the required size.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
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
     * The new ACE does not fit into the <i>pAcl</i> buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-addconditionalace
     * @since windows6.1
     */
    static AddConditionalAce(pAcl, dwAceRevision, AceFlags, AceType, AccessMask, pSid, ConditionStr, ReturnLength) {
        ConditionStr := ConditionStr is String ? StrPtr(ConditionStr) : ConditionStr

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\AddConditionalAce", "ptr", pAcl, "uint", dwAceRevision, "uint", AceFlags, "char", AceType, "uint", AccessMask, "ptr", pSid, "ptr", ConditionStr, "uint*", ReturnLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the security of a file or directory object.
     * @param {PSTR} lpFileName A pointer to a null-terminated string that specifies the file or directory for which security is set. Note that security applied to a directory is not inherited by its children.
     * @param {Integer} SecurityInformation Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that identifies the contents of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> pointed to by the <i>pSecurityDescriptor</i> parameter.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setfilesecuritya
     * @since windows5.1.2600
     */
    static SetFileSecurityA(lpFileName, SecurityInformation, pSecurityDescriptor) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetFileSecurityA", "ptr", lpFileName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Obtains specified information about the security of a file or directory. The information obtained is constrained by the caller's access rights and privileges.
     * @param {PSTR} lpFileName A pointer to a null-terminated string that specifies the file or directory for which security information is retrieved.
     * @param {Integer} RequestedInformation A 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that identifies the security information being requested.
     * @param {Pointer} pSecurityDescriptor A pointer to a buffer that receives a copy of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the object specified by the <i>lpFileName</i> parameter. The calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> must have permission to view the specified aspects of the object's security status. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is returned in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative security descriptor</a> format.
     * @param {Integer} nLength Specifies the size, in bytes, of the buffer pointed to by the <i>pSecurityDescriptor</i> parameter.
     * @param {Pointer<UInt32>} lpnLengthNeeded A pointer to the variable that receives the number of bytes necessary to store the complete <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a>. If the returned number of bytes is less than or equal to <i>nLength</i>, the entire security descriptor is returned in the output buffer; otherwise, none of the descriptor is returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getfilesecuritya
     * @since windows5.1.2600
     */
    static GetFileSecurityA(lpFileName, RequestedInformation, pSecurityDescriptor, nLength, lpnLengthNeeded) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetFileSecurityA", "ptr", lpFileName, "uint", RequestedInformation, "ptr", pSecurityDescriptor, "uint", nLength, "uint*", lpnLengthNeeded, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Accepts a security identifier (SID) as input. It retrieves the name of the account for this SID and the name of the first domain on which this SID is found.
     * @param {PSTR} lpSystemName A pointer to a <b>null</b>-terminated character string that specifies the target computer. This string can be the name of a remote computer. If this parameter is <b>NULL</b>, the account name translation begins on the local system. If the name cannot be resolved on the local system, this function will try to resolve the name using domain controllers trusted by the local system. Generally, specify a value for  <i>lpSystemName</i> only when the  account is in an untrusted domain and the   name of a computer in that domain is known.
     * @param {PSID} Sid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> to look up.
     * @param {PSTR} Name A pointer to a buffer that receives a <b>null</b>-terminated string that contains the account name that corresponds to the <i>lpSid</i> parameter.
     * @param {Pointer<UInt32>} cchName On input, specifies the size, in <b>TCHAR</b>s, of the <i>lpName</i> buffer. If the function fails because the buffer is too small or if <i>cchName</i> is zero, <i>cchName</i> receives the required buffer size, including the terminating <b>null</b> character.
     * @param {PSTR} ReferencedDomainName A pointer to a buffer that receives a <b>null</b>-terminated string that contains the name of the domain where the account name was found.
     * 
     * On a server, the domain name returned for most accounts in the security database of the local computer is the name of the domain for which the server is a domain controller.
     * 						
     * 
     * On a workstation, the domain name returned for most accounts in the security database of the local computer is the name of the computer as of the last start of the system (backslashes are excluded). If the name of the computer changes, the old name continues to be returned as the domain name until the system is restarted.
     * 
     * Some accounts are predefined by the system. The domain name returned for these accounts is BUILTIN.
     * @param {Pointer<UInt32>} cchReferencedDomainName On input, specifies the size, in <b>TCHAR</b>s, of the <i>lpReferencedDomainName</i> buffer. If the function fails because the buffer is too small or if <i>cchReferencedDomainName</i> is zero, <i>cchReferencedDomainName</i> receives the required buffer size, including the terminating <b>null</b> character.
     * @param {Pointer<Int32>} peUse A pointer to a variable that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> value that indicates the type of the account.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupaccountsida
     * @since windows5.1.2600
     */
    static LookupAccountSidA(lpSystemName, Sid, Name, cchName, ReferencedDomainName, cchReferencedDomainName, peUse) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        Name := Name is String ? StrPtr(Name) : Name
        ReferencedDomainName := ReferencedDomainName is String ? StrPtr(ReferencedDomainName) : ReferencedDomainName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupAccountSidA", "ptr", lpSystemName, "ptr", Sid, "ptr", Name, "uint*", cchName, "ptr", ReferencedDomainName, "uint*", cchReferencedDomainName, "int*", peUse, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Accepts a security identifier (SID) as input. It retrieves the name of the account for this SID and the name of the first domain on which this SID is found.
     * @param {PWSTR} lpSystemName A pointer to a <b>null</b>-terminated character string that specifies the target computer. This string can be the name of a remote computer. If this parameter is <b>NULL</b>, the account name translation begins on the local system. If the name cannot be resolved on the local system, this function will try to resolve the name using domain controllers trusted by the local system. Generally, specify a value for  <i>lpSystemName</i> only when the  account is in an untrusted domain and the   name of a computer in that domain is known.
     * @param {PSID} Sid A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> to look up.
     * @param {PWSTR} Name A pointer to a buffer that receives a <b>null</b>-terminated string that contains the account name that corresponds to the <i>lpSid</i> parameter.
     * @param {Pointer<UInt32>} cchName On input, specifies the size, in <b>TCHAR</b>s, of the <i>lpName</i> buffer. If the function fails because the buffer is too small or if <i>cchName</i> is zero, <i>cchName</i> receives the required buffer size, including the terminating <b>null</b> character.
     * @param {PWSTR} ReferencedDomainName A pointer to a buffer that receives a <b>null</b>-terminated string that contains the name of the domain where the account name was found.
     * 
     * On a server, the domain name returned for most accounts in the security database of the local computer is the name of the domain for which the server is a domain controller.
     * 						
     * 
     * On a workstation, the domain name returned for most accounts in the security database of the local computer is the name of the computer as of the last start of the system (backslashes are excluded). If the name of the computer changes, the old name continues to be returned as the domain name until the system is restarted.
     * 
     * Some accounts are predefined by the system. The domain name returned for these accounts is BUILTIN.
     * @param {Pointer<UInt32>} cchReferencedDomainName On input, specifies the size, in <b>TCHAR</b>s, of the <i>lpReferencedDomainName</i> buffer. If the function fails because the buffer is too small or if <i>cchReferencedDomainName</i> is zero, <i>cchReferencedDomainName</i> receives the required buffer size, including the terminating <b>null</b> character.
     * @param {Pointer<Int32>} peUse A pointer to a variable that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> value that indicates the type of the account.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupaccountsidw
     * @since windows5.1.2600
     */
    static LookupAccountSidW(lpSystemName, Sid, Name, cchName, ReferencedDomainName, cchReferencedDomainName, peUse) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        Name := Name is String ? StrPtr(Name) : Name
        ReferencedDomainName := ReferencedDomainName is String ? StrPtr(ReferencedDomainName) : ReferencedDomainName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupAccountSidW", "ptr", lpSystemName, "ptr", Sid, "ptr", Name, "uint*", cchName, "ptr", ReferencedDomainName, "uint*", cchReferencedDomainName, "int*", peUse, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Accepts the name of a system and an account as input. It retrieves a security identifier (SID) for the account and the name of the domain on which the account was found.
     * @param {PSTR} lpSystemName A pointer to a <b>null</b>-terminated character string that specifies the name of the system. This string can be the name of a remote computer. If this string is <b>NULL</b>, the account name translation begins on the local system. If the name cannot be resolved on the local system, this function will try to resolve the name using domain controllers trusted by the local system. Generally, specify a value for  <i>lpSystemName</i> only when the  account is in an untrusted domain and the   name of a computer in that domain is known.
     * @param {PSTR} lpAccountName A pointer to a <b>null</b>-terminated string that specifies the account name.
     * 
     * Use a fully qualified string in the domain_name\user_name format to ensure that <b>LookupAccountName</b> finds the account in the desired domain.
     * @param {Pointer} Sid A pointer to a buffer that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that corresponds to the account name pointed to by the <i>lpAccountName</i> parameter. If this parameter is <b>NULL</b>, <i>cbSid</i> must be zero.
     * @param {Pointer<UInt32>} cbSid A pointer to a variable. On input, this value specifies the size, in bytes, of the <i>Sid</i> buffer. If the function fails because the buffer is too small or if <i>cbSid</i> is zero, this variable receives the required buffer size.
     * @param {PSTR} ReferencedDomainName A pointer to a buffer that receives the name of the domain where the account name is found. For computers that are not joined to a domain, this buffer receives the computer name. If this parameter is <b>NULL</b>, the function returns the required buffer size.
     * @param {Pointer<UInt32>} cchReferencedDomainName A pointer to a variable. On input, this value specifies the size, in <b>TCHAR</b>s, of the <i>ReferencedDomainName</i> buffer. If the function fails because the buffer is too small, this variable receives the required buffer size, including the terminating <b>null</b> character. If the <i>ReferencedDomainName</i> parameter is <b>NULL</b>, this parameter must be zero.
     * @param {Pointer<Int32>} peUse A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumerated type that indicates the type of the account when the function returns.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupaccountnamea
     * @since windows5.1.2600
     */
    static LookupAccountNameA(lpSystemName, lpAccountName, Sid, cbSid, ReferencedDomainName, cchReferencedDomainName, peUse) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpAccountName := lpAccountName is String ? StrPtr(lpAccountName) : lpAccountName
        ReferencedDomainName := ReferencedDomainName is String ? StrPtr(ReferencedDomainName) : ReferencedDomainName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupAccountNameA", "ptr", lpSystemName, "ptr", lpAccountName, "ptr", Sid, "uint*", cbSid, "ptr", ReferencedDomainName, "uint*", cchReferencedDomainName, "int*", peUse, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Accepts the name of a system and an account as input. It retrieves a security identifier (SID) for the account and the name of the domain on which the account was found.
     * @param {PWSTR} lpSystemName A pointer to a <b>null</b>-terminated character string that specifies the name of the system. This string can be the name of a remote computer. If this string is <b>NULL</b>, the account name translation begins on the local system. If the name cannot be resolved on the local system, this function will try to resolve the name using domain controllers trusted by the local system. Generally, specify a value for  <i>lpSystemName</i> only when the  account is in an untrusted domain and the   name of a computer in that domain is known.
     * @param {PWSTR} lpAccountName A pointer to a <b>null</b>-terminated string that specifies the account name.
     * 
     * Use a fully qualified string in the domain_name\user_name format to ensure that <b>LookupAccountName</b> finds the account in the desired domain.
     * @param {Pointer} Sid A pointer to a buffer that receives the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that corresponds to the account name pointed to by the <i>lpAccountName</i> parameter. If this parameter is <b>NULL</b>, <i>cbSid</i> must be zero.
     * @param {Pointer<UInt32>} cbSid A pointer to a variable. On input, this value specifies the size, in bytes, of the <i>Sid</i> buffer. If the function fails because the buffer is too small or if <i>cbSid</i> is zero, this variable receives the required buffer size.
     * @param {PWSTR} ReferencedDomainName A pointer to a buffer that receives the name of the domain where the account name is found. For computers that are not joined to a domain, this buffer receives the computer name. If this parameter is <b>NULL</b>, the function returns the required buffer size.
     * @param {Pointer<UInt32>} cchReferencedDomainName A pointer to a variable. On input, this value specifies the size, in <b>TCHAR</b>s, of the <i>ReferencedDomainName</i> buffer. If the function fails because the buffer is too small, this variable receives the required buffer size, including the terminating <b>null</b> character. If the <i>ReferencedDomainName</i> parameter is <b>NULL</b>, this parameter must be zero.
     * @param {Pointer<Int32>} peUse A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SID_NAME_USE</a> enumerated type that indicates the type of the account when the function returns.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupaccountnamew
     * @since windows5.1.2600
     */
    static LookupAccountNameW(lpSystemName, lpAccountName, Sid, cbSid, ReferencedDomainName, cchReferencedDomainName, peUse) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpAccountName := lpAccountName is String ? StrPtr(lpAccountName) : lpAccountName
        ReferencedDomainName := ReferencedDomainName is String ? StrPtr(ReferencedDomainName) : ReferencedDomainName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupAccountNameW", "ptr", lpSystemName, "ptr", lpAccountName, "ptr", Sid, "uint*", cbSid, "ptr", ReferencedDomainName, "uint*", cchReferencedDomainName, "int*", peUse, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the locally unique identifier (LUID) used on a specified system to locally represent the specified privilege name.
     * @param {PSTR} lpSystemName A pointer to a null-terminated string that specifies the name of the system on which the privilege name is retrieved. If a null string is specified, the function attempts to find the privilege name on the local system.
     * @param {PSTR} lpName A pointer to a null-terminated string that specifies the name of the privilege, as defined in the Winnt.h header file. For example, this parameter could specify the constant, SE_SECURITY_NAME, or its corresponding string, "SeSecurityPrivilege".
     * @param {Pointer<LUID>} lpLuid A pointer to a variable that receives the LUID by which the privilege is known on the system specified by the <i>lpSystemName</i> parameter.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 						
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupprivilegevaluea
     * @since windows5.1.2600
     */
    static LookupPrivilegeValueA(lpSystemName, lpName, lpLuid) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupPrivilegeValueA", "ptr", lpSystemName, "ptr", lpName, "ptr", lpLuid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the locally unique identifier (LUID) used on a specified system to locally represent the specified privilege name.
     * @param {PWSTR} lpSystemName A pointer to a null-terminated string that specifies the name of the system on which the privilege name is retrieved. If a null string is specified, the function attempts to find the privilege name on the local system.
     * @param {PWSTR} lpName A pointer to a null-terminated string that specifies the name of the privilege, as defined in the Winnt.h header file. For example, this parameter could specify the constant, SE_SECURITY_NAME, or its corresponding string, "SeSecurityPrivilege".
     * @param {Pointer<LUID>} lpLuid A pointer to a variable that receives the LUID by which the privilege is known on the system specified by the <i>lpSystemName</i> parameter.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 						
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupprivilegevaluew
     * @since windows5.1.2600
     */
    static LookupPrivilegeValueW(lpSystemName, lpName, lpLuid) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupPrivilegeValueW", "ptr", lpSystemName, "ptr", lpName, "ptr", lpLuid, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name that corresponds to the privilege represented on a specific system by a specified locally unique identifier (LUID).
     * @param {PSTR} lpSystemName A pointer to a null-terminated string that specifies the name of the system on which the privilege name is retrieved. If a null string is specified, the function attempts to find the privilege name on the local system.
     * @param {Pointer<LUID>} lpLuid A pointer to the LUID by which the privilege is known on the target system.
     * @param {PSTR} lpName A pointer to a buffer that receives a null-terminated string that represents the privilege name. For example, this string could be "SeSecurityPrivilege".
     * @param {Pointer<UInt32>} cchName A pointer to a variable that specifies the size, in a <b>TCHAR</b> value, of the <i>lpName</i> buffer. When the function returns, this parameter contains the length of the privilege name, not including the terminating null character. If the buffer pointed to by the <i>lpName</i> parameter is too small, this variable contains the required size.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 						
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupprivilegenamea
     * @since windows5.1.2600
     */
    static LookupPrivilegeNameA(lpSystemName, lpLuid, lpName, cchName) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupPrivilegeNameA", "ptr", lpSystemName, "ptr", lpLuid, "ptr", lpName, "uint*", cchName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name that corresponds to the privilege represented on a specific system by a specified locally unique identifier (LUID).
     * @param {PWSTR} lpSystemName A pointer to a null-terminated string that specifies the name of the system on which the privilege name is retrieved. If a null string is specified, the function attempts to find the privilege name on the local system.
     * @param {Pointer<LUID>} lpLuid A pointer to the LUID by which the privilege is known on the target system.
     * @param {PWSTR} lpName A pointer to a buffer that receives a null-terminated string that represents the privilege name. For example, this string could be "SeSecurityPrivilege".
     * @param {Pointer<UInt32>} cchName A pointer to a variable that specifies the size, in a <b>TCHAR</b> value, of the <i>lpName</i> buffer. When the function returns, this parameter contains the length of the privilege name, not including the terminating null character. If the buffer pointed to by the <i>lpName</i> parameter is too small, this variable contains the required size.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 						
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupprivilegenamew
     * @since windows5.1.2600
     */
    static LookupPrivilegeNameW(lpSystemName, lpLuid, lpName, cchName) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupPrivilegeNameW", "ptr", lpSystemName, "ptr", lpLuid, "ptr", lpName, "uint*", cchName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name that represents a specified privilege.
     * @param {PSTR} lpSystemName A pointer to a null-terminated string that specifies the name of the system on which the  privilege name is retrieved. If a null string is specified, the function attempts to find the display name on the local system.
     * @param {PSTR} lpName A pointer to a null-terminated string that specifies the name of the privilege, as defined in Winnt.h. For example, this parameter could specify the constant, SE_REMOTE_SHUTDOWN_NAME, or its corresponding string, "SeRemoteShutdownPrivilege". For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">Privilege Constants</a>.
     * @param {PSTR} lpDisplayName A pointer to a buffer that receives a null-terminated string that specifies the privilege display name. For example, if the <i>lpName</i> parameter is SE_REMOTE_SHUTDOWN_NAME, the privilege display name is "Force shutdown from a remote system."
     * @param {Pointer<UInt32>} cchDisplayName A pointer to a variable that specifies the size, in <b>TCHAR</b>s, of the <i>lpDisplayName</i> buffer. When the function returns, this parameter contains the length of the privilege display name, not including the terminating null character. If the buffer pointed to by the <i>lpDisplayName</i> parameter is too small, this variable contains the required size.
     * @param {Pointer<UInt32>} lpLanguageId A pointer to a variable that receives the language identifier for the returned display name.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupprivilegedisplaynamea
     * @since windows5.1.2600
     */
    static LookupPrivilegeDisplayNameA(lpSystemName, lpName, lpDisplayName, cchDisplayName, lpLanguageId) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupPrivilegeDisplayNameA", "ptr", lpSystemName, "ptr", lpName, "ptr", lpDisplayName, "uint*", cchDisplayName, "uint*", lpLanguageId, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name that represents a specified privilege.
     * @param {PWSTR} lpSystemName A pointer to a null-terminated string that specifies the name of the system on which the  privilege name is retrieved. If a null string is specified, the function attempts to find the display name on the local system.
     * @param {PWSTR} lpName A pointer to a null-terminated string that specifies the name of the privilege, as defined in Winnt.h. For example, this parameter could specify the constant, SE_REMOTE_SHUTDOWN_NAME, or its corresponding string, "SeRemoteShutdownPrivilege". For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privilege-constants">Privilege Constants</a>.
     * @param {PWSTR} lpDisplayName A pointer to a buffer that receives a null-terminated string that specifies the privilege display name. For example, if the <i>lpName</i> parameter is SE_REMOTE_SHUTDOWN_NAME, the privilege display name is "Force shutdown from a remote system."
     * @param {Pointer<UInt32>} cchDisplayName A pointer to a variable that specifies the size, in <b>TCHAR</b>s, of the <i>lpDisplayName</i> buffer. When the function returns, this parameter contains the length of the privilege display name, not including the terminating null character. If the buffer pointed to by the <i>lpDisplayName</i> parameter is too small, this variable contains the required size.
     * @param {Pointer<UInt32>} lpLanguageId A pointer to a variable that receives the language identifier for the returned display name.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-lookupprivilegedisplaynamew
     * @since windows5.1.2600
     */
    static LookupPrivilegeDisplayNameW(lpSystemName, lpName, lpDisplayName, cchDisplayName, lpLanguageId) {
        lpSystemName := lpSystemName is String ? StrPtr(lpSystemName) : lpSystemName
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LookupPrivilegeDisplayNameW", "ptr", lpSystemName, "ptr", lpName, "ptr", lpDisplayName, "uint*", cchDisplayName, "uint*", lpLanguageId, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Win32 LogonUser function attempts to log a user on to the local computer. LogonUser returns a handle to a user token that you can use to impersonate user.
     * @param {PSTR} lpszUsername A pointer to a null-terminated string that specifies the name of the user. This is the name of the user account to log on to. If you use the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format, <i>User</i><b>@</b><i>DNSDomainName</i>, the <i>lpszDomain</i> parameter must be <b>NULL</b>.
     * @param {PSTR} lpszDomain A pointer to a null-terminated string that specifies the name of the domain or server whose account database contains the <i>lpszUsername</i> account. If this parameter is <b>NULL</b>, the user name must be specified in UPN format. If this parameter is ".", the function validates the account by using only the local account database.
     * @param {PSTR} lpszPassword A pointer to a null-terminated string that specifies the plaintext password for the user account specified by <i>lpszUsername</i>.  When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} dwLogonType 
     * @param {Integer} dwLogonProvider 
     * @param {Pointer<HANDLE>} phToken A pointer to a handle variable that receives a handle to a token that represents the specified user.
     * 
     * You can use the returned handle in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> function.
     * 
     * In most cases, the returned handle is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a> that you can use in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a> function. However, if you specify the LOGON32_LOGON_NETWORK flag, <b>LogonUser</b> returns an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> that you cannot use in <b>CreateProcessAsUser</b> unless you call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a> to convert it to a primary token.
     * 
     * When you no longer need this handle, close it by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-logonusera
     * @since windows5.1.2600
     */
    static LogonUserA(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken) {
        lpszUsername := lpszUsername is String ? StrPtr(lpszUsername) : lpszUsername
        lpszDomain := lpszDomain is String ? StrPtr(lpszDomain) : lpszDomain
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LogonUserA", "ptr", lpszUsername, "ptr", lpszDomain, "ptr", lpszPassword, "uint", dwLogonType, "uint", dwLogonProvider, "ptr", phToken, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The Win32 LogonUser function attempts to log a user on to the local computer. LogonUser returns a handle to a user token that you can use to impersonate user.
     * @param {PWSTR} lpszUsername A pointer to a null-terminated string that specifies the name of the user. This is the name of the user account to log on to. If you use the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format, <i>User</i><b>@</b><i>DNSDomainName</i>, the <i>lpszDomain</i> parameter must be <b>NULL</b>.
     * @param {PWSTR} lpszDomain A pointer to a null-terminated string that specifies the name of the domain or server whose account database contains the <i>lpszUsername</i> account. If this parameter is <b>NULL</b>, the user name must be specified in UPN format. If this parameter is ".", the function validates the account by using only the local account database.
     * @param {PWSTR} lpszPassword A pointer to a null-terminated string that specifies the plaintext password for the user account specified by <i>lpszUsername</i>.  When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} dwLogonType 
     * @param {Integer} dwLogonProvider 
     * @param {Pointer<HANDLE>} phToken A pointer to a handle variable that receives a handle to a token that represents the specified user.
     * 
     * You can use the returned handle in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> function.
     * 
     * In most cases, the returned handle is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a> that you can use in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a> function. However, if you specify the LOGON32_LOGON_NETWORK flag, <b>LogonUser</b> returns an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> that you cannot use in <b>CreateProcessAsUser</b> unless you call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a> to convert it to a primary token.
     * 
     * When you no longer need this handle, close it by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @returns {BOOL} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, it returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-logonuserw
     * @since windows5.1.2600
     */
    static LogonUserW(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken) {
        lpszUsername := lpszUsername is String ? StrPtr(lpszUsername) : lpszUsername
        lpszDomain := lpszDomain is String ? StrPtr(lpszDomain) : lpszDomain
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LogonUserW", "ptr", lpszUsername, "ptr", lpszDomain, "ptr", lpszPassword, "uint", dwLogonType, "uint", dwLogonProvider, "ptr", phToken, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The LogonUserEx function attempts to log a user on to the local computer.
     * @param {PSTR} lpszUsername A pointer to a null-terminated string that specifies the name of the user. This is the name of the user account to log on to. If you use the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format, user@DNS_domain_name, the <i>lpszDomain</i> parameter must be <b>NULL</b>.
     * @param {PSTR} lpszDomain A pointer to a null-terminated string that specifies the name of the domain or server whose account database contains the <i>lpszUsername</i> account. If this parameter is <b>NULL</b>, the user name must be specified in UPN format. If this parameter is ".", the function validates the account by using only the local account database.
     * @param {PSTR} lpszPassword A pointer to a null-terminated string that specifies the plaintext password for the user account specified by <i>lpszUsername</i>.  When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} dwLogonType 
     * @param {Integer} dwLogonProvider 
     * @param {Pointer<HANDLE>} phToken A pointer to a handle variable that receives a handle to a token that represents the specified user.
     * 
     * You can use the returned handle in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> function.
     * 
     * In most cases, the returned handle is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a> that you can use in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a> function. However, if you specify the LOGON32_LOGON_NETWORK flag, <b>LogonUserEx</b> returns an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> that you cannot use in <b>CreateProcessAsUser</b> unless you call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a> to convert the impersonation token to a primary token.
     * 
     * When you no longer need this handle, close it by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @param {Pointer<PSID>} ppLogonSid A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) that receives the SID of the user logged on.
     * 
     * When you have finished using the SID, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @param {Pointer<Void>} ppProfileBuffer A pointer to a pointer that receives the address of a buffer that contains the logged on user's profile.
     * @param {Pointer<UInt32>} pdwProfileLength A pointer to a <b>DWORD</b> that receives the length of the profile buffer.
     * @param {Pointer<QUOTA_LIMITS>} pQuotaLimits A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-quota_limits">QUOTA_LIMITS</a> structure that receives information about the quotas for the logged on user.
     * @returns {BOOL} If the function succeeds, the function returns  nonzero.
     * 
     * If the function fails, it returns  zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-logonuserexa
     * @since windows5.1.2600
     */
    static LogonUserExA(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken, ppLogonSid, ppProfileBuffer, pdwProfileLength, pQuotaLimits) {
        lpszUsername := lpszUsername is String ? StrPtr(lpszUsername) : lpszUsername
        lpszDomain := lpszDomain is String ? StrPtr(lpszDomain) : lpszDomain
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LogonUserExA", "ptr", lpszUsername, "ptr", lpszDomain, "ptr", lpszPassword, "uint", dwLogonType, "uint", dwLogonProvider, "ptr", phToken, "ptr", ppLogonSid, "ptr", ppProfileBuffer, "uint*", pdwProfileLength, "ptr", pQuotaLimits, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The LogonUserEx function attempts to log a user on to the local computer.
     * @param {PWSTR} lpszUsername A pointer to a null-terminated string that specifies the name of the user. This is the name of the user account to log on to. If you use the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format, user@DNS_domain_name, the <i>lpszDomain</i> parameter must be <b>NULL</b>.
     * @param {PWSTR} lpszDomain A pointer to a null-terminated string that specifies the name of the domain or server whose account database contains the <i>lpszUsername</i> account. If this parameter is <b>NULL</b>, the user name must be specified in UPN format. If this parameter is ".", the function validates the account by using only the local account database.
     * @param {PWSTR} lpszPassword A pointer to a null-terminated string that specifies the plaintext password for the user account specified by <i>lpszUsername</i>.  When you have finished using the password, clear the password from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Integer} dwLogonType 
     * @param {Integer} dwLogonProvider 
     * @param {Pointer<HANDLE>} phToken A pointer to a handle variable that receives a handle to a token that represents the specified user.
     * 
     * You can use the returned handle in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> function.
     * 
     * In most cases, the returned handle is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary token</a> that you can use in calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a> function. However, if you specify the LOGON32_LOGON_NETWORK flag, <b>LogonUserEx</b> returns an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a> that you cannot use in <b>CreateProcessAsUser</b> unless you call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a> to convert the impersonation token to a primary token.
     * 
     * When you no longer need this handle, close it by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @param {Pointer<PSID>} ppLogonSid A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) that receives the SID of the user logged on.
     * 
     * When you have finished using the SID, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @param {Pointer<Void>} ppProfileBuffer A pointer to a pointer that receives the address of a buffer that contains the logged on user's profile.
     * @param {Pointer<UInt32>} pdwProfileLength A pointer to a <b>DWORD</b> that receives the length of the profile buffer.
     * @param {Pointer<QUOTA_LIMITS>} pQuotaLimits A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-quota_limits">QUOTA_LIMITS</a> structure that receives information about the quotas for the logged on user.
     * @returns {BOOL} If the function succeeds, the function returns  nonzero.
     * 
     * If the function fails, it returns  zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-logonuserexw
     * @since windows5.1.2600
     */
    static LogonUserExW(lpszUsername, lpszDomain, lpszPassword, dwLogonType, dwLogonProvider, phToken, ppLogonSid, ppProfileBuffer, pdwProfileLength, pQuotaLimits) {
        lpszUsername := lpszUsername is String ? StrPtr(lpszUsername) : lpszUsername
        lpszDomain := lpszDomain is String ? StrPtr(lpszDomain) : lpszDomain
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LogonUserExW", "ptr", lpszUsername, "ptr", lpszDomain, "ptr", lpszPassword, "uint", dwLogonType, "uint", dwLogonProvider, "ptr", phToken, "ptr", ppLogonSid, "ptr", ppProfileBuffer, "uint*", pdwProfileLength, "ptr", pQuotaLimits, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts a security identifier (SID) to its Unicode character representation.
     * @param {Pointer<UNICODE_STRING>} UnicodeString A pointer to the Unicode character representation of the security identifier.
     * @param {PSID} Sid A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that represents the security identifier.
     * @param {BOOLEAN} AllocateDestinationString If <b>TRUE</b>, then  <i>UnicodeString</i> is allocated on behalf of the caller, and it is the caller's responsibility to free the allocated memory by calling the <b>RtlFreeUnicodeString</b> function. If <b>FALSE</b>, the caller is responsible for allocating and freeing  <i>UnicodeString</i>.
     * @returns {NTSTATUS} The return value is an  NTSTATUS code. A value of STATUS_SUCCESS (0x00000000L) is returned if the function succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-rtlconvertsidtounicodestring
     * @since windows5.1.2600
     */
    static RtlConvertSidToUnicodeString(UnicodeString, Sid, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlConvertSidToUnicodeString", "ptr", UnicodeString, "ptr", Sid, "ptr", AllocateDestinationString, "ptr")
        return result
    }

;@endregion Methods
}
