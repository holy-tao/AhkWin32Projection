#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the input frames for an encoder are progressive or interlaced. This enumeration is used with the AVEncVideoForceSourceScanType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideosourcescantype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncVideoSourceScanType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the media type on the encoder's input pin to determine whether the frames are progressive or interlaced.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoSourceScan_Automatic => 0

    /**
     * Input frames are interlaced.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoSourceScan_Interlaced => 1

    /**
     * Input frames are progressive.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoSourceScan_Progressive => 2
}
