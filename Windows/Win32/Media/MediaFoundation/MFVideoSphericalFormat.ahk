#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoSphericalFormat {
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
    static MFVideoSphericalFormat_Unsupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalFormat_Equirectangular => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalFormat_CubeMap => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFVideoSphericalFormat_3DMesh => 3
}
