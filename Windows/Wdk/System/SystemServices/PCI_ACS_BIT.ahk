#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_ACS_BIT extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PciAcsReserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static PciAcsBitEnable => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciAcsBitDisable => 2

    /**
     * @type {Integer (Int32)}
     */
    static PciAcsBitDontCare => 3
}
