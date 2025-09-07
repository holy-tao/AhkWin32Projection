#Requires AutoHotkey v2.0.0 64-bit

/**
 * Define the security authentication levels.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemauthenticationlevelenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemAuthenticationLevelEnum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelDefault => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelNone => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelConnect => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelCall => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelPkt => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelPktIntegrity => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wbemAuthenticationLevelPktPrivacy => 6
}
