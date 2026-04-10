#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_DPC_ERROR_EVENT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrNoErr => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrBusNotFound => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrDpcedSubtree => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrDeviceIdBad => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrResetFailed => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheapDpcErrNoChildren => 5
}
