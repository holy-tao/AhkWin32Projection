#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class FAULT_INFORMATION_ARM64_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UnsupportedUpstreamTransaction => 0

    /**
     * @type {Integer (Int32)}
     */
    static AddressSizeFault => 1

    /**
     * @type {Integer (Int32)}
     */
    static TlbMatchConflict => 2

    /**
     * @type {Integer (Int32)}
     */
    static ExternalFault => 3

    /**
     * @type {Integer (Int32)}
     */
    static PermissionFault => 4

    /**
     * @type {Integer (Int32)}
     */
    static AccessFlagFault => 5

    /**
     * @type {Integer (Int32)}
     */
    static TranslationFault => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxFaultType => 7
}
