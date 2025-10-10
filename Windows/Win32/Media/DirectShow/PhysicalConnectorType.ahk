#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the physical type of pin (audio or video).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-physicalconnectortype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class PhysicalConnectorType{

    /**
     * Specifies a tuner pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_Tuner => 1

    /**
     * Specifies a composite pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_Composite => 2

    /**
     * Specifies an S-Video (Y/C video) pin.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SVideo => 3

    /**
     * Specifies an RGB pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_RGB => 4

    /**
     * Specifies a YRYBY (Y, R–Y, B–Y) pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_YRYBY => 5

    /**
     * Specifies a serial digital pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SerialDigital => 6

    /**
     * Specifies a parallel digital pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_ParallelDigital => 7

    /**
     * Specifies a SCSI (Small Computer System Interface) pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SCSI => 8

    /**
     * Specifies an AUX (auxiliary) pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_AUX => 9

    /**
     * Specifies an IEEE 1394 pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_1394 => 10

    /**
     * Specifies a USB (Universal Serial Bus) pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_USB => 11

    /**
     * Specifies a video decoder pin.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_VideoDecoder => 12

    /**
     * Specifies a video encoder pin.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_VideoEncoder => 13

    /**
     * Specifies a SCART (Peritel) pin for video.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SCART => 14

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_Black => 15

    /**
     * Specifies a tuner pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_Tuner => 4096

    /**
     * Specifies a line pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_Line => 4097

    /**
     * Specifies a microphone pin.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_Mic => 4098

    /**
     * Specifies an AES/EBU (Audio Engineering Society/European Broadcast Union) digital pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_AESDigital => 4099

    /**
     * Specifies an S/PDIF (Sony/Philips Digital Interface Format) digital pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_SPDIFDigital => 4100

    /**
     * Specifies a SCSI pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_SCSI => 4101

    /**
     * Specifies an AUX pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_AUX => 4102

    /**
     * Specifies an IEEE 1394 pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_1394 => 4103

    /**
     * Specifies a USB pin for audio.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_USB => 4104

    /**
     * Specifies an audio decoder pin.
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_AudioDecoder => 4105
}
