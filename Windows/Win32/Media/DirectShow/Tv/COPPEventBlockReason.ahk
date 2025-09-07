#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class COPPEventBlockReason{

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
