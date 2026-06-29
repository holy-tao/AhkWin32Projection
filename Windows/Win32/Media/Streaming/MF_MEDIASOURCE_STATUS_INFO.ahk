#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * . (MF_MEDIASOURCE_STATUS_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_mediasource_status_info
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct MF_MEDIASOURCE_STATUS_INFO {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The media source is fully supported.
     * @type {Integer (Int32)}
     */
    static MF_MEDIASOURCE_STATUS_INFO_FULLYSUPPORTED => 0

    /**
     * The status is unknown.
     * 
     * >>>>>>> master
     * @type {Integer (Int32)}
     */
    static MF_MEDIASOURCE_STATUS_INFO_UNKNOWN => 1
}
