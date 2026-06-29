#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPADAPTATIONSETTINGS {
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
    static SPADS_Default => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_CurrentRecognizer => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_RecoProfile => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_Immediate => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_Reset => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPADS_HighVolumeDataSource => 16
}
