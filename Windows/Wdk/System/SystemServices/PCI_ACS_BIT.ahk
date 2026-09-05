#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_ACS_BIT extends Win32Enum {

    /**
     * Native name: PciAcsReserved
     * @type {Integer (Int32)}
     */
    static Reserved => 0

    /**
     * Native name: PciAcsBitEnable
     * @type {Integer (Int32)}
     */
    static Enable => 1

    /**
     * Native name: PciAcsBitDisable
     * @type {Integer (Int32)}
     */
    static Disable => 2

    /**
     * Native name: PciAcsBitDontCare
     * @type {Integer (Int32)}
     */
    static DontCare => 3
}
