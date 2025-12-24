#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemInformation
 * @version v4.0.30319
 */
class SYSTEM_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SystemBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemPerformanceInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static SystemTimeOfDayInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static SystemProcessInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static SystemProcessorPerformanceInformation => 8

    /**
     * @type {Integer (Int32)}
     */
    static SystemInterruptInformation => 23

    /**
     * @type {Integer (Int32)}
     */
    static SystemExceptionInformation => 33

    /**
     * @type {Integer (Int32)}
     */
    static SystemRegistryQuotaInformation => 37

    /**
     * @type {Integer (Int32)}
     */
    static SystemLookasideInformation => 45

    /**
     * @type {Integer (Int32)}
     */
    static SystemCodeIntegrityInformation => 103

    /**
     * @type {Integer (Int32)}
     */
    static SystemPolicyInformation => 134
}
