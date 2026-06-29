#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags for the IMFTimer::SetTimer method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mftimer_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFTIMER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The time passed to the timer is relative to the current time. If this flag is absent, the time is expressed as an absolute clock time.
     * @type {Integer (Int32)}
     */
    static MFTIMER_RELATIVE => 1
}
