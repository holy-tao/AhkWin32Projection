#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_WST_STATE enumeration specifies whether WST closed captioning is enabled or disabled.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_state
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_WST_STATE extends Win32Enum{

    /**
     * Specifies that WST closed captioning is enabled.
     * @type {Integer (Int32)}
     */
    static AM_WST_STATE_Off => 0

    /**
     * Specifies that WST closed captioning is disabled.
     * @type {Integer (Int32)}
     */
    static AM_WST_STATE_On => 1
}
