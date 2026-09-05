#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_POWER_STATE extends Win32Enum {

    /**
     * Native name: PowerOn
     * @type {Integer (Int32)}
     */
    static On => 0

    /**
     * Native name: PowerOff
     * @type {Integer (Int32)}
     */
    static Off => 1
}
