#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_MRL_STATE extends Win32Enum {

    /**
     * Native name: MRLClosed
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * Native name: MRLOpen
     * @type {Integer (Int32)}
     */
    static Open => 1
}
