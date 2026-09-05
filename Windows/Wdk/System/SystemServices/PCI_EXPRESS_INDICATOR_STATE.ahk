#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_INDICATOR_STATE extends Win32Enum {

    /**
     * Native name: IndicatorOn
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * Native name: IndicatorBlink
     * @type {Integer (Int32)}
     */
    static Blink => 2

    /**
     * Native name: IndicatorOff
     * @type {Integer (Int32)}
     */
    static Off => 3
}
