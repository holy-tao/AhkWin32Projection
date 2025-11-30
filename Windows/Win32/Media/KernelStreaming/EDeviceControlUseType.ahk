#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class EDeviceControlUseType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eDeviceControlUseMissing => 0

    /**
     * @type {Integer (Int32)}
     */
    static eDeviceControlUsePrimary => 1

    /**
     * @type {Integer (Int32)}
     */
    static eDeviceControlUseSecondary => 2
}
