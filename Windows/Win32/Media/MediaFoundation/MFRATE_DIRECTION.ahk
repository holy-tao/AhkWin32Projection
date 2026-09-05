#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction of playback (forward or reverse).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfrate_direction
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFRATE_DIRECTION extends Win32Enum {

    /**
     * Forward playback.
     * Native name: MFRATE_FORWARD
     * @type {Integer (Int32)}
     */
    static FORWARD => 0

    /**
     * Reverse playback.
     * Native name: MFRATE_REVERSE
     * @type {Integer (Int32)}
     */
    static REVERSE => 1
}
