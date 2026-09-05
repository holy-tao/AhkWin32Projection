#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to increment or decrement the number of resources currently being reserved.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_amresctl_reserveflags
 * @namespace Windows.Win32.Media.DirectShow
 */
class _AMRESCTL_RESERVEFLAGS extends Win32Enum {

    /**
     * Increment the reserved resource count.
     * Native name: AMRESCTL_RESERVEFLAGS_RESERVE
     * @type {Integer (Int32)}
     */
    static RESERVE => 0

    /**
     * Decrement the reserved resource count.
     * Native name: AMRESCTL_RESERVEFLAGS_UNRESERVE
     * @type {Integer (Int32)}
     */
    static UNRESERVE => 1
}
