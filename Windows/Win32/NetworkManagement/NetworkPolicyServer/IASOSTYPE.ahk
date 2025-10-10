#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the IASOSTYPE enumeration type specify what type of operating system the client requesting authentication (SDO computer) is running.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-iasostype
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class IASOSTYPE{

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT4_WORKSTATION => 0

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT5_WORKSTATION => 1

    /**
     * The SDO computer is running Windows Vista.
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_WORKSTATION => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_1_WORKSTATION => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_2_WORKSTATION => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_3_WORKSTATION => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT10_0_WORKSTATION => 6

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT4_SERVER => 7

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT5_SERVER => 8

    /**
     * The SDO computer is running Windows Server 2008.
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_SERVER => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_1_SERVER => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_2_SERVER => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT6_3_SERVER => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SYSTEM_TYPE_NT10_0_SERVER => 13
}
