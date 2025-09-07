#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class MEDIA_BLANK_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static MediaBlankTypeFull => 0

    /**
     * @type {Integer (Int32)}
     */
    static MediaBlankTypeMinimal => 1

    /**
     * @type {Integer (Int32)}
     */
    static MediaBlankTypeIncompleteTrack => 2

    /**
     * @type {Integer (Int32)}
     */
    static MediaBlankTypeUnreserveLastTrack => 3

    /**
     * @type {Integer (Int32)}
     */
    static MediaBlankTypeTrackTail => 4

    /**
     * @type {Integer (Int32)}
     */
    static MediaBlankTypeUncloseLastSession => 5

    /**
     * @type {Integer (Int32)}
     */
    static MediaBlankTypeEraseLastSession => 6
}
