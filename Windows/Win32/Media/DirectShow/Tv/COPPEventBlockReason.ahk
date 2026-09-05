#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class COPPEventBlockReason extends Win32Enum {

    /**
     * Native name: COPP_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Native name: COPP_BadDriver
     * @type {Integer (Int32)}
     */
    static BadDriver => 0

    /**
     * Native name: COPP_NoCardHDCPSupport
     * @type {Integer (Int32)}
     */
    static NoCardHDCPSupport => 1

    /**
     * Native name: COPP_NoMonitorHDCPSupport
     * @type {Integer (Int32)}
     */
    static NoMonitorHDCPSupport => 2

    /**
     * Native name: COPP_BadCertificate
     * @type {Integer (Int32)}
     */
    static BadCertificate => 3

    /**
     * Native name: COPP_InvalidBusProtection
     * @type {Integer (Int32)}
     */
    static InvalidBusProtection => 4

    /**
     * Native name: COPP_AeroGlassOff
     * @type {Integer (Int32)}
     */
    static AeroGlassOff => 5

    /**
     * Native name: COPP_RogueApp
     * @type {Integer (Int32)}
     */
    static RogueApp => 6

    /**
     * Native name: COPP_ForbiddenVideo
     * @type {Integer (Int32)}
     */
    static ForbiddenVideo => 7

    /**
     * Native name: COPP_Activate
     * @type {Integer (Int32)}
     */
    static Activate => 8

    /**
     * Native name: COPP_DigitalAudioUnprotected
     * @type {Integer (Int32)}
     */
    static DigitalAudioUnprotected => 9
}
