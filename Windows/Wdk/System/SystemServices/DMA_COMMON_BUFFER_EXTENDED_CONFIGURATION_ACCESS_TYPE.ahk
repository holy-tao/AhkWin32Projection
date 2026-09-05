#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_ACCESS_TYPE extends Win32Enum {

    /**
     * Native name: CommonBufferHardwareAccessReadOnly
     * @type {Integer (Int32)}
     */
    static HardwareAccessReadOnly => 0

    /**
     * Native name: CommonBufferHardwareAccessWriteOnly
     * @type {Integer (Int32)}
     */
    static HardwareAccessWriteOnly => 1

    /**
     * Native name: CommonBufferHardwareAccessReadWrite
     * @type {Integer (Int32)}
     */
    static HardwareAccessReadWrite => 2

    /**
     * Native name: CommonBufferHardwareAccessMax
     * @type {Integer (Int32)}
     */
    static HardwareAccessMax => 3
}
