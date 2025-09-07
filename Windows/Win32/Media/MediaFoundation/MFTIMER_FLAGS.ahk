#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags for the IMFTimer::SetTimer method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mftimer_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFTIMER_FLAGS{

    /**
     * The time passed to the timer is relative to the current time. If this flag is absent, the time is expressed as an absolute clock time.
     * @type {Integer (Int32)}
     */
    static MFTIMER_RELATIVE => 1
}
