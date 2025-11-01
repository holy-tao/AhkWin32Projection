#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_dad_state
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_DAD_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static NldsInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static NldsTentative => 1

    /**
     * @type {Integer (Int32)}
     */
    static NldsDuplicate => 2

    /**
     * @type {Integer (Int32)}
     */
    static NldsDeprecated => 3

    /**
     * @type {Integer (Int32)}
     */
    static NldsPreferred => 4

    /**
     * @type {Integer (Int32)}
     */
    static IpDadStateInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static IpDadStateTentative => 1

    /**
     * @type {Integer (Int32)}
     */
    static IpDadStateDuplicate => 2

    /**
     * @type {Integer (Int32)}
     */
    static IpDadStateDeprecated => 3

    /**
     * @type {Integer (Int32)}
     */
    static IpDadStatePreferred => 4
}
