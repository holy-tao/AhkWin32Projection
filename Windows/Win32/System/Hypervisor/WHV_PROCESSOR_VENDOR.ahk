#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_PROCESSOR_VENDOR extends Win32Enum{

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
}
