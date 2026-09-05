#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class MEDIA_BLANK_TYPE extends Win32Enum {

    /**
     * Native name: MediaBlankTypeFull
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * Native name: MediaBlankTypeMinimal
     * @type {Integer (Int32)}
     */
    static Minimal => 1

    /**
     * Native name: MediaBlankTypeIncompleteTrack
     * @type {Integer (Int32)}
     */
    static IncompleteTrack => 2

    /**
     * Native name: MediaBlankTypeUnreserveLastTrack
     * @type {Integer (Int32)}
     */
    static UnreserveLastTrack => 3

    /**
     * Native name: MediaBlankTypeTrackTail
     * @type {Integer (Int32)}
     */
    static TrackTail => 4

    /**
     * Native name: MediaBlankTypeUncloseLastSession
     * @type {Integer (Int32)}
     */
    static UncloseLastSession => 5

    /**
     * Native name: MediaBlankTypeEraseLastSession
     * @type {Integer (Int32)}
     */
    static EraseLastSession => 6
}
