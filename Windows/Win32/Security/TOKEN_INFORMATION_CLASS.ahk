#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the type of information being assigned to or retrieved from an access token.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-token_information_class
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_INFORMATION_CLASS{

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_user">TOKEN_USER</a> structure that contains the user account of the token.
     * @type {Integer (Int32)}
     */
    static TokenUser => 1

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the group accounts associated with the token.
     * @type {Integer (Int32)}
     */
    static TokenGroups => 2

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that contains the privileges of the token.
     * @type {Integer (Int32)}
     */
    static TokenPrivileges => 3

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_owner">TOKEN_OWNER</a> structure that contains the default owner <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) for newly created objects.
     * @type {Integer (Int32)}
     */
    static TokenOwner => 4

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_primary_group">TOKEN_PRIMARY_GROUP</a> structure that contains the default primary group SID for newly created objects.
     * @type {Integer (Int32)}
     */
    static TokenPrimaryGroup => 5

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_default_dacl">TOKEN_DEFAULT_DACL</a> structure that contains the default DACL for newly created objects.
     * @type {Integer (Int32)}
     */
    static TokenDefaultDacl => 6

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_source">TOKEN_SOURCE</a> structure that contains the source of the token. <b>TOKEN_QUERY_SOURCE</b> access is needed to retrieve this information.
     * @type {Integer (Int32)}
     */
    static TokenSource => 7

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_type">TOKEN_TYPE</a> value that indicates whether the token is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>.
     * @type {Integer (Int32)}
     */
    static TokenType => 8

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> value that indicates the impersonation level of the token. If the access token is not an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>, the function fails.
     * @type {Integer (Int32)}
     */
    static TokenImpersonationLevel => 9

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_statistics">TOKEN_STATISTICS</a> structure that contains various token statistics.
     * @type {Integer (Int32)}
     */
    static TokenStatistics => 10

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the list of restricting SIDs in a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/restricted-tokens">restricted token</a>.
     * @type {Integer (Int32)}
     */
    static TokenRestrictedSids => 11

    /**
     * The buffer receives a <b>DWORD</b> value that indicates the Terminal Services session identifier that is associated with the token.
     * 
     * If the token is associated with the terminal server client session, the session identifier is nonzero.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the token is associated with the terminal server console session, the session identifier is zero.
     * 
     * In a non-Terminal Services environment, the session identifier is zero.
     * 
     * If <b>TokenSessionId</b> is set with <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-settokeninformation">SetTokenInformation</a>, the application must have the <b>Act As Part Of the Operating System</b> privilege, and the application must be enabled to set the session ID in a token.
     * @type {Integer (Int32)}
     */
    static TokenSessionId => 12

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups_and_privileges">TOKEN_GROUPS_AND_PRIVILEGES</a> structure that contains the user SID, the group accounts, the restricted SIDs, and the authentication ID associated with the token.
     * @type {Integer (Int32)}
     */
    static TokenGroupsAndPrivileges => 13

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static TokenSessionReference => 14

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if the token includes the <b>SANDBOX_INERT</b> flag.
     * @type {Integer (Int32)}
     */
    static TokenSandBoxInert => 15

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static TokenAuditPolicy => 16

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_origin">TOKEN_ORIGIN</a> value. 
     * 
     * If the token  resulted from a logon that used explicit credentials, such as passing a name, domain, and password to the  <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function, then the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_origin">TOKEN_ORIGIN</a> structure will contain the ID of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> that created it.
     * 
     * If the token resulted from  network authentication, such as a call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext</a>  or a call to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> with <i>dwLogonType</i> set to <b>LOGON32_LOGON_NETWORK</b> or <b>LOGON32_LOGON_NETWORK_CLEARTEXT</b>, then this value will be zero.
     * @type {Integer (Int32)}
     */
    static TokenOrigin => 17

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_elevation_type">TOKEN_ELEVATION_TYPE</a> value that specifies the elevation level of the token.
     * @type {Integer (Int32)}
     */
    static TokenElevationType => 18

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_linked_token">TOKEN_LINKED_TOKEN</a> structure that contains a handle to another token that is linked to this token.
     * @type {Integer (Int32)}
     */
    static TokenLinkedToken => 19

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_elevation">TOKEN_ELEVATION</a> structure that specifies whether the token is elevated.
     * @type {Integer (Int32)}
     */
    static TokenElevation => 20

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if the token has ever been filtered.
     * @type {Integer (Int32)}
     */
    static TokenHasRestrictions => 21

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_access_information">TOKEN_ACCESS_INFORMATION</a> structure that specifies  security information contained in the token.
     * @type {Integer (Int32)}
     */
    static TokenAccessInformation => 22

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/v-gly">virtualization</a> is allowed for the token.
     * @type {Integer (Int32)}
     */
    static TokenVirtualizationAllowed => 23

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/v-gly">virtualization</a> is enabled for the token.
     * @type {Integer (Int32)}
     */
    static TokenVirtualizationEnabled => 24

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_mandatory_label">TOKEN_MANDATORY_LABEL</a> structure that specifies the token's integrity level.
     * @type {Integer (Int32)}
     */
    static TokenIntegrityLevel => 25

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if  the token has the UIAccess flag set.
     * @type {Integer (Int32)}
     */
    static TokenUIAccess => 26

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_mandatory_policy">TOKEN_MANDATORY_POLICY</a> structure that specifies the token's mandatory integrity policy.
     * @type {Integer (Int32)}
     */
    static TokenMandatoryPolicy => 27

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that specifies the token's logon SID.
     * @type {Integer (Int32)}
     */
    static TokenLogonSid => 28

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if the token is an app container token. Any callers who check the <b>TokenIsAppContainer</b> and have it return 0 should also verify that the caller token is not an identify level impersonation token. If the current token is not an app container but is an identity level token, you should return <b>AccessDenied</b>.
     * @type {Integer (Int32)}
     */
    static TokenIsAppContainer => 29

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the capabilities associated with the token.
     * @type {Integer (Int32)}
     */
    static TokenCapabilities => 30

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_appcontainer_information">TOKEN_APPCONTAINER_INFORMATION</a> structure that contains the AppContainerSid associated with the token. If the token is not associated with an app container, the <b>TokenAppContainer</b> member of the <b>TOKEN_APPCONTAINER_INFORMATION</b> structure points to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static TokenAppContainerSid => 31

    /**
     * The buffer receives a <b>DWORD</b> value that includes the   app container number for the token. For tokens that are not app container tokens, this value is zero.
     * @type {Integer (Int32)}
     */
    static TokenAppContainerNumber => 32

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-claim_security_attributes_information">CLAIM_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains the user claims associated with the token.
     * @type {Integer (Int32)}
     */
    static TokenUserClaimAttributes => 33

    /**
     * The buffer receives  a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-claim_security_attributes_information">CLAIM_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains the  device claims associated with the token.
     * @type {Integer (Int32)}
     */
    static TokenDeviceClaimAttributes => 34

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static TokenRestrictedUserClaimAttributes => 35

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static TokenRestrictedDeviceClaimAttributes => 36

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the device groups that are associated with the token.
     * @type {Integer (Int32)}
     */
    static TokenDeviceGroups => 37

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the restricted device groups that are associated with the token.
     * @type {Integer (Int32)}
     */
    static TokenRestrictedDeviceGroups => 38

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static TokenSecurityAttributes => 39

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static TokenIsRestricted => 40

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TokenProcessTrustLevel => 41

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TokenPrivateNameSpace => 42

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TokenSingletonAttributes => 43

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TokenBnoIsolation => 44

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TokenChildProcessFlags => 45

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TokenIsLessPrivilegedAppContainer => 46

    /**
     * @type {Integer (Int32)}
     */
    static TokenIsSandboxed => 47

    /**
     * @type {Integer (Int32)}
     */
    static TokenIsAppSilo => 48

    /**
     * @type {Integer (Int32)}
     */
    static TokenLoggingInformation => 49

    /**
     * @type {Integer (Int32)}
     */
    static TokenLearningMode => 50

    /**
     * The maximum value for this enumeration.
     * @type {Integer (Int32)}
     */
    static MaxTokenInfoClass => 51
}
