#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlDesignMode extends Win32Enum {

    /**
     * Native name: htmlDesignModeInherit
     * @type {Integer (Int32)}
     */
    static Inherit => -2

    /**
     * Native name: htmlDesignModeOn
     * @type {Integer (Int32)}
     */
    static On => -1

    /**
     * Native name: htmlDesignModeOff
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Native name: htmlDesignMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
