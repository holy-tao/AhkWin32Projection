#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct SpectralInversion {
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
    static BDA_SPECTRAL_INVERSION_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_AUTOMATIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_INVERTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_MAX => 4
}
