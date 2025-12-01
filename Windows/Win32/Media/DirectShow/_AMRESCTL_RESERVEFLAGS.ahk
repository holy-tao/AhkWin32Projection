#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to increment or decrement the number of resources currently being reserved.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_amresctl_reserveflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _AMRESCTL_RESERVEFLAGS extends Win32Enum{

    /**
     * Increment the reserved resource count.
     * @type {Integer (Int32)}
     */
    static AMRESCTL_RESERVEFLAGS_RESERVE => 0

    /**
     * Decrement the reserved resource count.
     * @type {Integer (Int32)}
     */
    static AMRESCTL_RESERVEFLAGS_UNRESERVE => 1
}
