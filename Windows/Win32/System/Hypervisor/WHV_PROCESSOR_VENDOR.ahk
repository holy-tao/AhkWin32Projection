#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_PROCESSOR_VENDOR extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorVendorAmd => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorVendorIntel => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorVendorHygon => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorVendorArm => 16
}
