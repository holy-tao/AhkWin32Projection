#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct COPPEventBlockReason {
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
    static COPP_Unknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static COPP_BadDriver => 0

    /**
     * @type {Integer (Int32)}
     */
    static COPP_NoCardHDCPSupport => 1

    /**
     * @type {Integer (Int32)}
     */
    static COPP_NoMonitorHDCPSupport => 2

    /**
     * @type {Integer (Int32)}
     */
    static COPP_BadCertificate => 3

    /**
     * @type {Integer (Int32)}
     */
    static COPP_InvalidBusProtection => 4

    /**
     * @type {Integer (Int32)}
     */
    static COPP_AeroGlassOff => 5

    /**
     * @type {Integer (Int32)}
     */
    static COPP_RogueApp => 6

    /**
     * @type {Integer (Int32)}
     */
    static COPP_ForbiddenVideo => 7

    /**
     * @type {Integer (Int32)}
     */
    static COPP_Activate => 8

    /**
     * @type {Integer (Int32)}
     */
    static COPP_DigitalAudioUnprotected => 9
}
