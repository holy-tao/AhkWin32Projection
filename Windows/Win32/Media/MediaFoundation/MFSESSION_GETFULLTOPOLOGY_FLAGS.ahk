#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags for the IMFMediaSession::GetFullTopology method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsession_getfulltopology_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSESSION_GETFULLTOPOLOGY_FLAGS{

    /**
     * Get the full topology for the presentation that the Media Session is currently playing.
     * @type {Integer (Int32)}
     */
    static MFSESSION_GETFULLTOPOLOGY_CURRENT => 1
}
