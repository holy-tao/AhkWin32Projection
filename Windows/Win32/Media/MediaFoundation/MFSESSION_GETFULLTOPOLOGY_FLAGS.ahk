#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags for the IMFMediaSession::GetFullTopology method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsession_getfulltopology_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFSESSION_GETFULLTOPOLOGY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Get the full topology for the presentation that the Media Session is currently playing.
     * @type {Integer (Int32)}
     */
    static MFSESSION_GETFULLTOPOLOGY_CURRENT => 1
}
