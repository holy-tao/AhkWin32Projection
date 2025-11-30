#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PCI_RECOVERY_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciREcoveryStatusUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusNoError => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusLinkDisableTimeout => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusLinkEnableTimeout => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusRpBusyTimeout => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusComplexTree => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusBusNotFound => 6
}
