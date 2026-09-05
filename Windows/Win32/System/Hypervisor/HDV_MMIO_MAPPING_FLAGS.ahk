#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class HDV_MMIO_MAPPING_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: HdvMmioMappingFlagNone
     * @type {Integer (Int32)}
     */
    static FlagNone => 0

    /**
     * Native name: HdvMmioMappingFlagWriteable
     * @type {Integer (Int32)}
     */
    static FlagWriteable => 1

    /**
     * Native name: HdvMmioMappingFlagExecutable
     * @type {Integer (Int32)}
     */
    static FlagExecutable => 2
}
