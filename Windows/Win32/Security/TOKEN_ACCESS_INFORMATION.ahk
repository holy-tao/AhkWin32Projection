#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKEN_MANDATORY_POLICY_ID.ahk" { TOKEN_MANDATORY_POLICY_ID }
#Import ".\TOKEN_MANDATORY_POLICY.ahk" { TOKEN_MANDATORY_POLICY }
#Import ".\TOKEN_TYPE.ahk" { TOKEN_TYPE }
#Import ".\SID_AND_ATTRIBUTES_HASH.ahk" { SID_AND_ATTRIBUTES_HASH }
#Import ".\PSID.ahk" { PSID }
#Import "..\Foundation\LUID.ahk" { LUID }
#Import ".\TOKEN_PRIVILEGES.ahk" { TOKEN_PRIVILEGES }
#Import ".\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * Specifies all the information in a token that is necessary to perform an access check.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_access_information
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_ACCESS_INFORMATION {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes_hash">SID_AND_ATTRIBUTES_HASH</a> structure that specifies a hash of the token's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     */
    SidHash : SID_AND_ATTRIBUTES_HASH.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes_hash">SID_AND_ATTRIBUTES_HASH</a> structure that specifies a hash of the token's restricted SID.
     */
    RestrictedSidHash : SID_AND_ATTRIBUTES_HASH.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that specifies information about the token's privileges.
     */
    Privileges : TOKEN_PRIVILEGES.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure that specifies the token's identity.
     */
    AuthenticationId : LUID

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_type">TOKEN_TYPE</a> enumeration that specifies the token's type.
     */
    TokenType : TOKEN_TYPE

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumeration that specifies the token's impersonation level.
     */
    ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_mandatory_policy">TOKEN_MANDATORY_POLICY</a> structure that specifies the token's mandatory integrity policy.
     */
    MandatoryPolicy : TOKEN_MANDATORY_POLICY

    /**
     * Reserved. Must be set to zero.
     */
    Flags : UInt32

    /**
     * The app container number for the token or zero if this is not an app container token.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This member is not available.
     */
    AppContainerNumber : UInt32

    /**
     * The app container SID or <b>NULL</b> if this is not an app container token.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This member is not available.
     */
    PackageSid : PSID

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes_hash">SID_AND_ATTRIBUTES_HASH</a> structure that specifies a hash of the token's capability SIDs.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This member is not available.
     */
    CapabilitiesHash : SID_AND_ATTRIBUTES_HASH.Ptr

    /**
     * The protected process trust level of the token.
     */
    TrustLevelSid : PSID

    /**
     * Reserved. Must be set to <b>NULL</b>.
     * 
     * <b>Prior to Windows 10:  </b>This member is not available.
     */
    SecurityAttributes : IntPtr

}
