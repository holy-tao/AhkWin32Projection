#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AMBISONICS_NORMALIZATION {
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
    static AMBISONICS_NORMALIZATION_SN3D => 0

    /**
     * @type {Integer (Int32)}
     */
    static AMBISONICS_NORMALIZATION_N3D => 1
}
