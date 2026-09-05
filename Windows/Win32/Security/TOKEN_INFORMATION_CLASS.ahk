#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of information being assigned to or retrieved from an access token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_information_class
 * @namespace Windows.Win32.Security
 */
class TOKEN_INFORMATION_CLASS extends Win32Enum {

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_user">TOKEN_USER</a> structure that contains the user account of the token.
     * Native name: TokenUser
     * @type {Integer (Int32)}
     */
    static User => 1

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the group accounts associated with the token.
     * Native name: TokenGroups
     * @type {Integer (Int32)}
     */
    static Groups => 2

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that contains the privileges of the token.
     * Native name: TokenPrivileges
     * @type {Integer (Int32)}
     */
    static Privileges => 3

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_owner">TOKEN_OWNER</a> structure that contains the default owner <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) for newly created objects.
     * Native name: TokenOwner
     * @type {Integer (Int32)}
     */
    static Owner => 4

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_primary_group">TOKEN_PRIMARY_GROUP</a> structure that contains the default primary group SID for newly created objects.
     * Native name: TokenPrimaryGroup
     * @type {Integer (Int32)}
     */
    static PrimaryGroup => 5

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_default_dacl">TOKEN_DEFAULT_DACL</a> structure that contains the default DACL for newly created objects.
     * Native name: TokenDefaultDacl
     * @type {Integer (Int32)}
     */
    static DefaultDacl => 6

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_source">TOKEN_SOURCE</a> structure that contains the source of the token. <b>TOKEN_QUERY_SOURCE</b> access is needed to retrieve this information.
     * Native name: TokenSource
     * @type {Integer (Int32)}
     */
    static Source => 7

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_type">TOKEN_TYPE</a> value that indicates whether the token is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">primary</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>.
     * Native name: TokenType
     * @type {Integer (Int32)}
     */
    static Type => 8

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> value that indicates the impersonation level of the token. If the access token is not an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">impersonation token</a>, the function fails.
     * Native name: TokenImpersonationLevel
     * @type {Integer (Int32)}
     */
    static ImpersonationLevel => 9

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_statistics">TOKEN_STATISTICS</a> structure that contains various token statistics.
     * Native name: TokenStatistics
     * @type {Integer (Int32)}
     */
    static Statistics => 10

    /**
     * The buffer receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the list of restricting SIDs in a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/restricted-tokens">restricted token</a>.
     * Native name: TokenRestrictedSids
     * @type {Integer (Int32)}
     */
    static RestrictedSids => 11

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
     * Native name: TokenSessionId
     * @type {Integer (Int32)}
     */
    static SessionId => 12

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups_and_privileges">TOKEN_GROUPS_AND_PRIVILEGES</a> structure that contains the user SID, the group accounts, the restricted SIDs, and the authentication ID associated with the token.
     * Native name: TokenGroupsAndPrivileges
     * @type {Integer (Int32)}
     */
    static GroupsAndPrivileges => 13

    /**
     * Reserved.
     * Native name: TokenSessionReference
     * @type {Integer (Int32)}
     */
    static SessionReference => 14

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if the token includes the <b>SANDBOX_INERT</b> flag.
     * Native name: TokenSandBoxInert
     * @type {Integer (Int32)}
     */
    static SandBoxInert => 15

    /**
     * Reserved.
     * Native name: TokenAuditPolicy
     * @type {Integer (Int32)}
     */
    static AuditPolicy => 16

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_origin">TOKEN_ORIGIN</a> value. 
     * 
     * If the token  resulted from a logon that used explicit credentials, such as passing a name, domain, and password to the  <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function, then the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_origin">TOKEN_ORIGIN</a> structure will contain the ID of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> that created it.
     * 
     * If the token resulted from  network authentication, such as a call to <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext</a>  or a call to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> with <i>dwLogonType</i> set to <b>LOGON32_LOGON_NETWORK</b> or <b>LOGON32_LOGON_NETWORK_CLEARTEXT</b>, then this value will be zero.
     * Native name: TokenOrigin
     * @type {Integer (Int32)}
     */
    static Origin => 17

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_elevation_type">TOKEN_ELEVATION_TYPE</a> value that specifies the elevation level of the token.
     * Native name: TokenElevationType
     * @type {Integer (Int32)}
     */
    static ElevationType => 18

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_linked_token">TOKEN_LINKED_TOKEN</a> structure that contains a handle to another token that is linked to this token.
     * Native name: TokenLinkedToken
     * @type {Integer (Int32)}
     */
    static LinkedToken => 19

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_elevation">TOKEN_ELEVATION</a> structure that specifies whether the token is elevated.
     * Native name: TokenElevation
     * @type {Integer (Int32)}
     */
    static Elevation => 20

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if the token has ever been filtered.
     * Native name: TokenHasRestrictions
     * @type {Integer (Int32)}
     */
    static HasRestrictions => 21

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_access_information">TOKEN_ACCESS_INFORMATION</a> structure that specifies  security information contained in the token.
     * Native name: TokenAccessInformation
     * @type {Integer (Int32)}
     */
    static AccessInformation => 22

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/v-gly">virtualization</a> is allowed for the token.
     * Native name: TokenVirtualizationAllowed
     * @type {Integer (Int32)}
     */
    static VirtualizationAllowed => 23

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/v-gly">virtualization</a> is enabled for the token.
     * Native name: TokenVirtualizationEnabled
     * @type {Integer (Int32)}
     */
    static VirtualizationEnabled => 24

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_mandatory_label">TOKEN_MANDATORY_LABEL</a> structure that specifies the token's integrity level.
     * Native name: TokenIntegrityLevel
     * @type {Integer (Int32)}
     */
    static IntegrityLevel => 25

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if  the token has the UIAccess flag set.
     * @type {Integer (Int32)}
     */
    static TokenUIAccess => 26

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_mandatory_policy">TOKEN_MANDATORY_POLICY</a> structure that specifies the token's mandatory integrity policy.
     * Native name: TokenMandatoryPolicy
     * @type {Integer (Int32)}
     */
    static MandatoryPolicy => 27

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that specifies the token's logon SID.
     * Native name: TokenLogonSid
     * @type {Integer (Int32)}
     */
    static LogonSid => 28

