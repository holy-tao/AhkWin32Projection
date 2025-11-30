#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_MMIO_MAPPING_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static HdvMmioMappingFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HdvMmioMappingFlagWriteable => 1

    /**
     * @type {Integer (Int32)}
     */
    static HdvMmioMappingFlagExecutable => 2
}
