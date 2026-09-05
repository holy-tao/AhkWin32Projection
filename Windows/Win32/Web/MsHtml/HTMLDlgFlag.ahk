#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLDlgFlag extends Win32Enum {

    /**
     * Native name: HTMLDlgFlagNo
     * @type {Integer (Int32)}
     */
    static No => 0

    /**
     * Native name: HTMLDlgFlagOff
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Native name: HTMLDlgFlag0
     * @type {Integer (Int32)}
     */
    static Flag0 => 0

    /**
     * Native name: HTMLDlgFlagYes
     * @type {Integer (Int32)}
     */
    static Yes => 1

    /**
     * Native name: HTMLDlgFlagOn
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * Native name: HTMLDlgFlag1
     * @type {Integer (Int32)}
     */
    static Flag1 => 1

    /**
     * Native name: HTMLDlgFlagNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => -1

    /**
     * Native name: HTMLDlgFlag_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
