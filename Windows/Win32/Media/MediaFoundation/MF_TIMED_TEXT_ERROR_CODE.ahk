#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the kind error that occurred with a timed text track.
 * @remarks
 * This enumeration is used to return error information  from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-geterrorcode">IMFTimedTextTrack::GetErrorCode</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_error_code
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_ERROR_CODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No error occurred.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ERROR_CODE_NOERROR => 0

    /**
     * A fatal error occurred.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ERROR_CODE_FATAL => 1

    /**
     * An error occurred with the data format of the timed text track.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ERROR_CODE_DATA_FORMAT => 2

    /**
     * A network error occurred when trying to load the timed text track.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ERROR_CODE_NETWORK => 3

    /**
     * An internal error occurred.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ERROR_CODE_INTERNAL => 4
}
