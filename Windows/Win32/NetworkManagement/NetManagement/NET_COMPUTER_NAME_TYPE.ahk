#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_COMPUTER_NAME_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static NetPrimaryComputerName => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetAlternateComputerNames => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetAllComputerNames => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetComputerNameTypeMax => 3
}
