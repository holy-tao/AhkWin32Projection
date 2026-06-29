#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVPRIORITY {
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
    static SPVPRI_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPVPRI_ALERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPVPRI_OVER => 2
}
