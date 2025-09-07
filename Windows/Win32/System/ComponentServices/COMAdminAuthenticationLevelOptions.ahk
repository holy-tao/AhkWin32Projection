#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminAuthenticationLevelOptions{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationConnect => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCall => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationPacket => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationIntegrity => 5

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationPrivacy => 6
}
