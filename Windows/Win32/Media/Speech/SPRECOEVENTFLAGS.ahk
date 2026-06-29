#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPRECOEVENTFLAGS {
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
    static SPREF_AutoPause => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_Emulated => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_SMLTimeout => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_ExtendableParse => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_ReSent => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_Hypothesis => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPREF_FalseRecognition => 64
}
