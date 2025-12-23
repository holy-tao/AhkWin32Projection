#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _NSTCEHITTEST extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_NOWHERE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMICON => 2

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMLABEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMINDENT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMBUTTON => 16

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMRIGHT => 32

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMSTATEICON => 64

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEM => 70

    /**
     * @type {Integer (Int32)}
     */
    static NSTCEHT_ONITEMTABBUTTON => 4096
}
