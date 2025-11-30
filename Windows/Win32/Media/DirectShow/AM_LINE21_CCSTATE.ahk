#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the closed captioning state (on or off).
 * @see https://docs.microsoft.com/windows/win32/api//il21dec/ne-il21dec-am_line21_ccstate
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_LINE21_CCSTATE extends Win32Enum{

    /**
     * Closed captioning off.
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSTATE_Off => 0

    /**
     * Closed captioning on.
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSTATE_On => 1
}
