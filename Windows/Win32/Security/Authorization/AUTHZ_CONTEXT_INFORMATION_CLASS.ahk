#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of information to be retrieved from an existing AuthzClientContext. This enumeration is used by the AuthzGetInformationFromContext function.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ne-authz-authz_context_information_class
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_CONTEXT_INFORMATION_CLASS extends Win32Enum {

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_user">TOKEN_USER</a> structure that contains a user <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) and its attribute.
     * Native name: AuthzContextInfoUserSid
     * @type {Integer (Int32)}
     */
    static InfoUserSid => 1

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the group SIDs to which the user belongs and their attributes.
     * Native name: AuthzContextInfoGroupsSids
     * @type {Integer (Int32)}
     */
    static InfoGroupsSids => 2

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the restricted group SIDs in the context and their attributes.
     * Native name: AuthzContextInfoRestrictedSids
     * @type {Integer (Int32)}
     */
    static InfoRestrictedSids => 3

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that contains the privileges held by the user.
     * Native name: AuthzContextInfoPrivileges
     * @type {Integer (Int32)}
     */
    static InfoPrivileges => 4

    /**
     * Retrieves the expiration time set on the context.
     * Native name: AuthzContextInfoExpirationTime
     * @type {Integer (Int32)}
     */
    static InfoExpirationTime => 5

    /**
     * This constant is reserved. Do not use it.
     * Native name: AuthzContextInfoServerContext
     * @type {Integer (Int32)}
     */
    static InfoServerContext => 6

    /**
     * Retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structures used by the resource manager to identify the context.
     * Native name: AuthzContextInfoIdentifier
     * @type {Integer (Int32)}
     */
    static InfoIdentifier => 7

    /**
     * This constant is reserved. Do not use it.
     * Native name: AuthzContextInfoSource
     * @type {Integer (Int32)}
     */
    static InfoSource => 8

    /**
     * This constant is reserved. Do not use it.
     * Native name: AuthzContextInfoAll
     * @type {Integer (Int32)}
     */
    static InfoAll => 9

    /**
     * This constant is reserved. Do not use it.
     * Native name: AuthzContextInfoAuthenticationId
     * @type {Integer (Int32)}
     */
    static InfoAuthenticationId => 10

    /**
     * Retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains security attributes.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * Native name: AuthzContextInfoSecurityAttributes
     * @type {Integer (Int32)}
     */
    static InfoSecurityAttributes => 11

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains device SIDs and their attributes.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * Native name: AuthzContextInfoDeviceSids
     * @type {Integer (Int32)}
     */
    static InfoDeviceSids => 12

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains user claims.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * Native name: AuthzContextInfoUserClaims
     * @type {Integer (Int32)}
     */
    static InfoUserClaims => 13

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains device claims.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * Native name: AuthzContextInfoDeviceClaims
     * @type {Integer (Int32)}
     */
    static InfoDeviceClaims => 14

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_appcontainer_information">TOKEN_APPCONTAINER_INFORMATION</a> structure that contains the app container SID.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * Native name: AuthzContextInfoAppContainerSid
     * @type {Integer (Int32)}
     */
    static InfoAppContainerSid => 15

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains capability SIDs.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * Native name: AuthzContextInfoCapabilitySids
     * @type {Integer (Int32)}
     */
    static InfoCapabilitySids => 16
}
