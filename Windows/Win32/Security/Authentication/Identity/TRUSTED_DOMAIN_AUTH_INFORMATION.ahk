#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The TRUSTED_DOMAIN_AUTH_INFORMATION structure is used to retrieve authentication information for a trusted domain. The LsaQueryTrustedDomainInfo function uses this structure when its InformationClass parameter is set to TrustedDomainAuthInformation.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-trusted_domain_auth_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_AUTH_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the number of entries in the <b>IncomingAuthenticationInformation</b> and <b>IncomingPreviousAuthenticationInformation</b> arrays.
     * @type {Integer}
     */
    IncomingAuthInfos {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the authentication information for the incoming side of a trust relationship.
     * @type {Pointer<LSA_AUTH_INFORMATION>}
     */
    IncomingAuthenticationInformation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the previous authentication information (or old password) for the incoming side of a trust relationship. There must be one of these for every entry in the <b>IncomingAuthenticationInformation</b> array.
     * @type {Pointer<LSA_AUTH_INFORMATION>}
     */
    IncomingPreviousAuthenticationInformation {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the number of entries in the <b>OutgoingAuthenticationInformation</b> and <b>OutgoingPreviousAuthenticationInformation</b> arrays.
     * @type {Integer}
     */
    OutgoingAuthInfos {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the authentication information for the outgoing side of a trust relationship.
     * @type {Pointer<LSA_AUTH_INFORMATION>}
     */
    OutgoingAuthenticationInformation {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_auth_information">LSA_AUTH_INFORMATION</a> structures containing the previous authentication information (or old password) for the outgoing side of a trust relationship. There must be one of these for every entry in the <b>OutgoingAuthenticationInformation</b> array.
     * @type {Pointer<LSA_AUTH_INFORMATION>}
     */
    OutgoingPreviousAuthenticationInformation {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
