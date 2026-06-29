#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of picture that is output by a video encoder.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-videoencodepicturetype">MFSampleExtension_VideoEncodePictureType</a> sample attribute.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavench264picturetype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncH264PictureType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Instantaneous decoding refresh (IDR) picture.
     * @type {Integer (Int32)}
     */
    static eAVEncH264PictureType_IDR => 0

    /**
     * Predictive (B) picture.
     * @type {Integer (Int32)}
     */
    static eAVEncH264PictureType_P => 1

    /**
     * Bi-predictive (B) picture.
     * @type {Integer (Int32)}
     */
    static eAVEncH264PictureType_B => 2
}
