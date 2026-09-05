#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class EDeviceControlUseType extends Win32Enum {

    /**
     * Native name: eDeviceControlUseMissing
     * @type {Integer (Int32)}
     */
    static Missing => 0

    /**
     * Native name: eDeviceControlUsePrimary
     * @type {Integer (Int32)}
     */
    static Primary => 1

    /**
     * Native name: eDeviceControlUseSecondary
     * @type {Integer (Int32)}
     */
    static Secondary => 2
}
