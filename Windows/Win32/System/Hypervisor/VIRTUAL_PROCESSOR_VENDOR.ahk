#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class VIRTUAL_PROCESSOR_VENDOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Amd => 1

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Intel => 2

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Hygon => 3

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorVendor_Arm => 4
}
