#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of video content.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocontenttype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncVideoContentType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unknown or normal content. (Default.)
     * @type {Integer (Int32)}
     */
    static eAVEncVideoContentType_Unknown => 0

    /**
     * The content was captured with a fixed camera, such as a webcam.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoContentType_FixedCameraAngle => 1
}
