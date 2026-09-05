#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PCI_RECOVERY_STATUS extends Win32Enum {

    /**
     * Native name: WheaPciREcoveryStatusUnknown
     * @type {Integer (Int32)}
     */
    static PciREcoveryStatusUnknown => 0

    /**
     * Native name: WheaPciRecoveryStatusNoError
     * @type {Integer (Int32)}
     */
    static NoError => 1

    /**
     * Native name: WheaPciRecoveryStatusLinkDisableTimeout
     * @type {Integer (Int32)}
     */
    static LinkDisableTimeout => 2

    /**
     * Native name: WheaPciRecoveryStatusLinkEnableTimeout
     * @type {Integer (Int32)}
     */
    static LinkEnableTimeout => 3

    /**
     * Native name: WheaPciRecoveryStatusRpBusyTimeout
     * @type {Integer (Int32)}
     */
    static RpBusyTimeout => 4

    /**
     * Native name: WheaPciRecoveryStatusComplexTree
     * @type {Integer (Int32)}
     */
    static ComplexTree => 5

    /**
     * Native name: WheaPciRecoveryStatusBusNotFound
     * @type {Integer (Int32)}
     */
    static BusNotFound => 6
}
