#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct FEEDS_ERROR_CODE {
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
    static FEC_E_ERRORBASE => -1073479168

    /**
     * @type {Integer (Int32)}
     */
    static FEC_E_INVALIDMSXMLPROPERTY => -1073479168

    /**
     * @type {Integer (Int32)}
     */
    static FEC_E_DOWNLOADSIZELIMITEXCEEDED => -1073479167
}
