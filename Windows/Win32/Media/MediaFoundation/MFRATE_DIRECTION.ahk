#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction of playback (forward or reverse).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfrate_direction
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFRATE_DIRECTION extends Win32Enum{

    /**
     * Forward playback.
     * @type {Integer (Int32)}
     */
    static MFRATE_FORWARD => 0

    /**
     * Reverse playback.
     * @type {Integer (Int32)}
     */
    static MFRATE_REVERSE => 1
}
