#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_RTAUDIO extends Win32Enum {

    /**
     * Native name: KSPROPERTY_RTAUDIO_GETPOSITIONFUNCTION
     * @type {Integer (Int32)}
     */
    static GETPOSITIONFUNCTION => 0

    /**
     * Native name: KSPROPERTY_RTAUDIO_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 1

    /**
     * Native name: KSPROPERTY_RTAUDIO_HWLATENCY
     * @type {Integer (Int32)}
     */
    static HWLATENCY => 2

    /**
     * Native name: KSPROPERTY_RTAUDIO_POSITIONREGISTER
     * @type {Integer (Int32)}
     */
    static POSITIONREGISTER => 3

    /**
     * Native name: KSPROPERTY_RTAUDIO_CLOCKREGISTER
     * @type {Integer (Int32)}
     */
    static CLOCKREGISTER => 4

    /**
     * Native name: KSPROPERTY_RTAUDIO_BUFFER_WITH_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static BUFFER_WITH_NOTIFICATION => 5

    /**
     * Native name: KSPROPERTY_RTAUDIO_REGISTER_NOTIFICATION_EVENT
     * @type {Integer (Int32)}
     */
    static REGISTER_NOTIFICATION_EVENT => 6

    /**
     * Native name: KSPROPERTY_RTAUDIO_UNREGISTER_NOTIFICATION_EVENT
     * @type {Integer (Int32)}
     */
    static UNREGISTER_NOTIFICATION_EVENT => 7

    /**
     * Native name: KSPROPERTY_RTAUDIO_QUERY_NOTIFICATION_SUPPORT
     * @type {Integer (Int32)}
     */
    static QUERY_NOTIFICATION_SUPPORT => 8

    /**
     * Native name: KSPROPERTY_RTAUDIO_PACKETCOUNT
     * @type {Integer (Int32)}
     */
    static PACKETCOUNT => 9

    /**
     * Native name: KSPROPERTY_RTAUDIO_PRESENTATION_POSITION
     * @type {Integer (Int32)}
     */
    static PRESENTATION_POSITION => 10

    /**
     * Native name: KSPROPERTY_RTAUDIO_GETREADPACKET
     * @type {Integer (Int32)}
     */
    static GETREADPACKET => 11

    /**
     * Native name: KSPROPERTY_RTAUDIO_SETWRITEPACKET
     * @type {Integer (Int32)}
     */
    static SETWRITEPACKET => 12

    /**
     * Native name: KSPROPERTY_RTAUDIO_PACKETVREGISTER
     * @type {Integer (Int32)}
     */
    static PACKETVREGISTER => 13
}
