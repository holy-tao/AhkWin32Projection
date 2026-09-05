#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HDV_PCI_BAR_SELECTOR Enumeration
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciBarSelector
 * @namespace Windows.Win32.System.Hypervisor
 */
class HDV_PCI_BAR_SELECTOR extends Win32Enum {

    /**
     * Native name: HDV_PCI_BAR0
     * @type {Integer (Int32)}
     */
    static BAR0 => 0

    /**
     * Native name: HDV_PCI_BAR1
     * @type {Integer (Int32)}
     */
    static BAR1 => 1

    /**
     * Native name: HDV_PCI_BAR2
     * @type {Integer (Int32)}
     */
    static BAR2 => 2

    /**
     * Native name: HDV_PCI_BAR3
     * @type {Integer (Int32)}
     */
    static BAR3 => 3

    /**
     * Native name: HDV_PCI_BAR4
     * @type {Integer (Int32)}
     */
    static BAR4 => 4

    /**
     * Native name: HDV_PCI_BAR5
     * @type {Integer (Int32)}
     */
    static BAR5 => 5
}
