#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechMMSysAudio {
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
    static DISPID_SMSADeviceId => 300

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SMSALineId => 301

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SMSAMMHandle => 302
}
