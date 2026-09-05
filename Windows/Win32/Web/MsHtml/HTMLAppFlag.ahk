#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLAppFlag extends Win32Enum {

    /**
     * Native name: HTMLAppFlagNo
     * @type {Integer (Int32)}
     */
    static No => 0

    /**
     * Native name: HTMLAppFlagOff
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Native name: HTMLAppFlag0
     * @type {Integer (Int32)}
     */
    static Flag0 => 0

    /**
     * Native name: HTMLAppFlagYes
     * @type {Integer (Int32)}
     */
    static Yes => 1

    /**
     * Native name: HTMLAppFlagOn
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * Native name: HTMLAppFlag1
     * @type {Integer (Int32)}
     */
    static Flag1 => 1

    /**
     * Native name: HTMLAppFlag_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
