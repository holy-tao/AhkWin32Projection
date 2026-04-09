#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CustomLineCapType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CustomLineCapTypeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static CustomLineCapTypeAdjustableArrow => 1
}
