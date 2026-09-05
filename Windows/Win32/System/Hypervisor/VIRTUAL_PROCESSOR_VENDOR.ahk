#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class VIRTUAL_PROCESSOR_VENDOR extends Win32Enum {

    /**
     * Native name: ProcessorVendor_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: ProcessorVendor_Amd
     * @type {Integer (Int32)}
     */
    static Amd => 1

    /**
     * Native name: ProcessorVendor_Intel
     * @type {Integer (Int32)}
     */
    static Intel => 2

    /**
     * Native name: ProcessorVendor_Hygon
     * @type {Integer (Int32)}
     */
    static Hygon => 3

    /**
     * Native name: ProcessorVendor_Arm
     * @type {Integer (Int32)}
     */
    static Arm => 4
}
