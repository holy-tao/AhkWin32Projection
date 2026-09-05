#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class RTL_SYSTEM_GLOBAL_DATA_ID extends Win32Enum {

    /**
     * Native name: GlobalDataIdUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: GlobalDataIdRngSeedVersion
     * @type {Integer (Int32)}
     */
    static RngSeedVersion => 1

    /**
     * Native name: GlobalDataIdInterruptTime
     * @type {Integer (Int32)}
     */
    static InterruptTime => 2

    /**
     * Native name: GlobalDataIdTimeZoneBias
     * @type {Integer (Int32)}
     */
    static TimeZoneBias => 3

    /**
     * Native name: GlobalDataIdImageNumberLow
     * @type {Integer (Int32)}
     */
    static ImageNumberLow => 4

    /**
     * Native name: GlobalDataIdImageNumberHigh
     * @type {Integer (Int32)}
     */
    static ImageNumberHigh => 5

    /**
     * Native name: GlobalDataIdTimeZoneId
     * @type {Integer (Int32)}
     */
    static TimeZoneId => 6

    /**
     * Native name: GlobalDataIdNtMajorVersion
     * @type {Integer (Int32)}
     */
    static NtMajorVersion => 7

    /**
     * Native name: GlobalDataIdNtMinorVersion
     * @type {Integer (Int32)}
     */
    static NtMinorVersion => 8

    /**
     * Native name: GlobalDataIdSystemExpirationDate
     * @type {Integer (Int32)}
     */
    static SystemExpirationDate => 9

    /**
     * Native name: GlobalDataIdKdDebuggerEnabled
     * @type {Integer (Int32)}
     */
    static KdDebuggerEnabled => 10

    /**
     * Native name: GlobalDataIdCyclesPerYield
     * @type {Integer (Int32)}
     */
    static CyclesPerYield => 11

    /**
     * Native name: GlobalDataIdSafeBootMode
     * @type {Integer (Int32)}
     */
    static SafeBootMode => 12

    /**
     * Native name: GlobalDataIdLastSystemRITEventTickCount
     * @type {Integer (Int32)}
     */
    static LastSystemRITEventTickCount => 13

    /**
     * Native name: GlobalDataIdConsoleSharedDataFlags
     * @type {Integer (Int32)}
     */
    static ConsoleSharedDataFlags => 14

    /**
     * Native name: GlobalDataIdNtSystemRootDrive
     * @type {Integer (Int32)}
     */
    static NtSystemRootDrive => 15

    /**
     * Native name: GlobalDataIdQpcBypassEnabled
     * @type {Integer (Int32)}
     */
    static QpcBypassEnabled => 16

    /**
     * Native name: GlobalDataIdQpcData
     * @type {Integer (Int32)}
     */
    static QpcData => 17

    /**
     * Native name: GlobalDataIdQpcBias
     * @type {Integer (Int32)}
     */
    static QpcBias => 18
}
