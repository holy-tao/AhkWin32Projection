#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_PhysicalConnectorType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_Tuner => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_Composite => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_SVideo => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_RGB => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_YRYBY => 5

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_SerialDigital => 6

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_ParallelDigital => 7

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_SCSI => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_AUX => 9

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_1394 => 10

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_USB => 11

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_VideoDecoder => 12

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_VideoEncoder => 13

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Video_SCART => 14

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_Tuner => 4096

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_Line => 4097

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_Mic => 4098

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_AESDigital => 4099

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_SPDIFDigital => 4100

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_SCSI => 4101

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_AUX => 4102

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_1394 => 4103

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_USB => 4104

    /**
     * @type {Integer (Int32)}
     */
    static KS_PhysConn_Audio_AudioDecoder => 4105
}
