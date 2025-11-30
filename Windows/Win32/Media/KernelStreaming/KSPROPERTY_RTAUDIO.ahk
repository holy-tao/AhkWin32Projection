#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_RTAUDIO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_GETPOSITIONFUNCTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_BUFFER => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_HWLATENCY => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_POSITIONREGISTER => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_CLOCKREGISTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_BUFFER_WITH_NOTIFICATION => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_REGISTER_NOTIFICATION_EVENT => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_UNREGISTER_NOTIFICATION_EVENT => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_QUERY_NOTIFICATION_SUPPORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_PACKETCOUNT => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_PRESENTATION_POSITION => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_GETREADPACKET => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_SETWRITEPACKET => 12

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RTAUDIO_PACKETVREGISTER => 13
}
