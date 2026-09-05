#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The TRUSTED_INFORMATION_CLASS enumeration type defines values that indicate the type of information to set or query for a trusted domain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-trusted_information_class
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class TRUSTED_INFORMATION_CLASS extends Win32Enum {

    /**
     * Query or set the name of a trusted domain. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_name_info">TRUSTED_DOMAIN_NAME_INFO</a> structure.
     * Native name: TrustedDomainNameInformation
     * @type {Integer (Int32)}
     */
    static DomainNameInformation => 1

    /**
     * This value is obsolete.
     * Native name: TrustedControllersInformation
     * @type {Integer (Int32)}
     */
    static ControllersInformation => 2

    /**
     * Query or set the value used to generate Posix user and group identifiers. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_posix_offset_info">TRUSTED_POSIX_OFFSET_INFO</a> structure.
     * Native name: TrustedPosixOffsetInformation
     * @type {Integer (Int32)}
     */
    static PosixOffsetInformation => 3

    /**
     * This value has been superseded by the <b>TrustedDomainAuthInformation</b> value.
     * Native name: TrustedPasswordInformation
     * @type {Integer (Int32)}
     */
    static PasswordInformation => 4

    /**
     * This value is obsolete.
     * Native name: TrustedDomainInformationBasic
     * @type {Integer (Int32)}
     */
    static DomainInformationBasic => 5

    /**
     * Query extended information for a trusted domain. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure.
     * Native name: TrustedDomainInformationEx
     * @type {Integer (Int32)}
     */
    static DomainInformationEx => 6

    /**
     * Query authentication information for a trusted domain. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_auth_information">TRUSTED_DOMAIN_AUTH_INFORMATION</a> structure.
     * Native name: TrustedDomainAuthInformation
     * @type {Integer (Int32)}
     */
    static DomainAuthInformation => 7

    /**
     * Query complete information for a trusted domain. This information includes the Posix offset information, authentication information, and the extended information returned for the <b>TrustedDomainInformationEx</b> value. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_full_information">TRUSTED_DOMAIN_FULL_INFORMATION</a> structure.
     * Native name: TrustedDomainFullInformation
     * @type {Integer (Int32)}
     */
    static DomainFullInformation => 8

    /**
     * Native name: TrustedDomainAuthInformationInternal
     * @type {Integer (Int32)}
     */
    static DomainAuthInformationInternal => 9

    /**
     * Native name: TrustedDomainFullInformationInternal
     * @type {Integer (Int32)}
     */
    static DomainFullInformationInternal => 10

    /**
     * Native name: TrustedDomainInformationEx2Internal
     * @type {Integer (Int32)}
     */
    static DomainInformationEx2Internal => 11

    /**
     * Native name: TrustedDomainFullInformation2Internal
     * @type {Integer (Int32)}
     */
    static DomainFullInformation2Internal => 12

    /**
     * Native name: TrustedDomainSupportedEncryptionTypes
     * @type {Integer (Int32)}
     */
    static DomainSupportedEncryptionTypes => 13

    /**
     * Native name: TrustedDomainAuthInformationInternalAes
     * @type {Integer (Int32)}
     */
    static DomainAuthInformationInternalAes => 14

    /**
     * Native name: TrustedDomainFullInformationInternalAes
     * @type {Integer (Int32)}
     */
    static DomainFullInformationInternalAes => 15
}
