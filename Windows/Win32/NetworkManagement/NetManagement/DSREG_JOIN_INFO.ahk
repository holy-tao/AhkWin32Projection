#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DSREG_JOIN_TYPE.ahk" { DSREG_JOIN_TYPE }
#Import ".\DSREG_USER_INFO.ahk" { DSREG_USER_INFO }

/**
 * Contains information about how a device is joined to Microsoft Azure Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/ns-lmjoin-dsreg_join_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct DSREG_JOIN_INFO {
    #StructPack 8

    /**
     * An enumeration value that specifies the type of the join.
     */
    joinType : DSREG_JOIN_TYPE

    /**
     * Representations of the certification for the join.
     */
    pJoinCertificate : CERT_CONTEXT.Ptr

    /**
     * The identifier of the device.
     */
    pszDeviceId : PWSTR

    /**
     * A string that represents Azure Active Directory (Azure AD).
     */
    pszIdpDomain : PWSTR

    /**
     * The identifier of the joined Azure AD tenant.
     */
    pszTenantId : PWSTR

    /**
     * The email address for the joined account.
     */
    pszJoinUserEmail : PWSTR

    /**
     * The display name for the joined account.
     */
    pszTenantDisplayName : PWSTR

    /**
     * The URL to use to enroll in the Mobile Device Management (MDM) service.
     */
    pszMdmEnrollmentUrl : PWSTR

    /**
     * The URL that provides information about the terms of use for the MDM service.
     */
    pszMdmTermsOfUseUrl : PWSTR

    /**
     * The URL that provides information about compliance for the MDM service.
     */
    pszMdmComplianceUrl : PWSTR

    /**
     * The URL for synchronizing user settings.
     */
    pszUserSettingSyncUrl : PWSTR

    /**
     * Information about the user account  that was used to join a device to Azure AD.
     */
    pUserInfo : DSREG_USER_INFO.Ptr

}
