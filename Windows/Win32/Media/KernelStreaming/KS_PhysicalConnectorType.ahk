#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_PhysicalConnectorType extends Win32Enum {

    /**
     * Native name: KS_PhysConn_Video_Tuner
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_Tuner => 1

    /**
     * Native name: KS_PhysConn_Video_Composite
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_Composite => 2

    /**
     * Native name: KS_PhysConn_Video_SVideo
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SVideo => 3

    /**
     * Native name: KS_PhysConn_Video_RGB
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_RGB => 4

    /**
     * Native name: KS_PhysConn_Video_YRYBY
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_YRYBY => 5

    /**
     * Native name: KS_PhysConn_Video_SerialDigital
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SerialDigital => 6

    /**
     * Native name: KS_PhysConn_Video_ParallelDigital
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_ParallelDigital => 7

    /**
     * Native name: KS_PhysConn_Video_SCSI
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SCSI => 8

    /**
     * Native name: KS_PhysConn_Video_AUX
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_AUX => 9

    /**
     * Native name: KS_PhysConn_Video_1394
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_1394 => 10

    /**
     * Native name: KS_PhysConn_Video_USB
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_USB => 11

    /**
     * Native name: KS_PhysConn_Video_VideoDecoder
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_VideoDecoder => 12

    /**
     * Native name: KS_PhysConn_Video_VideoEncoder
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_VideoEncoder => 13

    /**
     * Native name: KS_PhysConn_Video_SCART
     * @type {Integer (Int32)}
     */
    static PhysConn_Video_SCART => 14

    /**
     * Native name: KS_PhysConn_Audio_Tuner
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_Tuner => 4096

    /**
     * Native name: KS_PhysConn_Audio_Line
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_Line => 4097

    /**
     * Native name: KS_PhysConn_Audio_Mic
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_Mic => 4098

    /**
     * Native name: KS_PhysConn_Audio_AESDigital
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_AESDigital => 4099

    /**
     * Native name: KS_PhysConn_Audio_SPDIFDigital
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_SPDIFDigital => 4100

    /**
     * Native name: KS_PhysConn_Audio_SCSI
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_SCSI => 4101

    /**
     * Native name: KS_PhysConn_Audio_AUX
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_AUX => 4102

    /**
     * Native name: KS_PhysConn_Audio_1394
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_1394 => 4103

    /**
     * Native name: KS_PhysConn_Audio_USB
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_USB => 4104

    /**
     * Native name: KS_PhysConn_Audio_AudioDecoder
     * @type {Integer (Int32)}
     */
    static PhysConn_Audio_AudioDecoder => 4105
}
