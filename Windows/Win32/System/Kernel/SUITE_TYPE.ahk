#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class SUITE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SmallBusiness => 0

    /**
     * @type {Integer (Int32)}
     */
    static Enterprise => 1

    /**
     * @type {Integer (Int32)}
     */
    static BackOffice => 2

    /**
     * @type {Integer (Int32)}
     */
    static CommunicationServer => 3

    /**
     * @type {Integer (Int32)}
     */
    static TerminalServer => 4

    /**
     * @type {Integer (Int32)}
     */
    static SmallBusinessRestricted => 5

    /**
     * @type {Integer (Int32)}
     */
    static EmbeddedNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static DataCenter => 7

    /**
     * @type {Integer (Int32)}
     */
    static SingleUserTS => 8

    /**
     * @type {Integer (Int32)}
     */
    static Personal => 9

    /**
     * @type {Integer (Int32)}
     */
    static Blade => 10

    /**
     * @type {Integer (Int32)}
     */
    static EmbeddedRestricted => 11

    /**
     * @type {Integer (Int32)}
     */
    static SecurityAppliance => 12

    /**
     * @type {Integer (Int32)}
     */
    static StorageServer => 13

    /**
     * @type {Integer (Int32)}
     */
    static ComputeServer => 14

    /**
     * @type {Integer (Int32)}
     */
    static WHServer => 15

    /**
     * @type {Integer (Int32)}
     */
    static PhoneNT => 16

    /**
     * @type {Integer (Int32)}
     */
    static MultiUserTS => 17

    /**
     * @type {Integer (Int32)}
     */
    static MaxSuiteType => 18
}
