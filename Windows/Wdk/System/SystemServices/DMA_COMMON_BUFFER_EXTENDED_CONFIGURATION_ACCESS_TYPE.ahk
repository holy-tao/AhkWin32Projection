#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_ACCESS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CommonBufferHardwareAccessReadOnly => 0

    /**
     * @type {Integer (Int32)}
     */
    static CommonBufferHardwareAccessWriteOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static CommonBufferHardwareAccessReadWrite => 2

    /**
     * @type {Integer (Int32)}
     */
    static CommonBufferHardwareAccessMax => 3
}
