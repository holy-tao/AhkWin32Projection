#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the current status of a call to the IMFShutdown::Shutdown method.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfshutdown_status
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFSHUTDOWN_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The shutdown operation has started but is not yet complete.
     * @type {Integer (Int32)}
     */
    static MFSHUTDOWN_INITIATED => 0

    /**
     * Shutdown is complete.
     * @type {Integer (Int32)}
     */
    static MFSHUTDOWN_COMPLETED => 1
}