    /**
     * The buffer receives a <b>DWORD</b> value that is nonzero if the token is an app container token. Any callers who check the <b>TokenIsAppContainer</b> and have it return 0 should also verify that the caller token is not an identify level impersonation token. If the current token is not an app container but is an identity level token, you should return <b>AccessDenied</b>.
     * Native name: TokenIsAppContainer
     * @type {Integer (Int32)}
     */
    static IsAppContainer => 29

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the capabilities associated with the token.
     * Native name: TokenCapabilities
     * @type {Integer (Int32)}
     */
    static Capabilities => 30

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_appcontainer_information">TOKEN_APPCONTAINER_INFORMATION</a> structure that contains the AppContainerSid associated with the token. If the token is not associated with an app container, the <b>TokenAppContainer</b> member of the <b>TOKEN_APPCONTAINER_INFORMATION</b> structure points to <b>NULL</b>.
     * Native name: TokenAppContainerSid
     * @type {Integer (Int32)}
     */
    static AppContainerSid => 31

    /**
     * The buffer receives a <b>DWORD</b> value that includes the   app container number for the token. For tokens that are not app container tokens, this value is zero.
     * Native name: TokenAppContainerNumber
     * @type {Integer (Int32)}
     */
    static AppContainerNumber => 32

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-claim_security_attributes_information">CLAIM_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains the user claims associated with the token.
     * Native name: TokenUserClaimAttributes
     * @type {Integer (Int32)}
     */
    static UserClaimAttributes => 33

    /**
     * The buffer receives  a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-claim_security_attributes_information">CLAIM_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains the  device claims associated with the token.
     * Native name: TokenDeviceClaimAttributes
     * @type {Integer (Int32)}
     */
    static DeviceClaimAttributes => 34

    /**
     * This value is reserved.
     * Native name: TokenRestrictedUserClaimAttributes
     * @type {Integer (Int32)}
     */
    static RestrictedUserClaimAttributes => 35

    /**
     * This value is reserved.
     * Native name: TokenRestrictedDeviceClaimAttributes
     * @type {Integer (Int32)}
     */
    static RestrictedDeviceClaimAttributes => 36

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the device groups that are associated with the token.
     * Native name: TokenDeviceGroups
     * @type {Integer (Int32)}
     */
    static DeviceGroups => 37

    /**
     * The buffer receives a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the restricted device groups that are associated with the token.
     * Native name: TokenRestrictedDeviceGroups
     * @type {Integer (Int32)}
     */
    static RestrictedDeviceGroups => 38

    /**
     * This value is reserved.
     * Native name: TokenSecurityAttributes
     * @type {Integer (Int32)}
     */
    static SecurityAttributes => 39

    /**
     * This value is reserved.
     * Native name: TokenIsRestricted
     * @type {Integer (Int32)}
     */
    static IsRestricted => 40

    /**
     * Native name: TokenProcessTrustLevel
     * @type {Integer (Int32)}
     */
    static ProcessTrustLevel => 41

    /**
     * Native name: TokenPrivateNameSpace
     * @type {Integer (Int32)}
     */
    static PrivateNameSpace => 42

    /**
     * Native name: TokenSingletonAttributes
     * @type {Integer (Int32)}
     */
    static SingletonAttributes => 43

    /**
     * Native name: TokenBnoIsolation
     * @type {Integer (Int32)}
     */
    static BnoIsolation => 44

    /**
     * Native name: TokenChildProcessFlags
     * @type {Integer (Int32)}
     */
    static ChildProcessFlags => 45

    /**
     * Native name: TokenIsLessPrivilegedAppContainer
     * @type {Integer (Int32)}
     */
    static IsLessPrivilegedAppContainer => 46

    /**
     * Native name: TokenIsSandboxed
     * @type {Integer (Int32)}
     */
    static IsSandboxed => 47

    /**
     * Native name: TokenIsAppSilo
     * @type {Integer (Int32)}
     */
    static IsAppSilo => 48

    /**
     * Native name: TokenLoggingInformation
     * @type {Integer (Int32)}
     */
    static LoggingInformation => 49

    /**
     * Native name: TokenLearningMode
     * @type {Integer (Int32)}
     */
    static LearningMode => 50

    /**
     * The maximum value for this enumeration.
     * @type {Integer (Int32)}
     */
    static MaxTokenInfoClass => 51
}
