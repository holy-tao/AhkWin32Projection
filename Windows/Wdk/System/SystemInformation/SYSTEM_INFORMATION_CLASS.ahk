#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemInformation
 */
class SYSTEM_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: SystemBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: SystemPerformanceInformation
     * @type {Integer (Int32)}
     */
    static PerformanceInformation => 2

    /**
     * Native name: SystemTimeOfDayInformation
     * @type {Integer (Int32)}
     */
    static TimeOfDayInformation => 3

    /**
     * Native name: SystemProcessInformation
     * @type {Integer (Int32)}
     */
    static ProcessInformation => 5

    /**
     * Native name: SystemProcessorPerformanceInformation
     * @type {Integer (Int32)}
     */
    static ProcessorPerformanceInformation => 8

    /**
     * Native name: SystemInterruptInformation
     * @type {Integer (Int32)}
     */
    static InterruptInformation => 23

    /**
     * Native name: SystemExceptionInformation
     * @type {Integer (Int32)}
     */
    static ExceptionInformation => 33

    /**
     * Native name: SystemRegistryQuotaInformation
     * @type {Integer (Int32)}
     */
    static RegistryQuotaInformation => 37

    /**
     * Native name: SystemLookasideInformation
     * @type {Integer (Int32)}
     */
    static LookasideInformation => 45

    /**
     * Native name: SystemCodeIntegrityInformation
     * @type {Integer (Int32)}
     */
    static CodeIntegrityInformation => 103

    /**
     * Native name: SystemPolicyInformation
     * @type {Integer (Int32)}
     */
    static PolicyInformation => 134
}
