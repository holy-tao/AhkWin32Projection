#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KD_CALLBACK_ACTION extends Win32Enum {

    /**
     * Native name: KdConfigureDeviceAndContinue
     * @type {Integer (Int32)}
     */
    static ConfigureDeviceAndContinue => 0

    /**
     * Native name: KdSkipDeviceAndContinue
     * @type {Integer (Int32)}
     */
    static SkipDeviceAndContinue => 1

    /**
     * Native name: KdConfigureDeviceAndStop
     * @type {Integer (Int32)}
     */
    static ConfigureDeviceAndStop => 2

    /**
     * Native name: KdSkipDeviceAndStop
     * @type {Integer (Int32)}
     */
    static SkipDeviceAndStop => 3
}
