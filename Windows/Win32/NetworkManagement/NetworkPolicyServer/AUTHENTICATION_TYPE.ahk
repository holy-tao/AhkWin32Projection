#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the AUTHENTICATION_TYPE enumerated type are used to specify the authentication method.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-authentication_type
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class AUTHENTICATION_TYPE{

    /**
     * Specifies the authorization type as invalid.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_INVALID => 0

    /**
     * Specifies the authorization type as PAP.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_PAP => 1

    /**
     * Specifies the authorization type as MD5CHAP.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_MD5CHAP => 2

    /**
     * Specifies the authorization type as MSCHAP.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_MSCHAP => 3

    /**
     * Specifies the authorization type as MSCHAP2.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_MSCHAP2 => 4

    /**
     * Specifies the authorization type as EAP.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_EAP => 5

    /**
     * Specifies the authorization type as PEAP.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_ARAP => 6

    /**
     * Specifies that there is not authorization type.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_NONE => 7

    /**
     * Specifies the authorization type as custom.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_CUSTOM => 8

    /**
     * Specifies the authorization type as <b>MSCHAP_CPW</b>.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_MSCHAP_CPW => 9

    /**
     * Specifies the authorization type as <b>MSCHAP2_CPW</b>.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_MSCHAP2_CPW => 10

    /**
     * Specifies the authorization type as <b>PEAP</b>.
     * @type {Integer (Int32)}
     */
    static IAS_AUTH_PEAP => 11
}
