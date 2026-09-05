#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_TYPE extends Win32Enum {

    /**
     * Native name: CommonBufferConfigTypeLogicalAddressLimits
     * @type {Integer (Int32)}
     */
    static ConfigTypeLogicalAddressLimits => 0

    /**
     * Native name: CommonBufferConfigTypeSubSection
     * @type {Integer (Int32)}
     */
    static ConfigTypeSubSection => 1

    /**
     * Native name: CommonBufferConfigTypeHardwareAccessPermissions
     * @type {Integer (Int32)}
     */
    static ConfigTypeHardwareAccessPermissions => 2

    /**
     * Native name: CommonBufferConfigTypeMax
     * @type {Integer (Int32)}
     */
    static ConfigTypeMax => 3
}
