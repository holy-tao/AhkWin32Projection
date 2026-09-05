#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_WST_STATE enumeration specifies whether WST closed captioning is enabled or disabled.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_state
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_WST_STATE extends Win32Enum {

    /**
     * Specifies that WST closed captioning is enabled.
     * Native name: AM_WST_STATE_Off
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Specifies that WST closed captioning is disabled.
     * Native name: AM_WST_STATE_On
     * @type {Integer (Int32)}
     */
    static On => 1
}
