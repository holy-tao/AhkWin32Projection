#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the type of transport used in streaming or downloading data (TCP or UDP).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_transport_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFNETSOURCE_TRANSPORT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The data transport type is UDP.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_UDP => 0

    /**
     * The data transport type is TCP.
     * @type {Integer (Int32)}
     */
    static MFNETSOURCE_TCP => 1
}
