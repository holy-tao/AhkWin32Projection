#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_DPC_ERROR_EVENT_TYPE extends Win32Enum {

    /**
     * Native name: WheapDpcErrNoErr
     * @type {Integer (Int32)}
     */
    static ErrNoErr => 0

    /**
     * Native name: WheapDpcErrBusNotFound
     * @type {Integer (Int32)}
     */
    static ErrBusNotFound => 1

    /**
     * Native name: WheapDpcErrDpcedSubtree
     * @type {Integer (Int32)}
     */
    static ErrDpcedSubtree => 2

    /**
     * Native name: WheapDpcErrDeviceIdBad
     * @type {Integer (Int32)}
     */
    static ErrDeviceIdBad => 3

    /**
     * Native name: WheapDpcErrResetFailed
     * @type {Integer (Int32)}
     */
    static ErrResetFailed => 4

    /**
     * Native name: WheapDpcErrNoChildren
     * @type {Integer (Int32)}
     */
    static ErrNoChildren => 5
}
