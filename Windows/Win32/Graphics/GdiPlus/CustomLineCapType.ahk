#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CustomLineCapType extends Win32Enum {

    /**
     * Native name: CustomLineCapTypeDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: CustomLineCapTypeAdjustableArrow
     * @type {Integer (Int32)}
     */
    static AdjustableArrow => 1
}
