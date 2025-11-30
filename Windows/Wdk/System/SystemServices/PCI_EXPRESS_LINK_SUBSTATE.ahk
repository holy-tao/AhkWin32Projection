#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_LINK_SUBSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressPciPmLinkSubState_L11_BitIndex => 0

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressPciPmLinkSubState_L12_BitIndex => 1

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressASPMLinkSubState_L11_BitIndex => 2

    /**
     * @type {Integer (Int32)}
     */
    static PciExpressASPMLinkSubState_L12_BitIndex => 3
}
