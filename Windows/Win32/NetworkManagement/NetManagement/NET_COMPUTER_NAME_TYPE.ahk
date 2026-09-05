#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NET_COMPUTER_NAME_TYPE extends Win32Enum {

    /**
     * Native name: NetPrimaryComputerName
     * @type {Integer (Int32)}
     */
    static PrimaryComputerName => 0

    /**
     * Native name: NetAlternateComputerNames
     * @type {Integer (Int32)}
     */
    static AlternateComputerNames => 1

    /**
     * Native name: NetAllComputerNames
     * @type {Integer (Int32)}
     */
    static AllComputerNames => 2

    /**
     * Native name: NetComputerNameTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
