#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class NPEM_CONTROL_STANDARD_CONTROL_BIT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InitiateReset => 1

    /**
     * @type {Integer (Int32)}
     */
    static OkControl => 2

    /**
     * @type {Integer (Int32)}
     */
    static LocateControl => 3

    /**
     * @type {Integer (Int32)}
     */
    static FailControl => 4

    /**
     * @type {Integer (Int32)}
     */
    static RebuildControl => 5

    /**
     * @type {Integer (Int32)}
     */
    static PFAControl => 6

    /**
     * @type {Integer (Int32)}
     */
    static HotSpareControl => 7

    /**
     * @type {Integer (Int32)}
     */
    static InACriticalArrayControl => 8

    /**
     * @type {Integer (Int32)}
     */
    static InAFailedArrayControl => 9

    /**
     * @type {Integer (Int32)}
     */
    static InvalidDeviceTypeControl => 10

    /**
     * @type {Integer (Int32)}
     */
    static DisabledControl => 11
}
