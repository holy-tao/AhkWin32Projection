#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import "..\..\TOKEN_PRIVILEGES.ahk" { TOKEN_PRIVILEGES }
#Import "..\..\TOKEN_GROUPS.ahk" { TOKEN_GROUPS }
#Import "..\..\TOKEN_PRIMARY_GROUP.ahk" { TOKEN_PRIMARY_GROUP }
#Import "..\..\TOKEN_OWNER.ahk" { TOKEN_OWNER }
#Import "..\..\TOKEN_DEFAULT_DACL.ahk" { TOKEN_DEFAULT_DACL }
#Import "..\..\TOKEN_DEVICE_CLAIMS.ahk" { TOKEN_DEVICE_CLAIMS }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\ACL.ahk" { ACL }
#Import "..\..\TOKEN_USER_CLAIMS.ahk" { TOKEN_USER_CLAIMS }
#Import "..\..\TOKEN_USER.ahk" { TOKEN_USER }

/**
 * Adds claim support to the LSA token and contains information an authentication package can place in a Version 3 Windows token object and has superceded LSA_TOKEN_INFORMATION_V1.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_token_information_v3
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_TOKEN_INFORMATION_V3 {
    #StructPack 8

    /**
     * Time at which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> becomes not valid. Use a value in the distant future if the context never expires. The current version of the operating system kernel does not enforce this expiration time.
     */
    ExpirationTime : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_user">TOKEN_USER</a> structure that contains the SID of the user logging on. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> SID value is in a separately allocated block of memory.
     */
    User : TOKEN_USER

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the SIDs of groups the user is a member of. This should not include WORLD or other system-defined and system-assigned SIDs. These will be added automatically by the LSA. 
     * 
     * 
     * 
     * 
     * Each SID is expected to be in a separately allocated block of memory. The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure is also expected to be in a separately allocated block of memory. All of these memory blocks should be allocated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-lsa_allocate_private_heap">AllocatePrivateHeap</a> function.
     */
    Groups : TOKEN_GROUPS.Ptr

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_primary_group">TOKEN_PRIMARY_GROUP</a> structure that is used to establish the primary group of the user. This value does not have to correspond to one of the SIDs assigned to the user. 
     * 
     * 
     * 
     * 
     * The SID pointed to by this structure is expected to be in a separately allocated block of memory.
     * 
     * This member is mandatory and must be filled in.
     */
    PrimaryGroup : TOKEN_PRIMARY_GROUP

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> assigned to the user. This list of privileges will be augmented or overridden by any local security policy assigned privileges. 
     * 
     * 
     * 
     * 
     * Each privilege is expected to be in a separately allocated block of memory. The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure is also expected to be in a separately allocated block of memory.
     * 
     * If there are no privileges to assign to the user, this member may be set to <b>NULL</b>.
     */
    Privileges : TOKEN_PRIVILEGES.Ptr

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_owner">TOKEN_OWNER</a> structure. This member may be used to establish an explicit default owner. Normally, the user ID is used as the default owner. If another value is desired, it must be specified here. 
     * 
     * 
     * 
     * 
     * The <b>Owner.Sid</b> member may be set to <b>NULL</b> to indicate there is no alternate default owner value.
     */
    Owner : TOKEN_OWNER

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_default_dacl">TOKEN_DEFAULT_DACL</a> structure. This member may be used to establish a default protection for the user. If no value is provided, a default protection that grants everyone all access will be established. 
     * 
     * 
     * 
     * 
     * The <b>DefaultDacl.DefaultDacl</b> member may be set to <b>NULL</b> to indicate there is no default protection.
     */
    DefaultDacl : TOKEN_DEFAULT_DACL

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_user_claims">TOKEN_USER_CLAIMS</a> structure. This member stores the opaque user claims BLOB for the token. The <b>UserClaims</b> member may be set to <b>NULL</b> to indicate there are no additional user claims in the token. Claims are allow-only entities so omitting claims may restrict access.
     */
    UserClaims : TOKEN_USER_CLAIMS

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_device_claims">TOKEN_DEVICE_CLAIMS</a> structure. This member stores the opaque device claims BLOB for the token. The <b>DeviceClaims</b> member may be set to <b>NULL</b> to indicate there are no additional device claims in the token. Claims are allow-only entities so omitting claims may restrict access.
     */
    DeviceClaims : TOKEN_DEVICE_CLAIMS

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the SIDs of the groups for the authenticating device member. As with user groups, this should not include WORLD or other system defined or assigned SIDs. The <b>DeviceGroups</b> member may be set to <b>NULL</b> to indicate that no compounding should occur. If <b>DeviceGroups</b> are present, LSA will add WORLD and other assigned SIDs. 
     * 
     * Unlike user groups, there is no notion of a primary device group.
     * 
     * Each SID is expected to be in a separately allocated block of memory. The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure is also expected to be in a separately allocated block of memory.
     */
    DeviceGroups : TOKEN_GROUPS.Ptr

}
