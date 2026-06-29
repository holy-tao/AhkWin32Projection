#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the direction of playback (forward or reverse).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfrate_direction
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFRATE_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
