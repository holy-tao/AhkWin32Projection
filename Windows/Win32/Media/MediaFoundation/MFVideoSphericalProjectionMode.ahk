#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoSphericalProjectionMode {
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
    static MFVideoSphericalProjectionMode_Spherical => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalProjectionMode_Flat => 1
}
