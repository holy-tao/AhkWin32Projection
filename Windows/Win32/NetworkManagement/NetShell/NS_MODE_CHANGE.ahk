#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class NS_MODE_CHANGE{

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_COMMIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_UNCOMMIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_FLUSH => 2

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_COMMIT_STATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_SAVE => 4
}
