#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_LINK_SUBSTATE extends Win32Enum {

    /**
     * Native name: PciExpressPciPmLinkSubState_L11_BitIndex
     * @type {Integer (Int32)}
     */
    static PciPmLinkSubState_L11_BitIndex => 0

    /**
     * Native name: PciExpressPciPmLinkSubState_L12_BitIndex
     * @type {Integer (Int32)}
     */
    static PciPmLinkSubState_L12_BitIndex => 1

    /**
     * Native name: PciExpressASPMLinkSubState_L11_BitIndex
     * @type {Integer (Int32)}
     */
    static ExpressASPMLinkSubState_L11_BitIndex => 2

    /**
     * Native name: PciExpressASPMLinkSubState_L12_BitIndex
     * @type {Integer (Int32)}
     */
    static ExpressASPMLinkSubState_L12_BitIndex => 3
}
