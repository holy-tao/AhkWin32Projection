#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFCameraIntrinsic_DistortionModelType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static MFCameraIntrinsic_DistortionModelType_6KT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFCameraIntrinsic_DistortionModelType_ArcTan => 1
}
