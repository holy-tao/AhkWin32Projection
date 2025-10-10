#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of information to be retrieved from an existing AuthzClientContext. This enumeration is used by the AuthzGetInformationFromContext function.
 * @see https://docs.microsoft.com/windows/win32/api//authz/ne-authz-authz_context_information_class
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_CONTEXT_INFORMATION_CLASS{

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_user">TOKEN_USER</a> structure that contains a user <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) and its attribute.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoUserSid => 1

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the group SIDs to which the user belongs and their attributes.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoGroupsSids => 2

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains the restricted group SIDs in the context and their attributes.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoRestrictedSids => 3

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that contains the privileges held by the user.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoPrivileges => 4

    /**
     * Retrieves the expiration time set on the context.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoExpirationTime => 5

    /**
     * This constant is reserved. Do not use it.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoServerContext => 6

    /**
     * Retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structures used by the resource manager to identify the context.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoIdentifier => 7

    /**
     * This constant is reserved. Do not use it.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoSource => 8

    /**
     * This constant is reserved. Do not use it.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoAll => 9

    /**
     * This constant is reserved. Do not use it.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoAuthenticationId => 10

    /**
     * Retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains security attributes.
 * 
 * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoSecurityAttributes => 11

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains device SIDs and their attributes.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoDeviceSids => 12

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains user claims.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoUserClaims => 13

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure that contains device claims.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoDeviceClaims => 14

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_appcontainer_information">TOKEN_APPCONTAINER_INFORMATION</a> structure that contains the app container SID.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoAppContainerSid => 15

    /**
     * Retrieves a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure that contains capability SIDs.
 * 
 * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static AuthzContextInfoCapabilitySids => 16
}
