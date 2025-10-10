#Requires AutoHotkey v2.0.0 64-bit

/**
 * The TRUSTED_INFORMATION_CLASS enumeration type defines values that indicate the type of information to set or query for a trusted domain.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ne-ntsecapi-trusted_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_INFORMATION_CLASS{

    /**
     * Query or set the name of a trusted domain. Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_name_info">TRUSTED_DOMAIN_NAME_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static TrustedDomainNameInformation => 1

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static TrustedControllersInformation => 2

    /**
     * Query or set the value used to generate Posix user and group identifiers. Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_posix_offset_info">TRUSTED_POSIX_OFFSET_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static TrustedPosixOffsetInformation => 3

    /**
     * This value has been superseded by the <b>TrustedDomainAuthInformation</b> value.
     * @type {Integer (Int32)}
     */
    static TrustedPasswordInformation => 4

    /**
     * This value is obsolete.
     * @type {Integer (Int32)}
     */
    static TrustedDomainInformationBasic => 5

    /**
     * Query extended information for a trusted domain. Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure.
     * @type {Integer (Int32)}
     */
    static TrustedDomainInformationEx => 6

    /**
     * Query authentication information for a trusted domain. Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_auth_information">TRUSTED_DOMAIN_AUTH_INFORMATION</a> structure.
     * @type {Integer (Int32)}
     */
    static TrustedDomainAuthInformation => 7

    /**
     * Query complete information for a trusted domain. This information includes the Posix offset information, authentication information, and the extended information returned for the <b>TrustedDomainInformationEx</b> value. Use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_full_information">TRUSTED_DOMAIN_FULL_INFORMATION</a> structure.
     * @type {Integer (Int32)}
     */
    static TrustedDomainFullInformation => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TrustedDomainAuthInformationInternal => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TrustedDomainFullInformationInternal => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TrustedDomainInformationEx2Internal => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TrustedDomainFullInformation2Internal => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TrustedDomainSupportedEncryptionTypes => 13

    /**
     * @type {Integer (Int32)}
     */
    static TrustedDomainAuthInformationInternalAes => 14

    /**
     * @type {Integer (Int32)}
     */
    static TrustedDomainFullInformationInternalAes => 15
}
