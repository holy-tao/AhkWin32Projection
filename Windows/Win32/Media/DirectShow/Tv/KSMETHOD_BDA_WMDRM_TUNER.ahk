#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSMETHOD_BDA_WMDRM_TUNER {
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
    static KSMETHOD_BDA_WMDRMTUNER_CANCELCAPTURETOKEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_SETPIDPROTECTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_GETPIDPROTECTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_SETSYNCVALUE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_STARTCODEPROFILE => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_PURCHASE_ENTITLEMENT => 5
}
