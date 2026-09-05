#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_TYPE extends Win32Enum {

    /**
     * Native name: WheaErrTypeProcessor
     * @type {Integer (Int32)}
     */
    static ErrTypeProcessor => 0

    /**
     * Native name: WheaErrTypeMemory
     * @type {Integer (Int32)}
     */
    static ErrTypeMemory => 1

    /**
     * Native name: WheaErrTypePCIExpress
     * @type {Integer (Int32)}
     */
    static ErrTypePCIExpress => 2

    /**
     * Native name: WheaErrTypeNMI
     * @type {Integer (Int32)}
     */
    static ErrTypeNMI => 3

    /**
     * Native name: WheaErrTypePCIXBus
     * @type {Integer (Int32)}
     */
    static ErrTypePCIXBus => 4

    /**
     * Native name: WheaErrTypePCIXDevice
     * @type {Integer (Int32)}
     */
    static ErrTypePCIXDevice => 5

    /**
     * Native name: WheaErrTypeGeneric
     * @type {Integer (Int32)}
     */
    static ErrTypeGeneric => 6

    /**
     * Native name: WheaErrTypePmem
     * @type {Integer (Int32)}
     */
    static ErrTypePmem => 7
}
