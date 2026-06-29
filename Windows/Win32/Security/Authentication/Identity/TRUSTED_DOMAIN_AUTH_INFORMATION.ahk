#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_AUTH_INFORMATION.ahk" { LSA_AUTH_INFORMATION }

/**
 * The TRUSTED_DOMAIN_AUTH_INFORMATION structure is used to retrieve authentication information for a trusted domain. The LsaQueryTrustedDomainInfo function uses this structure when its InformationClass parameter is set to TrustedDomainAuthInformation.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-trusted_domain_auth_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_AUTH_INFORMATION {
    #StructPack 8

    /**
     * Specifies the number of entries in the <b>IncomingAuthenticationInformation</b> and <b>IncomingPreviousAuthenticationInformation</b> arrays.
     */
    IncomingAuthInfos : UInt32

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the authentication information for the incoming side of a trust relationship.
     */
    IncomingAuthenticationInformation : LSA_AUTH_INFORMATION.Ptr

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the previous authentication information (or old password) for the incoming side of a trust relationship. There must be one of these for every entry in the <b>IncomingAuthenticationInformation</b> array.
     */
    IncomingPreviousAuthenticationInformation : LSA_AUTH_INFORMATION.Ptr

    /**
     * Specifies the number of entries in the <b>OutgoingAuthenticationInformation</b> and <b>OutgoingPreviousAuthenticationInformation</b> arrays.
     */
    OutgoingAuthInfos : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the authentication information for the outgoing side of a trust relationship.
     */
    OutgoingAuthenticationInformation : LSA_AUTH_INFORMATION.Ptr

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the previous authentication information (or old password) for the outgoing side of a trust relationship. There must be one of these for every entry in the <b>OutgoingAuthenticationInformation</b> array.
     */
    OutgoingPreviousAuthenticationInformation : LSA_AUTH_INFORMATION.Ptr

}
